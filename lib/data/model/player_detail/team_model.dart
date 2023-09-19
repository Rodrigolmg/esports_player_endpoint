part of model;

class TeamModel extends TeamEntity{

  TeamModel({
    required int id,
    CountryEntity? country,
    String? name,
    String? nameCode,
    bool? national,
    String? shortName,
    String? slug,
    SportEntity? sport,
    ColorEntity? teamColors,
    int? type,
    int? userCount,
  }) : super(
    id: id,
    country: country,
    name: name,
    nameCode: nameCode,
    national: national,
    shortName: shortName,
    slug: slug,
    sport: sport,
    teamColors: teamColors,
    type: type,
    userCount: userCount
  );

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    TeamModel teamModel = TeamModel(
      id: json['id'],
      country: CountryModel.fromJson(json['country']),
      name: json['name'],
      nameCode: json['nameCode'],
      national: json['national'],
      shortName: json['shortName'],
      slug: json['slug'],
      sport: SportModel.fromJson(json['sport']),
      teamColors: ColorModel.fromJson(json['teamColors']),
      type: json['type'],
      userCount: json['userCount']
    );

    return teamModel;
  }
}