part of repository_contract;

abstract class PlayerDetailRepository {
  Future<Either<Failure, PlayerDetailEntity>> getPlayerDetails(int? playerId);
}