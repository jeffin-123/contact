import 'package:hive/hive.dart';
part 'hive.g.dart';

@HiveType(typeId: 0)
class HiveContact {

  @HiveField(0)
  final String givenName;

  @HiveField(1)
  final String familyName;

  @HiveField(2)
  final String company;

  @HiveField(3)
  final String phones;

  @HiveField(4)
  final String emails;

  @HiveField(5)
  bool isFavorite;

   HiveContact ({required this.givenName,
    required this.familyName,
    required this.company,
    required this.phones,
    required this.emails,
     this.isFavorite = false,});

  void removeAt(int index) {}
}