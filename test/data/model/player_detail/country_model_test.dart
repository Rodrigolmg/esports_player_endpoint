import 'dart:convert';

import 'package:esports_player_endpoint/data/model/model.dart';
import 'package:esports_player_endpoint/domain/entity/entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../fixtures/json_file_name.dart';

void main() {
  CountryModel countryModel = CountryModel();

  test('Should be a subclass of CountryEntity',
    () => expect(countryModel, isA<CountryEntity>())
  );

  group('fromJson', () {
    test('Should return a CountryModel from a JSON', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(countryJson));
      final result = CountryModel.fromJson(json);
      expect(result, isA<CountryModel>());
    });

    test('Should contain a value in the alpha2 field', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(countryJson));
      final result = CountryModel.fromJson(json);
      expect(result.alpha2, isNotNull);
    });
  });
}