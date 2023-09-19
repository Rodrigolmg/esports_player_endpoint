import 'package:dartz/dartz.dart';
import 'package:esports_player_endpoint/core/core.dart';
import 'package:esports_player_endpoint/domain/entity/entity.dart';
import 'package:esports_player_endpoint/domain/repository/repository_contract.dart';

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