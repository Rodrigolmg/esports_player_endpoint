part of model;

class SportModel extends SportEntity {

  SportModel({
    required int id,
    String? name,
    String? slug,
  }) : super(
    id: id,
    name: name,
    slug: slug
  );

  factory SportModel.fromJson(Map<String, dynamic> json) {
    SportModel sportModel = SportModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
    );

    return sportModel;
  }
}