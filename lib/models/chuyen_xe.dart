class ChuyenXe {
	final String maChuyen;
	final String gioLuotDi;
	final String gioLuotVe;

	ChuyenXe({required this.maChuyen, required this.gioLuotDi, required this.gioLuotVe});

 factory ChuyenXe.fromJson(Map<String, dynamic> json) {
   return ChuyenXe(
		maChuyen: json['maChuyen'] as String,
		gioLuotDi: json['gioLuotDi'] as String,
		gioLuotVe: json['gioLuotVe'] as String
	);
	}
  
}
