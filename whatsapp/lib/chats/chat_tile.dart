import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:whatsapp/chats/chatdetailscreen.dart';
import 'package:whatsapp/chats/models/chat_model.dart';


class ChatTile extends StatelessWidget {
  const ChatTile({Key? key, required this.chatData}) : super(key: key);

  final ChatModel chatData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatDetailScreen(chatDetails: chatData),
            ));
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage:
          (chatData.avatar == '')?
           AssetImage((chatData.isGroup!)
              ? 'assets/images/icon.webp'
              : 'assets/images/icon.png'):
              NetworkImage(chatData.avatar.toString()) as ImageProvider
        ),
        title: Text(chatData.name!),
        subtitle: Text(chatData.mesaage!),
        trailing: Text(chatData.updatedAt!),
      ),
    );
  }
}
