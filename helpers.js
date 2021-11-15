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
