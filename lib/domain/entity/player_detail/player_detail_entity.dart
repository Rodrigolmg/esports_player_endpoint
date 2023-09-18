part of entity;

@HiveType(typeId: 1)
class PlayerDetailEntity extends HiveObject {

  @HiveField(0)
  final int id;

  @HiveField(1)
  final CountryEntity? country;

  @HiveField(2)
  final int? dateOfBirthTimestamp;

  @HiveField(3)
  final String? firstName;

  @HiveField(4)
  final String? lastName;

  @HiveField(5)
  final String? name;

  @HiveField(6)
  final String? position;

  @HiveField(7)
  final String? shortName;

  @HiveField(8)
  final String? slug;

  @HiveField(9)
  final TeamEntity? team;

  @HiveField(10)
  final int? userCount;

  PlayerDetailEntity({
    required this.id,
    this.country,
    this.dateOfBirthTimestamp,
    this.firstName,
    this.lastName,
    this.name,
    this.position,
    this.shortName,
    this.slug,
    this.team,
    this.userCount,
  });
}