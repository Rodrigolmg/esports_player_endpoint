import 'package:dartz/dartz.dart';
import 'package:esports_player_endpoint/domain/entity/entity.dart';
import 'package:esports_player_endpoint/domain/repository/repository_contract.dart';
import 'package:esports_player_endpoint/domain/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<PlayerDetailRepository>()])
import 'get_player_details_usecase_test.mocks.dart';

void main() {

  late GetPlayerDetailsUseCase useCase;
  late MockPlayerDetailRepository mockRepository;

  setUp(() {
    mockRepository = MockPlayerDetailRepository();
    useCase = GetPlayerDetailsUseCase(repository: mockRepository);
  });

  const int tPlayerId = 1;

  PlayerDetailEntity playerDetail = PlayerDetailEntity(
    id: tPlayerId
  );

  test('Should get Right value', () async {

    when(mockRepository.getPlayerDetails(any))
        .thenAnswer((_) async => Right(playerDetail));

    final result = await useCase(tPlayerId);

    expect(result, Right(playerDetail));
    verify(mockRepository.getPlayerDetails(tPlayerId));
    verifyNoMoreInteractions(mockRepository);
  });

}