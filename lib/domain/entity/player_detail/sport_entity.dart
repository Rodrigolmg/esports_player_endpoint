part of entity;

class SportEntity extends HiveObject {

  final int id;
  final String? name;
  final String? slug;

  SportEntity({
    required this.id,
    this.name,
    this.slug,
  });
}