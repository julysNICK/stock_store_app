import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/chat.dart';
import 'bloc/chat_bloc.dart';

class chat_supplier extends StatefulWidget {
  const chat_supplier({super.key});

  @override
  State<chat_supplier> createState() => _chat_supplierState();
}

class _chat_supplierState extends State<chat_supplier> {
  final TextEditingController _messageController = TextEditingController();
  List<Chat> chat = [];

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<ChatBloc>(context).add(ChatConnect(room: '1'));

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
          StreamBuilder<Object>(
              stream: BlocProvider.of<ChatBloc>(context).stream,
              builder: (context, snapshot) {
                print(snapshot.data);
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                    alignment:
                        true ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: true ? Colors.blue : Colors.grey[300],
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        snapshot.hasData ? 'oi ${snapshot.data}' : 'message',
                      ),
                    ),
                  ),
                );
              }),
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
                    BlocProvider.of<ChatBloc>(context).add(
                      ChatLoad(
                        message: 'message',
                        sender: 'sender',
                        id: '1',
                        receiver: 'receiver',
                      ),
                    );
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
