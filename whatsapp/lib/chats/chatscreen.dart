import 'package:flutter/material.dart';
import 'package:whatsapp/chats/models/chat_model.dart';

import 'chat_tile.dart';

class Chatscreen extends StatelessWidget {
  Chatscreen({Key? key}) : super(key: key);
 
List<ChatModel> chatList = [
ChatModel(avatar: 'https://th.bing.com/th/id/R.e6ad3358910bccc52e0a6bf876b979bd?rik=FA9Kmqc4OmwptA&riu=http%3a%2f%2feverydayfeminism.com%2fwp-content%2fuploads%2f2015%2f11%2fUntitled-Infographic-23.png&ehk=LoVoVHeUrUwpzbJdHFpMiSFpC7XmUHVuI%2bTfvaC3lmU%3d&risl=&pid=ImgRaw&r=0',isGroup: false,mesaage: 'hello',name: 'anu',updatedAt: '9:00 am'),
ChatModel(avatar: 'https://www.kevinashleyphotography.com/wp-content/uploads/2015/11/person.jpg',isGroup: false,mesaage: 'hello',name: 'adil',updatedAt: '3:00 am'),
ChatModel(avatar: 'https://4data.ro/wp-content/uploads/2016/12/person.png',isGroup: false,mesaage: 'hello',name: 'akhil',updatedAt: '2:00 am'),
ChatModel(avatar: 'https://images.hivisasa.com/1200/nFP58aAY4vjoho-7-e1505555078296.jpg',isGroup: false,mesaage: 'hello',name: 'adarsh',updatedAt: '7:00 am'),
ChatModel(avatar: 'https://www.pngjoy.com/pngm/131/2663889_group-of-people-icon-avatar-group-icon-png.png',isGroup: true,mesaage: 'hello',name: 'Cab',updatedAt: '12:00 pm'),
ChatModel(avatar: 'https://i.pinimg.com/736x/fd/41/18/fd411879db97a838ea339939156bd932.jpg',isGroup: true,mesaage: 'hello',name: 'Abc',updatedAt: '6:00 pm'),


];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (BuildContext context, int index) {
          
          return ChatTile(
            chatData: chatList[index],
          );
        },
      ),
     floatingActionButton: FloatingActionButton(onPressed: () {
       
     },
     backgroundColor:const Color(0xFF075E50),
     
     child: const Icon(Icons.chat),), 
    );
  }
}

