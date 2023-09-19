part of model;

class ColorModel extends ColorEntity {

  ColorModel({
    String? primary,
    String? secondary,
    String? text,
  }) : super(
    primary: primary,
    secondary: secondary,
    text: text
  );

  factory ColorModel.fromJson(Map<String, dynamic> json) {
    ColorModel colorModel = ColorModel(
      primary: json['primary'],
      secondary: json['secondary'],
      text: json['text']
    );

    return colorModel;
  }
}