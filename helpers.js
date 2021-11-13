module.exports.convertToSTGeomFromText = (type, coordinates) => {
  let STGeomFromText;
  switch (type) {
    case "Point":
      STGeomFromText = `POINT (${coordinates.join(" ")})`;
      break;
    case "Polygon":
      STGeomFromText = `POLYGON (${coordinates
        .map((poly) => poly.map((c) => c.join(" ")).join(", "))
        .map((poly) => `(${poly})`)
        .join(", ")})`;
      break;
    case "LineString":
      STGeomFromText = `LINESTRING (${coordinates.map((c) => c.join(" ")).join(", ")})`;
      break;
  }

  return STGeomFromText && `geometry::STGeomFromText('${STGeomFromText}', 0)`;
};
