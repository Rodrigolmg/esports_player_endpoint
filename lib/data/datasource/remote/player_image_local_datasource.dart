part of datasource;

abstract class PlayerImageDataSource {
  Future<Uint8List?> getPlayerImage(int? playerId);
}