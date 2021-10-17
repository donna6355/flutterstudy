import 'package:hive/hive.dart';

part 'profile.g.dart';

@HiveType(typeId: 2)
class Profile {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final DateTime birth;
  @HiveField(2)
  final int gender;
  @HiveField(3)
  String? photo;
  @HiveField(4)
  double? weight;
  @HiveField(5)
  String? remark;
  @HiveField(6)
  String id;

  Profile({
    required this.name,
    required this.birth,
    required this.gender,
    required this.id,
    this.photo,
    this.weight,
    this.remark,
  });
}
