part of repository_contract;

abstract class PlayerImageRepository {
  Future<Either<Failure, Uint8List?>> getPlayerImage(int? playerId);
}