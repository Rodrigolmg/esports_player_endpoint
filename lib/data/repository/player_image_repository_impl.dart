part of repository;

class PlayerImageRepositoryImpl implements PlayerImageRepository {
  final PlayerImageDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  const PlayerImageRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo
  });

  @override
  Future<Either<Failure, Uint8List?>> getPlayerImage(int? playerId) async {

    if(await networkInfo.isConnected){
      try {
        Uint8List? bytes = await remoteDataSource.getPlayerImage(playerId);

        if(bytes == null || bytes.isEmpty){
          return const Left(ServerFailure());
        }

        return Right(bytes);

      } on ServerException catch (sE) {
        return Left(ServerFailure(statusCode: sE.statusCode));
      }
    } else {
      return const Left(ServerFailure(statusCode: 204));
    }
  }
}