module.exports.convertToSTGeomFromTextValue = (type, coordinates) => {
  switch (type) {
    case "Point":
      return `POINT (${coordinates.join(" ")})`;
    case "Polygon":
      return `POLYGON ((${coordinates.map((c) => c.join(" ")).join(", ")}))`;
    case "LineString":
      return `LINESTRING (${coordinates.map((c) => c.join(" ")).join(", ")})`;
  }
};
