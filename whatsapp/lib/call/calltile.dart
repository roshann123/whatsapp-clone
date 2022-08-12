import 'package:flutter/material.dart';
import 'package:whatsapp/call/callmodel.dart';
import 'package:whatsapp/chats/models/chat_model.dart';

class Calltile extends StatelessWidget {
  const Calltile({Key? key,
  required this.callData}) : super(key: key);
  final CallModel callData ;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: const CircleAvatar(
        radius: 25,
        backgroundColor: Colors.grey,
        child: Icon(Icons.person),
      ),
      title: Text(callData.name!),
      subtitle: Text(callData.calledAt!),
      trailing: (callData.isGroup ==true)?
 Icon(Icons.video_call):Icon(Icons.call)
    );
  }
}