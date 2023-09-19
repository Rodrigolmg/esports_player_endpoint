part of repository;

class PlayerDetailRepositoryImpl implements PlayerDetailRepository {

  final PlayerDetailDataSource remoteDataSource;
  final PlayerDetailLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  const PlayerDetailRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo
  });

  @override
  Future<Either<Failure, PlayerDetailEntity>> getPlayerDetails(int? playerId) async {

    if(await networkInfo.isConnected){
      try {
        PlayerDetailModel playerDetail =
          await remoteDataSource.getPlayerDetails(playerId);
        localDataSource.cachePlayerDetails(playerDetail);

        return Right(playerDetail);

      } on ServerException catch(sE) {
        return Left(ServerFailure(statusCode: sE.statusCode));
      }
    } else {
      try {
        PlayerDetailModel lastPlayerDetail =
          await localDataSource.getLastplayerDetails(playerId);
        return Right(lastPlayerDetail);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}