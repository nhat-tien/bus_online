String formatDate(String format, String rawString) {
  final year = rawString.substring(0, 4);
  final month = rawString.substring(5, 7);
  final day = rawString.substring(8, 10);
	final hour = rawString.substring(11, 13);
	final minute = rawString.substring(14, 16);
	final second = rawString.substring(17, 19);
  String result = format.replaceFirst(RegExp('Y'), year);
  result = result.replaceFirst(RegExp('m'), month);
  result = result.replaceFirst(RegExp('d'), day);
  result = result.replaceFirst(RegExp('H'), hour);
  result = result.replaceFirst(RegExp('M'), minute);
  result = result.replaceFirst(RegExp('S'), second);
  return result;
}
