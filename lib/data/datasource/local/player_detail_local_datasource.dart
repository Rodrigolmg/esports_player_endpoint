part of datasource;

abstract class PlayerDetailLocalDataSource {
  Future<PlayerDetailModel> getLastplayerDetails(int? playerId);
  Future<void> cachePlayerDetails(PlayerDetailModel playerDetail);
}

class PlayerDetailLocalDataSourceImpl implements PlayerDetailLocalDataSource {
  @override
  Future<void> cachePlayerDetails(PlayerDetailModel playerDetail) {
    // TODO: implement cachePlayerDetails
    throw UnimplementedError();
  }

  @override
  Future<PlayerDetailModel> getLastplayerDetails(int? playerId) {
    // TODO: implement getLastplayerDetails
    throw UnimplementedError();
  }

}