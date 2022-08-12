import 'package:flutter/material.dart';
import 'package:whatsapp/status/statusmodel.dart';
import 'package:whatsapp/status/statustile.dart';

class StatusPage extends StatelessWidget {
  StatusPage({Key? key}) : super(key: key);

  List<StatusModel> statusList = [
    StatusModel(avatar: '', name: 'roshan', updatedAt: '900.am'),
    StatusModel(avatar: '', name: 'adil', updatedAt: '900.am'),
    StatusModel(avatar: '', name: 'anu', updatedAt: '900.am'),
    StatusModel(avatar: '', name: 'adarshp', updatedAt: '900.am'),
    StatusModel(avatar: '', name: 'roshan', updatedAt: '900.am'),
    StatusModel(avatar: '', name: 'roshan', updatedAt: '900.am'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ListTile(title: Text('my status'),),
          Container(
            height: MediaQuery.of(context).size.height - 200,
            child: ListView.builder(
              itemCount: statusList.length,
              itemBuilder: (BuildContext context, int index) {
                return StatusTile(statusData: statusList[index],);
              },
            ),
          ),
        ],
      ),
    );
  }
}

