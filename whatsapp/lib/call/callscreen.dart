import 'package:flutter/material.dart';
import 'package:whatsapp/call/callmodel.dart';
import 'package:whatsapp/call/calltile.dart';

class Call extends StatelessWidget {
  Call({Key? key}) : super(key: key);

  List<CallModel> callList = [
    CallModel(avatar: '', calledAt: '9:00 Am', name: 'anu'),
    CallModel(avatar: '', calledAt: '4:00 Am', name: 'adarsh'),
    CallModel(avatar: '', calledAt: '2:00 Am', name: 'adil'),
    CallModel(avatar: '', calledAt: '7:00 Am', name: 'akhil'),
    CallModel(avatar: '', calledAt: '5:00 Am', name: 'aman')

  
  
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF075E50),
        child: const Icon(Icons.add_ic_call),
      ),
      body: ListView.builder(
        itemCount: callList.length,
        itemBuilder:( BuildContext context, int index) {
        return Calltile( 
         callData: callList[index],   
        );
      },
    ));
  }
}
