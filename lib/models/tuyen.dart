class Tuyen {
  final String maTuyen;
  final String tenTuyen;

  Tuyen({required this.maTuyen, required this.tenTuyen});

  factory Tuyen.fromJson(Map<String, dynamic> json) {
    return Tuyen(
			maTuyen: json['maTuyen'] as String, 
			tenTuyen: json['tenTuyen'] as String)
    ;
  }
}
