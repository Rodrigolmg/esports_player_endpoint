part of datasource;

abstract class PlayerDetailDataSource {
  Future<PlayerDetailModel> getPlayerDetails(int? playerId);
}