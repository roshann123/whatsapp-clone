import 'package:flutter/material.dart';
import 'package:whatsapp/call/callscreen.dart';
import 'package:whatsapp/chats/chatscreen.dart';
import 'package:whatsapp/status/stauspage.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
with SingleTickerProviderStateMixin {
  late TabController _controller;//declared a variable
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4,vsync: this,initialIndex: 1);//variable values
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
      bottom: TabBar(
        controller: _controller,//for rebuilding new ui for every tab when clicking
        tabs:const [
        Tab(icon: Icon(Icons.camera_alt),),
        Tab(text: 'CHATS',),
        Tab(text: 'STATUS',),
        Tab(text: 'CALLS',),
      ]),
        title: const Text('whatsapp'),
        actions: [
          IconButton(onPressed: () {
            
          }, icon:const Icon(Icons.search)),
          const SizedBox(
            width: 20,
          ),
          PopupMenuButton(
            onSelected: ((value) {
              print(value);
            }),
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 1,
                  child: Text('new group'),
                ),
               const PopupMenuItem(
                  child: Text('broadcast'),
                ),
               const PopupMenuItem(
                  child: Text('linked devices'),
                ),
               const PopupMenuItem(
                  child: Text('starred message'),
                ),
               const PopupMenuItem(
                  child: Text('payments'),
                ),
               const PopupMenuItem(
                  child: Text('settings'),
                ),
              ];
            },
            
          )
        ],
      ),
      body: TabBarView(
         controller: _controller,
         children: [
        Text('camera page'),
        Chatscreen(),
        StatusPage(),
        Call(),
        
      ],
     ),
    );
  }
}
