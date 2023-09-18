part of model;

class CountryModel extends CountryEntity {

  CountryModel({
    String? alpha2,
    String? name,
  }) : super(
    alpha2: alpha2,
    name: name
  );

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    CountryModel countryModel = CountryModel(
      alpha2: json['alpha2'],
      name: json['name'],
    );

    return countryModel;
  }
}