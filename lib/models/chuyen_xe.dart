class ChuyenXe {
	final String maChuyen;
	final String? maTuyen;
	final String maXe;
	final String gioLuotDi;
	final String gioLuotVe;

	ChuyenXe({required this.maChuyen, required this.gioLuotDi, required this.gioLuotVe,required this.maXe, this.maTuyen});

 factory ChuyenXe.fromJson(Map<String, dynamic> json) {
   return ChuyenXe(
		maChuyen: json['maChuyen'] as String,
		maTuyen: json['chuyen']?['maTuyen'] ?? "",
		maXe: json['maXe'] as String,
		gioLuotDi: json['gioLuotDi'] as String,
		gioLuotVe: json['gioLuotVe'] as String
	);
	}
  
}
