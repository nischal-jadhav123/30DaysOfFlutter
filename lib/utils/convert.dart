class Convert {
  static List<double> convertStringToDouble(List<dynamic> values) {
    List<double> data = [];
    for (var val in values) {
      data.add(val != null ? double.parse(val) : 0.0);
    }
    return data;
  }

  static String trimPrice(String price) {
    if (price == null) return "Not Found";
    var arr = price.split(".");
    if (arr.isEmpty) return "Not Found";
    if (arr.length > 1) {
      var temp = arr[1].substring(0, 3);
      return "${arr[0]}.$temp";
    }
    return arr[0];
  }
}
