import 'package:flutter/material.dart';
import 'package:whatsapp/status/statusmodel.dart';

class StatusTile extends StatelessWidget {
   StatusTile({
    Key? key,
    required this.statusData
  }) : super(key: key);

  StatusModel statusData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.grey ,
        child: Icon(Icons.person),
      ),
      title: Text(statusData.name.toString()),
      subtitle: Text(statusData.updatedAt.toString()),
    );
  }
}
