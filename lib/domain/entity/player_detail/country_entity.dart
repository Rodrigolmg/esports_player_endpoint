part of entity;

class CountryEntity extends HiveObject {

  final String? alpha2;
  final String? name;

  CountryEntity({
    this.alpha2,
    this.name,
  });
}