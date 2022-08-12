import 'package:flutter/material.dart';
import 'package:whatsapp/chats/models/singlemessagemodel.dart';

class ChatBubble extends StatelessWidget {
   ChatBubble({Key? key,required this.messagelist}) : super(key: key,);
  MessageModel messagelist;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: messagelist.isSend !? Alignment.centerRight: Alignment.centerLeft,
      child: ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width-150),
      child: Card(
        color: Colors.white,
      child: Stack(children: [
       const Padding(
          padding: const EdgeInsets.only(left : 5.0, right: 30,top: 10,bottom: 20),
          child: Text('hello'),
        ),
        Positioned(
          bottom: 4,
          right: 2,
          child: Row(
          children:[
            Text('9.00am',style: TextStyle(fontSize:10 ),),
            
            Icon(Icons.done_all,size: 15,
            color: messagelist.isReaded!?Colors.blue:Colors.grey,)
          ],
        ))
      ],),
      
      ),),

    
    
    );
  }
}