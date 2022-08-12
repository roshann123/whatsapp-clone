import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp/chats/models/chat_model.dart';
import 'package:whatsapp/chats/models/singlemessagemodel.dart';
import 'package:whatsapp/chats/widegets/chat_bubble.dart';
import 'package:whatsapp/chats/widegets/popoups.dart';

class ChatDetailScreen extends StatefulWidget {
  ChatDetailScreen({Key? key, required this.chatDetails}) : super(key: key);
  ChatModel chatDetails;

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  bool issend = false;
  bool showemoji = true;

  TextEditingController _messagecontroller = TextEditingController(text: '');
  FocusNode _focusNode = FocusNode();
  List<MessageModel> messages = [
    MessageModel(
        isReaded: true, isSend: true, message: 'hello', sendAt: '9:00 Am'),
    MessageModel(
        isReaded: false, isSend: false, message: 'hii', sendAt: '8:00 PM'),
    MessageModel(
        isReaded: true, isSend: true, message: 'okay', sendAt: '5:00 PM')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Icon(Icons.video_call),
          const SizedBox(
            width: 20,
          ),
          const Icon(Icons.call),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    child: Text((widget.chatDetails.isGroup!)
                        ? 'group info'
                        : 'view contacts')),
                PopupMenuItem(
                    child: Text((widget.chatDetails.isGroup!)
                        ? 'group media'
                        : 'media,links,and docs')),
                const PopupMenuItem(child: Text('search')),
                const PopupMenuItem(child: Text('mute notification')),
                const PopupMenuItem(child: Text('dissaperaing message')),
                const PopupMenuItem(child: Text('wallpaper')),
                const PopupMenuItem(child: Text('more'))
              ];
            },
          )
        ],
        titleSpacing: 5,
        leadingWidth: 100,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.chatDetails.name.toString()),
            Text(
              'last seen at ${widget.chatDetails.updatedAt}',
              style: const TextStyle(fontSize: 12),
            )
          ],
        ),
        leading: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            const SizedBox(
              width: 5,
            ),
            CircleAvatar(
                backgroundImage: (widget.chatDetails.avatar == '')
                    ? AssetImage((widget.chatDetails.isGroup!)
                        ? 'assets/images/icon.webp'
                        : 'assets/images/icon.png')
                    : NetworkImage(widget.chatDetails.avatar!)
                        as ImageProvider),
          ],
        ),
      ),
      body: Container(
        child: Stack(children: [
          Image.asset(
            'assets/images/bg.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          ListView.builder(
            padding: EdgeInsets.only(bottom: 50),
            itemCount: messages.length,
            itemBuilder: (BuildContext context, int index) {
              return ChatBubble(
                messagelist: messages[index],
              );
            },
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 75,
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            focusNode: _focusNode,
                            controller: _messagecontroller,
                            onChanged: (value) {
                              if (value.length > 0) {
                                setState(() {
                                  issend = true;
                                });
                              } else {
                                setState(() {
                                  issend = false;
                                });
                              }
                            },
                            decoration: InputDecoration(
                                hintText: 'message',
                                prefixIcon: IconButton(
                                  onPressed: () {
                                    _focusNode.unfocus();
                                    setState(() {
                                      showemoji = !showemoji;
                                    });
                                  },
                                  icon: Icon((showemoji)
                                      ? Icons.keyboard
                                      : Icons.emoji_emotions),
                                ),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.attach_file),
                                      onPressed: () {
                                        showModalBottomSheet(
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) => PopupBox());
                                      },
                                    ),
                                    const Icon(Icons.currency_rupee_outlined),
                                    Icon(Icons.camera_alt),
                                    SizedBox(
                                      width: 10,
                                    )
                                  ],
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: FloatingActionButton(
                          onPressed: () {
                            String tdata =
                                DateFormat("hh:mm a").format(DateTime.now());
                            setState(() {
                              messages.add(MessageModel(
                                  isReaded: false,
                                  isSend: true,
                                  message: _messagecontroller.text,
                                  sendAt: tdata));

                                  _messagecontroller.clear();
                            });
                          },
                          child: Icon((issend) ? Icons.send : Icons.mic),
                        ),
                      )
                    ],
                  ),
                  showemoji == true ? selectEmoji() : Container()
                ],
              ))
        ]),
      ),
    );
  }

  Widget selectEmoji() {
    return EmojiPicker(
      onEmojiSelected: (emoji, category) {
        _messagecontroller.text = _messagecontroller.text + emoji.emoji;
      },
    );
  }
}
