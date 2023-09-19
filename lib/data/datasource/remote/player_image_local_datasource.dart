part of datasource;

abstract class PlayerImageDataSource {
  Future<Uint8List?> getPlayerImage(int? playerId);
}

class PlayerImageDataSourceImpl implements PlayerImageDataSource {

  final DioMethod dio;

  const PlayerImageDataSourceImpl({
    required this.dio,
  });

  @override
  Future<Uint8List?> getPlayerImage(int? playerId) async {
    Response response = await dio.getMethod(UrlPath.playerImagePath(playerId));
    if(response.statusCode != null && response.statusCode == 200){
      if((response.data as String).isEmpty){
        throw ServerException(statusCode: 204);
      }

      Uint8List bytes = ImageHandler.convertBase64(response.data);
      return Future.value(bytes);
    } else {
      throw ServerException(statusCode: response.statusCode);
    }
  }
}