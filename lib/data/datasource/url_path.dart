part of datasource;

class UrlPath {
  static String playerDetailPath(int? playerId) => 'player/$playerId';
  static String playerImagePath(int? playerId) => 'player/$playerId/image';
}