import 'dart:async';
import 'dart:convert';
import 'package:base_flutter_framework/components/widget/chat_ui/dash_chat.dart';
import 'package:base_flutter_framework/utils/dimens.dart';
import 'package:base_flutter_framework/utils/hex_color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mime/mime.dart';
import 'package:uuid/uuid.dart';

class ChatPage extends StatefulWidget {
 final  ScrollController scrollController;
  
  const ChatPage({Key? key,required this.scrollController}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();

  final ChatUser user = ChatUser(
    name: "Fayeed",
    uid: "123456789",
    avatar: "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
  );

  final ChatUser otherUser = ChatUser(
    name: "Mrfatty",
    uid: "25649654",
  );

  List<ChatMessage> messages = <ChatMessage>[];
  var m = <ChatMessage>[];

  var i = 0;

  @override
  void initState() {
    super.initState();
  }

  void systemMessage() {
    Timer(Duration(milliseconds: 300), () {
      if (i < 6) {
        setState(() {
          messages = [...messages, m[i]];
        });
        i++;
      }
      Timer(Duration(milliseconds: 300), () {
        _chatViewKey.currentState!.scrollController
          ..animateTo(
            _chatViewKey
                .currentState!.scrollController.position.maxScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
      });
    });
  }

  void onSend(ChatMessage message) {
    print(message.toJson());
    jsonEncode(message.toJson());
    /* setState(() {
      messages = [...messages, message];
      print(messages.length);
    });

    if (i == 0) {
      systemMessage();
      Timer(Duration(milliseconds: 600), () {
        systemMessage();
      });
    } else {
      systemMessage();
    } */
  }

  @override
  Widget build(BuildContext context) {
    List<Map> items = [];
    var messages = [
        ChatMessage.fromJson({
        "id": "6e18dbd9-55d9-48b0-bab5-6c626b70e71e",
        "text": " Possimus qui dignissimos ut quaerat iure ratione perferendis. Quidem dolore animi magni quia soluta provident aspernatur qui.Mollitia dolor perferendis provident enim ut delectus consequuntur modi ad. Odit animi ea praesentium ut aut consequatur. Doloremque quis et natus esse veniam eligendi. Exercitationem sunt et.",
        "image": null,
        "video": null,
        "createdAt": 1635567009041,
        "user": {
          "uid": "1234567810",
          "name": "Fayeed",
          "firstName": null,
          "lastName": null,
          "avatar":
              "http://i1.taimienphi.vn/tmp/cf/aut/hinh-anh-nguoi-mau.jpg",
                "containerColor": HexColor.getColorFromHex("243C77"),
          "color": HexColor.getColorFromHex("FFFFFF"),
          
          "customProperties": null
        },
        "quickReplies": null,
        "customProperties": null
      }),
        ChatMessage.fromJson({
        "id": "6e18dbd9-55d9-48b0-bab5-6c626b70e71e",
        "text": " Possimus qui dignissimos ut quaerat iure ratione perferendis. Quidem dolore animi magni quia soluta provident aspernatur qui.Mollitia dolor perferendis provident enim ut delectus consequuntur modi ad. Odit animi ea praesentium ut aut consequatur. Doloremque quis et natus esse veniam eligendi. Exercitationem sunt et.",
        "image": null,
        "video": null,
        "createdAt": 1635567009041,
        "user": {
          "uid": "123456789",
          "name": "Fayeed",
          "firstName": null,
          "lastName": null,
          "avatar":
              "http://i1.taimienphi.vn/tmp/cf/aut/hinh-anh-nguoi-mau.jpg",
        
          "customProperties": null,
          "containerColor": HexColor.getColorFromHex("FFF5FD"),
          "color": HexColor.getColorFromHex("243C77"),
        },
        "quickReplies": null,
        "customProperties": null
      }),
    ];
    return Container(

      child: DashChat(
        key: _chatViewKey,
   scrollController: widget.scrollController,
        inverted: false,
   
        onSend: onSend,
        sendOnEnter: true,
        textInputAction: TextInputAction.send,
        user: user,
      messageContainerDecoration: BoxDecoration(
        borderRadius:  BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        
      
      ),
      messagePadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      
        inputDecoration:
            InputDecoration.collapsed(hintText: "Add message here..."),
        dateFormat: DateFormat('yyyy-MMM-dd'),
        timeFormat: DateFormat('HH:mm'),
        messages: messages,
        showUserAvatar: false,
        showAvatarForEveryMessage: false,
        scrollToBottom: false,
        onPressAvatar: (ChatUser user) {
          print("OnPressAvatar: ${user.name}");
        },
        onLongPressAvatar: (ChatUser user) {
          print("OnLongPressAvatar: ${user.name}");
        },
        inputMaxLines: 5,
      
        messageContainerPadding: EdgeInsets.only(left: 5.0, right: 5.0),
        alwaysShowSend: true,
        inputTextStyle: TextStyle(fontSize: 16.0),
        inputContainerStyle: BoxDecoration(
          border: Border.all(width: 0.0),
       
        ),
        onQuickReply: (Reply reply) {
          setState(() {
            messages.add(ChatMessage(
                text: reply.value, createdAt: DateTime.now(), user: user));
      
            messages = [...messages];
          });
      
          Timer(Duration(milliseconds: 300), () {
            _chatViewKey.currentState!.scrollController
              ..animateTo(
                _chatViewKey
                    .currentState!.scrollController.position.maxScrollExtent,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 300),
              );
      
            if (i == 0) {
              systemMessage();
              Timer(Duration(milliseconds: 600), () {
                systemMessage();
              });
            } else {
              systemMessage();
            }
          });
        },
        onLoadEarlier: () {
          print("laoding...");
        },
        shouldShowLoadEarlier: false,
        showTraillingBeforeSend: true,
        trailing: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            onPressed: () async {
              final picker = ImagePicker();
              PickedFile? result = await picker.getImage(
                source: ImageSource.gallery,
                imageQuality: 80,
                maxHeight: 400,
                maxWidth: 400,
              );
      
              if (result != null) {
                // final Reference storageRef =
                //     FirebaseStorage.instance.ref().child("chat_images");
      
                // final taskSnapshot = await storageRef.putFile(
                //   File(result.path),
                //   SettableMetadata(
                //     contentType: 'image/jpg',
                //   ),
                // );
      
                // String url = await taskSnapshot.ref.getDownloadURL();
      
                // ChatMessage message =
                //     ChatMessage(text: "", user: user, image: url);
      
                // FirebaseFirestore.instance
                //     .collection('messages')
                //     .add(message.toJson());
              }
            },
          )
        ],
      ),
    );
  }
}
