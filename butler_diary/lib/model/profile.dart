class Profile {
  final String name;
  final DateTime birth;
  final int gender;
  String? photo;
  double? weight;
  String? remark;

  Profile({
    required this.name,
    required this.birth,
    required this.gender,
    this.photo,
    this.weight,
    this.remark,
  });
}
