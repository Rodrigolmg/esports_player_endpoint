part of model;

class PlayerDetailModel extends PlayerDetailEntity{

  PlayerDetailModel({
    required int id,
    CountryEntity? country,
    int? dateOfBirthTimestamp,
    String? firstName,
    String? lastName,
    String? name,
    String? position,
    String? shortName,
    String? slug,
    TeamEntity? team,
    int? userCount,
  }) : super(
    id: id,
    country: country,
    dateOfBirthTimestamp: dateOfBirthTimestamp,
    firstName: firstName,
    lastName: lastName,
    name: name,
    position: position,
    shortName: shortName,
    slug: slug,
    team: team,
    userCount: userCount
  );

  factory PlayerDetailModel.fromJson(Map<String, dynamic> json) {
    PlayerDetailModel playerDetailModel = PlayerDetailModel(
      id: json['id'],
      country: CountryModel.fromJson(json['country']),
      dateOfBirthTimestamp: json['dateOfBirthTimestamp'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      name: json['name'],
      position: json['position'],
      shortName: json['shortName'],
      slug: json['slug'],
      team: TeamModel.fromJson(json['team']),
      userCount: json['userCount']
    );

    return playerDetailModel;
  }
}
