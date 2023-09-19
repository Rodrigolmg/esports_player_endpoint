import 'dart:convert';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:esports_player_endpoint/domain/repository/repository_contract.dart';
import 'package:esports_player_endpoint/domain/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<PlayerImageRepository>()])
import 'get_player_image_usecase_test.mocks.dart';

void main(){

  late GetPlayerImageUseCase useCase;
  late MockPlayerImageRepository mockRepository;

  setUp(() {
    mockRepository = MockPlayerImageRepository();
    useCase = GetPlayerImageUseCase(repository: mockRepository);
  });

  const int tPlayerId = 1;

  Uint8List bytes = base64Decode('uYJTHLAssjhaIOPl');

  test('Should get Right value', () async {

  when(mockRepository.getPlayerImage(any))
    .thenAnswer((_) async => Right(bytes));

    final result = await useCase(tPlayerId);

    expect(result, Right(bytes));
    verify(mockRepository.getPlayerImage(tPlayerId));
    verifyNoMoreInteractions(mockRepository);
  });
}