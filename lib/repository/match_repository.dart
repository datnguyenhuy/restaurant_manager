import 'dart:collection';

import 'package:base_flutter_framework/services/service.dart';
import 'package:base_flutter_framework/services/socket_io.dart';
import 'package:base_flutter_framework/utils/shared.dart';
import 'package:dio/dio.dart';

class MatchRepository {
  Future<void> createMatch() async {
    Map<String, dynamic> param = HashMap();
    param.putIfAbsent('host_id', () => Shared.getInstance().userModel!.id);
    param.putIfAbsent('location', () => "-34.8799074,174.7565664");
    Response? response = await ServiceCommon.getInstance()!.postHttp(
        api: ServiceCommon.getInstance()!.modeCreateMatch,
        host: ServiceCommon.getInstance()!.severUrl,
        param: param);
    Map<String, dynamic> paramGetChanel = HashMap();
    paramGetChanel.putIfAbsent(
        'match_id', () => response!.data['data']['existingMatch']['_id']);
    Response? responseChange = await ServiceCommon.getInstance()!.postHttp(
        api: ServiceCommon.getInstance()!.modeGetChanelMatch,
        host: ServiceCommon.getInstance()!.severUrl,
        param: paramGetChanel);
    SocketMain.getInstance().socket!.emit(
        'joinRoom', responseChange!.data['data']['chatChannelAll']['_id']);
    SocketMain.getInstance().socket!.emit(
        'joinRoom', responseChange.data['data']['chatChannelLeft']['_id']);
    SocketMain.getInstance().socket!.emit('chatroomMessage', {
      'player_id': Shared.getInstance().userModel!.id,
      'match_id': response!.data['data']['existingMatch']['_id'],
      'chat_channel_id': responseChange.data['data']['chatChannelLeft']['_id'],
      'message': "ok"
    });

    SocketMain.getInstance().socket!.on('newMessage', (data) {
      print(data);
    });

    print(responseChange);
    print(response.data);
  }
}
