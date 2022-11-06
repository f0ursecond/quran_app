class asmaul {
  final int id;
  final String latin;
  final String arab;
  final String arti;

  const asmaul(
      {required this.id,
      required this.latin,
      required this.arab,
      required this.arti});

  factory asmaul.fromJson(Map<String, dynamic> json) {
    return asmaul(
      id: json['id'],
      latin: json['latin'],
      arab: json['arab'],
      arti: json['arti'],
    );
  }
}
