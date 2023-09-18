import 'dart:convert';

import 'package:esports_player_endpoint/data/model/model.dart';
import 'package:esports_player_endpoint/domain/entity/entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../fixtures/json_file_name.dart';

void main() {

  TeamModel teamModel = TeamModel(
    id: 5
  );

  test('Should be a subclass of ColorEntity',
    () => expect(teamModel, isA<TeamEntity>())
  );

  group('fromJson', () {
    test('Should return a SportModel from a JSON', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(teamJson));
      final result = TeamModel.fromJson(json);
      expect(result, isA<TeamModel>());
    });

    test('Should contain a value in the TeamModel id field', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(teamJson));
      final result = TeamModel.fromJson(json);
      expect(result.id, isNotNull);
    });

    test('Should contain a object of CountryModel from JSON', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(teamJson));
      final result = TeamModel.fromJson(json);
      expect(result.country?.name, isNotNull);
    });

    test('Should contain a object of ColorModel from JSON', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(teamJson));
      final result = TeamModel.fromJson(json);
      expect(result.teamColors?.text, isNotNull);
    });

    test('Should contain a object of SportModel from JSON', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(teamJson));
      final result = TeamModel.fromJson(json);
      expect(result.sport?.name, isNotNull);
    });
  });
}