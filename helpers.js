const path = require("path");
const fs = require("fs");
const jwt = require("jsonwebtoken");
const turf = require('@turf/turf')

const JWT_SECRET = process.env.JWT_SECRET || "secret";
const VNGeoJSON = JSON.parse(
  fs.readFileSync(path.join(__dirname, "./diaphantinh.geojson"), "utf-8")
);

module.exports.convertToSTGeomFromText = (type, coordinates) => {
  let STGeomFromText;
  switch (type) {
    case "Point":
      if (!Array.isArray(coordinates)) throw new Error();

      STGeomFromText = `POINT (${coordinates.join(" ")})`;
      break;
    case "Polygon":
      if (!Array.isArray(coordinates)) throw new Error();
      if (coordinates.some((c1) => !Array.isArray(c1))) throw new Error();
      if (coordinates.some((c1) => c1.some((c2) => !Array.isArray(c2)))) throw new Error();

      STGeomFromText = `POLYGON (${coordinates
        .map((poly) => poly.map((c) => c.join(" ")).join(", "))
        .map((poly) => `(${poly})`)
        .join(", ")})`;
      break;
    case "LineString":
      if (!Array.isArray(coordinates)) throw new Error();
      if (coordinates.some((c1) => !Array.isArray(c1))) throw new Error();
      STGeomFromText = `LINESTRING (${coordinates.map((c) => c.join(" ")).join(", ")})`;
      break;
  }

  return STGeomFromText && `geometry::STGeomFromText('${STGeomFromText}', 0)`;
};

module.exports.searchTinh = (_coordinate) => {
  const coordinate = [..._coordinate].reverse();
  for (const feature of VNGeoJSON.features) {
    try {
      const point = turf.point(coordinate);
      const polygon = turf.multiPolygon(feature.geometry.coordinates);

      if (turf.booleanPointInPolygon(point, polygon)) {
        return feature.properties.gid;
      }
    } catch {
    }
  }
  return undefined
};

module.exports.authorizeMiddleware = (req, res, next) => {
  const token = req.headers.authorization;

  if (!token) {
    return res.status(401).json({ fail: "unauthorize: missing token" });
  }
  try {
    req.auth = jwt.verify(token, JWT_SECRET);
    next();
  } catch (err) {
    return res.status(401).json({ fail: "unauthorize: invalid token" });
  }
};
