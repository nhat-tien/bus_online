class Tram {
  final String maTram;
  final String tenTram;
  final String thuTuTram;

  Tram({required this.maTram, required this.tenTram, required this.thuTuTram});

  factory Tram.fromJson(Map<String, dynamic> json) {
    return Tram(
      maTram: json['maTram'] as String,
      tenTram: json['tram']['tenTram'] as String,
      thuTuTram: json['thuTuTram'] ?? "",
    );
  }
}
