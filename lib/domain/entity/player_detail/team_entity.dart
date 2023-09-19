part of entity;

class TeamEntity extends HiveObject{

  final int id;
  final CountryEntity? country;
  final String? name;
  final String? nameCode;
  final bool? national;
  final String? shortName;
  final String? slug;
  final SportEntity? sport;
  final ColorEntity? teamColors;
  final int? type;
  final int? userCount;

  TeamEntity({
    required this.id,
    this.country,
    this.name,
    this.nameCode,
    this.national,
    this.shortName,
    this.slug,
    this.sport,
    this.teamColors,
    this.type,
    this.userCount,
  });
}