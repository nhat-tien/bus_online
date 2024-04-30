

String formatCurrency(String rawStr) {
	List<String> danhSachCacBoBaSo = [];
	int end = rawStr.length;
	int start = end - 3; 
	while(start > 0) {
	  var boBaSo = rawStr.substring(start, end);
	  danhSachCacBoBaSo.insert(0,boBaSo);
	  end-=3;
	  start-=3;
	}
	var boBaSo = rawStr.substring(0, end);
	danhSachCacBoBaSo.insert(0, boBaSo);
  return danhSachCacBoBaSo.join('.');
}
