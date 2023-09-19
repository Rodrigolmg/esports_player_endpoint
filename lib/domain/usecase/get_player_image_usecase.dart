part of usecase;

class GetPlayerImageUseCase implements UseCase<Uint8List?, int?> {

  final PlayerImageRepository repository;

  const GetPlayerImageUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, Uint8List?>> call([int? playerId]) {
    return repository.getPlayerImage(playerId);
  }


}