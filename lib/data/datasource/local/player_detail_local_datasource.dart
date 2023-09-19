part of datasource;

abstract class PlayerDetailLocalDataSource {
  Future<PlayerDetailModel?> getLastPlayerDetails(int? playerId);
  Future<void> cachePlayerDetails(PlayerDetailModel playerDetail);
}

class PlayerDetailLocalDataSourceImpl implements PlayerDetailLocalDataSource {
  @override
  Future<void> cachePlayerDetails(PlayerDetailModel playerDetail) async {
    Box playerDetailBox = Hive.box(DataSourceBoxName.playerDetailBoxName);

    if(!playerDetailBox.isOpen){
      playerDetailBox = await Hive.openBox(DataSourceBoxName.playerDetailBoxName);
    }

    playerDetailBox.add(playerDetail);
  }

  @override
  Future<PlayerDetailModel?> getLastPlayerDetails(int? playerId) async {
    Box<PlayerDetailModel> playerDetailBox = Hive.box(DataSourceBoxName.playerDetailBoxName);

    if(!playerDetailBox.isOpen){
      playerDetailBox = await Hive.openBox(DataSourceBoxName.playerDetailBoxName);
    }

    PlayerDetailModel? lastPlayerDetail
      = playerDetailBox.values.lastWhere((element) => element.id == playerId);
    return lastPlayerDetail;
  }

}