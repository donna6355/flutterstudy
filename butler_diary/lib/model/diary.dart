import 'package:hive/hive.dart';

part 'diary.g.dart';

@HiveType(typeId: 1)
class Diary extends HiveObject {
  @HiveField(0)
  String? date;
  @HiveField(1)
  double? dryFood;
  @HiveField(2)
  double? wetFood;
  @HiveField(3)
  double? water;
  @HiveField(4)
  bool? waterySnack;
  @HiveField(5)
  bool? drySnack;
  @HiveField(6)
  bool? snack;
  @HiveField(7)
  double? pee;
  @HiveField(8)
  double? poo;
  @HiveField(9)
  bool? hairBall;
  @HiveField(10)
  bool? diarrhea;
  @HiveField(11)
  bool? vomit;
  @HiveField(12)
  bool? destroy;
  @HiveField(13)
  bool? vet;
  @HiveField(14)
  bool? vaccine;
  @HiveField(15)
  bool? pill;
  @HiveField(16)
  bool? eyeDrop;
  @HiveField(17)
  bool? hunting;
  @HiveField(18)
  bool? brushTeeth;
  @HiveField(19)
  bool? brushFur;
  @HiveField(20)
  bool? bath;
  @HiveField(21)
  bool? toilet;
  @HiveField(22)
  String? note;
  @HiveField(23)
  List? photos;

  Diary(
      {this.date,
      this.dryFood,
      this.wetFood,
      this.water,
      this.waterySnack,
      this.drySnack,
      this.snack,
      this.pee,
      this.poo,
      this.hairBall,
      this.diarrhea,
      this.vomit,
      this.destroy,
      this.vet,
      this.vaccine,
      this.pill,
      this.eyeDrop,
      this.hunting,
      this.brushTeeth,
      this.brushFur,
      this.bath,
      this.toilet,
      this.note,
      this.photos});
}
