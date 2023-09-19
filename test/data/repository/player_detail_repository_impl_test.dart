import 'package:dartz/dartz.dart';
import 'package:esports_player_endpoint/core/core.dart';
import 'package:esports_player_endpoint/data/datasource/datasource.dart';
import 'package:esports_player_endpoint/data/model/model.dart';
import 'package:esports_player_endpoint/data/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<PlayerDetailDataSource>(),
  MockSpec<PlayerDetailLocalDataSource>(),
  MockSpec<NetworkInfo>(),
])
import 'player_detail_repository_impl_test.mocks.dart';

void main() {

  late PlayerDetailRepositoryImpl repositoryImpl;
  late MockPlayerDetailDataSource mockRemoteDataSource;
  late MockPlayerDetailLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockPlayerDetailDataSource();
    mockLocalDataSource = MockPlayerDetailLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = PlayerDetailRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo
    );
  });

  const int tPlayerId = 1;

  PlayerDetailModel? playerDetail = PlayerDetailModel(
      id: tPlayerId
  );

  test('Should check if the device is online', () async {
    when(mockNetworkInfo.isConnected)
        .thenAnswer((_) async => true);

    repositoryImpl.getPlayerDetails(tPlayerId);
    verify(mockNetworkInfo.isConnected);

  });

  group('Device is online', () {
    setUp((){
      when(mockNetworkInfo.isConnected)
          .thenAnswer((_) async => true);
    });

    test('Should return remote data when the remote call is successfull', () async {

      when(mockRemoteDataSource.getPlayerDetails(any))
          .thenAnswer((_) async => playerDetail);

      final result = await repositoryImpl.getPlayerDetails(tPlayerId);

      verify(mockRemoteDataSource.getPlayerDetails(tPlayerId));
      expect(result, equals(Right(playerDetail)));

    });

    test('Should cache data locally when the remote call is successfull', () async {

      when(mockRemoteDataSource.getPlayerDetails(any))
          .thenAnswer((_) async => playerDetail);

      await repositoryImpl.getPlayerDetails(tPlayerId);

      verify(mockRemoteDataSource.getPlayerDetails(tPlayerId));
      verify(mockLocalDataSource.cachePlayerDetails(playerDetail));

    });

    test('Should return server failure when remote call is unsuccessfull', () async {

      when(mockRemoteDataSource.getPlayerDetails(any))
          .thenThrow(ServerException());

      final result = await repositoryImpl.getPlayerDetails(tPlayerId);

      verify(mockRemoteDataSource.getPlayerDetails(tPlayerId));
      verifyZeroInteractions(mockLocalDataSource);
      expect(result, equals(const Left(ServerFailure())));
    });
  });

  group('Device is offline', () {
    setUp((){
      when(mockNetworkInfo.isConnected)
          .thenAnswer((_) async => false);
    });

    test('Should return last locally cached data when the cached data is present',
            () async {
          when(mockLocalDataSource.getLastPlayerDetails(tPlayerId))
              .thenAnswer((_) async => playerDetail);

          final result = await repositoryImpl.getPlayerDetails(tPlayerId);

          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastPlayerDetails(tPlayerId));
          expect(result, equals(Right(playerDetail)));
        });

    test('Should return CacheFailure when there is no cached data',
            () async {
          when(mockLocalDataSource.getLastPlayerDetails(tPlayerId))
              .thenThrow(CacheException());

          final result = await repositoryImpl.getPlayerDetails(tPlayerId);

          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastPlayerDetails(tPlayerId));
          expect(result, equals(Left(CacheFailure())));
        });
  });
}