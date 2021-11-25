// import 'package:socket_io_client/socket_io_client.dart' ;

// Dart client

import 'package:base_flutter_framework/utils/shared.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

// import 'package:socket_io_client/socket_io_client.dart' as IO;
class SocketMain {
  static SocketMain? socketMain;

  SocketMain() {
    // ignore: unused_local_variable

    socket = IO.io("http://150.95.113.87:3002", {
      "transports": ["websocket"],
      "autoConnect": false,
      "query": {"token": Shared.getInstance().userModel!.token ?? ""}
    });

    socket!.connect();
    socket!.emit("msg", "connect");

    print("ok");
    socketMain = SocketMain();
  }
  IO.Socket? socket;
  static SocketMain getInstance() {
    if (socketMain == null) socketMain = new SocketMain();
    return socketMain!;
  }

  // IOWebSocketChannel? channel;
  // SocketMain() {
  //   channel!.sink.add('received!');
  //   channel!.stream.listen((message) {
  //     channel!.sink.add('received!');
  //   });
  // }

  createNewChanel() {
    // channel = IOWebSocketChannel.connect('http://150.95.113.87:3002/');
  }

  // setUpListener({required Function(dynamic message) function}) {
  //   SocketMain.getInstance().channel!.stream.listen((message) {
  //     try {
  //       Map messageDataFormat = jsonDecode(message);
  //       if (messageDataFormat['type'] == 'say') {
  //         function(messageDataFormat);
  //       }
  //     } catch (_e) {}
  //   });
  // }

  // void close() {
  //   socket!.close();
  // }

  // void open() {
  //   socket!.open();
  // }

  Map connectParam({required String nameClient, required String roomId}) {
    return {"type": "login", "client_name": nameClient, "room_id": roomId};
  }

  Map sendParam({
    required String nameClient,
    required String roomId,
    required String content,
  }) {
    return {
      "type": "say",
      "to_client_id": "all",
      "to_client_name": nameClient,
      "content": content,
      "room_id": roomId
    };
  }
}
