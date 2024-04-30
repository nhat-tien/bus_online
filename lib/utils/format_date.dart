
String formatDate(String format, String rawString) {
  final year = rawString.substring(0,4);
	final month = rawString.substring(5,7);
	final day = rawString.substring(8,10);
  String result = format.replaceFirst(RegExp('Y'), year);
	result = result.replaceFirst(RegExp('m'), month);
	result = result.replaceFirst(RegExp('d'), day);
  return result;
}
