import 'dart:convert';

import 'package:esports_player_endpoint/data/model/model.dart';
import 'package:esports_player_endpoint/domain/entity/entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../fixtures/json_file_name.dart';

void main() {
  PlayerDetailModel playerDetailModel = PlayerDetailModel(
    id: 5
  );

  test('Should be a subclass of PlayerDetailEntity',
    () => expect(playerDetailModel, isA<PlayerDetailEntity>())
  );

  group('fromJson', () {
    test('Should return a PlayerDetailModel from a JSON', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(playerJson));
      final result = PlayerDetailModel.fromJson(json);
      expect(result, isA<PlayerDetailModel>());
    });

    test('Should contain a value in the PlayerDetailModel id field', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(playerJson));
      final result = PlayerDetailModel.fromJson(json);
      expect(result.id, isNotNull);
    });

    test('Should contain a object of CountryModel from JSON', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(playerJson));
      final result = PlayerDetailModel.fromJson(json);
      expect(result.country?.name, isNotNull);
    });

    test('Should contain a object of TeamModel from JSON', () async {
      final Map<String, dynamic> json = jsonDecode(readFixture(playerJson));
      final result = PlayerDetailModel.fromJson(json);
      expect(result.team?.name, isNotNull);
    });
  });
}