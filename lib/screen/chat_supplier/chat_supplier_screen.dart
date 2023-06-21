import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/chat.dart';
import 'bloc/chat_bloc.dart';

class chat_supplier extends StatefulWidget {
  String id = '';
  chat_supplier({super.key, this.id = ''});

  @override
  State<chat_supplier> createState() => _chat_supplierState();
}

class _chat_supplierState extends State<chat_supplier> {
  final TextEditingController _messageController = TextEditingController();
  List<Chat> chat = [];
  List<dynamic> mensagens = [];

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<ChatBloc>(context).add(ChatConnect(
      mensagens: mensagens,
      setState: setState,
      idRoom: widget.id,
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Supplier'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: mensagens.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Align(
                        alignment: mensagens[index]["isMe"] == true
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            color: mensagens[index]["isMe"] == true
                                ? Colors.blue
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Text(mensagens[index]["content"]),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<ChatBloc>(context)
                        .add(ChatMenssagemAddEvent(
                      author: "androind studio",
                      IdSender: "19",
                      message: _messageController.text,
                      mensagens: mensagens,
                      setState: setState,
                    ));
                  },
                  child: const Text('Send'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
