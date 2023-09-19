library datasource;

import 'package:dio/dio.dart';
import 'package:esports_player_endpoint/core/core.dart';
import 'package:esports_player_endpoint/data/model/model.dart';
import 'package:esports_http_api/esports_http_api.dart';
import 'package:hive/hive.dart';

part 'url_path.dart';
part 'datasource_box_name.dart';

// remote
part 'remote/player_detail_datasource.dart';

// local
part 'local/player_detail_local_datasource.dart';