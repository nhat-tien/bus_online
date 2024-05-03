import 'package:bus_online/models/chuyen_xe.dart';

class DonTra {
	final String id;
	final String maChuyen;
	final String maKhachHang;
	final String maTramDi;
	final String tenTramDi;
	final String maTramDen;
	final String tenTramDen;
	final bool hoanThanh;
	final String? trangThaiThanhToan;
	final String tienPhi;
	final String soLuong;
	final String createdAt;
	final ChuyenXe chuyenXe;
	final String tenHanhKhach;
	final String chieu;

	DonTra({
     required this.id,
     required this.maChuyen,
     required this.maKhachHang,
     required this.maTramDi,
     required this.maTramDen,
     required this.hoanThanh,
     required this.trangThaiThanhToan,
     required this.tienPhi,
		required this.tenTramDi,
		required this.tenTramDen,
		required this.soLuong,
		required this.createdAt,
		required this.chuyenXe,
		required this.tenHanhKhach,
		required this.chieu,
	});

 factory DonTra.fromJson(Map<String, dynamic> json) {
		final ChuyenXe chuyenXe = ChuyenXe(
			maChuyen: json['chuyenXe']['maChuyen'] as String, 
			gioLuotDi: json['chuyenXe']['gioLuotDi'] as String,
			gioLuotVe: json['chuyenXe']['gioLuotVe'] as String,
			maXe: json['chuyenXe']['maXe'] as String,
		);
   return DonTra(
		id : json['id'].toString(),
		maChuyen: json['maChuyen'] as String,
		maKhachHang: json['maKhachHang'].toString(),
		maTramDi: json['maTramDi'] as String,
		tenTramDi: json['tramDi']['tenTram'] as String,
		maTramDen: json['maTramDen'] as String,
		tenTramDen: json['tramDen']['tenTram'] as String,
		hoanThanh: json['hoanThanh'],
		trangThaiThanhToan: json['trangThaiThanhToan'],
		tienPhi: json['tienPhi'] as String,
		soLuong : json['soLuong'].toString(),
		createdAt : json['createdAt'] as String,
		chuyenXe: chuyenXe,
		tenHanhKhach: json['khachHang']['name'] as String,
		chieu: json['chieu'] as String,
	);
	}

  
}
