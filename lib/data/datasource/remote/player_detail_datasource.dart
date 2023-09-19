part of datasource;

abstract class PlayerDetailDataSource {
  Future<PlayerDetailModel> getPlayerDetails(int? playerId);
}

class PlayerDetailDataSourceImpl implements PlayerDetailDataSource {

  final DioMethod dio;

  const PlayerDetailDataSourceImpl({
    required this.dio,
  });

  @override
  Future<PlayerDetailModel> getPlayerDetails(int? playerId) async {
    Response response = await dio.getMethod(UrlPath.playerDetailPath(playerId));
    if(response.statusCode != null && response.statusCode == 200){
      if((response.data as Map<String, dynamic>).isEmpty){
        throw ServerException(statusCode: 204);
      }

      Map<String, dynamic> json = response.data['player'];

      PlayerDetailModel playerDetailModel = PlayerDetailModel.fromJson(json);

      return Future.value(playerDetailModel);
    } else {
      throw ServerException(statusCode: response.statusCode);
    }
  }
}