import 'package:hive/hive.dart';

part 'diary.g.dart';

// flutter pub run build_runner build
@HiveType(typeId: 1)
class Diary extends HiveObject {
  @HiveField(0)
  String date;
  @HiveField(1)
  double dryFood;
  @HiveField(2)
  double wetFood;
  @HiveField(3)
  double water;
  @HiveField(4)
  bool waterySnack;
  @HiveField(5)
  bool drySnack;
  @HiveField(6)
  bool snack;
  @HiveField(7)
  double pee;
  @HiveField(8)
  double poo;
  @HiveField(9)
  bool hairBall;
  @HiveField(10)
  bool diarrhea;
  @HiveField(11)
  bool vomit;
  @HiveField(12)
  bool destroy;
  @HiveField(13)
  bool vet;
  @HiveField(14)
  bool vaccine;
  @HiveField(15)
  bool pill;
  @HiveField(16)
  bool eyeDrop;
  @HiveField(17)
  bool hunting;
  @HiveField(18)
  bool brushTeeth;
  @HiveField(19)
  bool brushFur;
  @HiveField(20)
  bool bath;
  @HiveField(21)
  bool toilet;
  @HiveField(22)
  String note;
  @HiveField(23)
  List photos;
  @HiveField(24)
  bool otherSnack;
  @HiveField(25)
  bool clawCut;
  @HiveField(26)
  double feel;

  Diary(
      {required this.date,
      required this.feel,
      required this.dryFood,
      required this.wetFood,
      required this.water,
      required this.waterySnack,
      required this.drySnack,
      required this.otherSnack,
      required this.snack,
      required this.pee,
      required this.poo,
      required this.hairBall,
      required this.diarrhea,
      required this.vomit,
      required this.destroy,
      required this.vet,
      required this.vaccine,
      required this.pill,
      required this.eyeDrop,
      required this.hunting,
      required this.brushTeeth,
      required this.brushFur,
      required this.clawCut,
      required this.bath,
      required this.toilet,
      required this.note,
      required this.photos});
}
