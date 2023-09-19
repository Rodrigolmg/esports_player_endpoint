import 'dart:convert';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:esports_player_endpoint/core/core.dart';
import 'package:esports_player_endpoint/data/datasource/datasource.dart';
import 'package:esports_player_endpoint/data/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<PlayerImageDataSource>(),
  MockSpec<NetworkInfo>(),
])
import 'player_image_repository_impl_test.mocks.dart';

void main(){

  late PlayerImageRepositoryImpl repositoryImpl;
  late MockPlayerImageDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockPlayerImageDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = PlayerImageRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo
    );
  });

  const int tPlayerId = 1;

  Uint8List bytes = base64Decode('uYJTHLAssjhaIOPl');

  test('Should check if the device is online', () async {
    when(mockNetworkInfo.isConnected)
        .thenAnswer((_) async => true);

    repositoryImpl.getPlayerImage(tPlayerId);
    verify(mockNetworkInfo.isConnected);

  });

  group('Device is online', () {
    setUp((){
      when(mockNetworkInfo.isConnected)
          .thenAnswer((_) async => true);
    });

    test('Should return remote data when the remote call is successfull', () async {

      when(mockRemoteDataSource.getPlayerImage(any))
          .thenAnswer((_) async => bytes);

      final result = await repositoryImpl.getPlayerImage(tPlayerId);

      verify(mockRemoteDataSource.getPlayerImage(tPlayerId));
      expect(result, equals(Right(bytes)));

    });

    test('Should return server failure when remote call is unsuccessfull', () async {

      when(mockRemoteDataSource.getPlayerImage(any))
          .thenThrow(ServerException());

      final result = await repositoryImpl.getPlayerImage(tPlayerId);

      verify(mockRemoteDataSource.getPlayerImage(tPlayerId));
      expect(result, equals(const Left(ServerFailure())));
    });
  });
}