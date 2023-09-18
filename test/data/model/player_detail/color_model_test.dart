import 'dart:convert';

import 'package:esports_player_endpoint/data/model/model.dart';
import 'package:esports_player_endpoint/domain/entity/entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../fixtures/json_file_name.dart';

void main() {
  ColorModel colorModel = ColorModel();

  test('Should be a subclass of ColorEntity',
    () => expect(colorModel, isA<ColorEntity>())
  );

  group('fromJson', () {
    test('Should return a ColorModel from a JSON', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(colorJson));
      final result = ColorModel.fromJson(json);
      expect(result, isA<ColorModel>());
    });

    test('Should contain a value in the ColorModel fields', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(colorJson));
      final result = ColorModel.fromJson(json);
      expect(result.text, isNotNull);
    });
  });
}