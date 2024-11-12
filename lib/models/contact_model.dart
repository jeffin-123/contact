
class Contact {
  final String givenName;
  final String familyName;
  final String company;
  final String phones;
  final String emails;
  bool isFavorite;

  Contact({
    required this.givenName,
    required this.familyName,
    required this.company,
    required this.phones,
    required this.emails,
    required this.isFavorite,
  });
}
