String parseQueryString(Map<String, String?> queryParams) {
  String result = "?";

  queryParams.forEach((key, value) {
    result += '$key=$value&';
  });

  return result;
}
