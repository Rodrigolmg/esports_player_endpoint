part of usecase;

class GetPlayerDetailsUseCase implements UseCase<PlayerDetailEntity?, int?> {

  final PlayerDetailRepository repository;

  const GetPlayerDetailsUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, PlayerDetailEntity?>> call([int? playerId]) {
    return repository.getPlayerDetails(playerId);
  }


}