class Tram {
  final String maTram;
  final String tenTram;
  final String thuTuTram;
	int soNguoiDen;

  Tram({required this.maTram, required this.tenTram, required this.thuTuTram, required this.soNguoiDen});

  factory Tram.fromJson(Map<String, dynamic> json) {
    return Tram(
      maTram: json['maTram'] as String,
      tenTram: json['tram']['tenTram'] as String,
      thuTuTram: json['thuTuTram'] ?? "",
			soNguoiDen: 0,
    );
  }

	void setSoNguoiDen(int num) {
	   soNguoiDen = num; 
	}

	int getSoNguoiDen(int num) {
		return soNguoiDen;
	}
}
