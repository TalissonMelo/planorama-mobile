import 'package:flutter/material.dart';
import 'package:liberbox_mobile/src/chat/controller/chat_controller.dart';
import 'package:liberbox_mobile/src/chat/domain/message_response.dart';

class Chat extends StatefulWidget {
  final String sessionId;
  final String title;

  const Chat({
    super.key,
    required this.sessionId,
    required this.title,
  });

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController _controller = TextEditingController();
  final List<MessageResponse> _messages = [];
  final chatController = ChatController();
  late String sessionId;
  late String title;

  @override
  void initState() {
    super.initState();
    title = widget.title;
    sessionId = widget.sessionId;
  }

  void _sendMessage() async {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(MessageResponse(content: _controller.text, user: true));
      });

      MessageResponse? messageResponse = await chatController.created(
        sessionId: sessionId,
        message: _controller.text,
      );

      if (messageResponse != null) {
        setState(() {
          _messages.add(messageResponse);
        });
      }

      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Verde estilo WhatsApp
        title: Text(title, style: const TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                bool isUserMessage = _messages[index].user;

                return Align(
                  alignment: isUserMessage
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: isUserMessage
                          ? const Color(
                              0xFFADD8E6) // Verde claro para mensagens enviadas
                          : Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16.0),
                        topRight: const Radius.circular(16.0),
                        bottomLeft: isUserMessage
                            ? const Radius.circular(16.0)
                            : const Radius.circular(0),
                        bottomRight: isUserMessage
                            ? const Radius.circular(0)
                            : const Radius.circular(16.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Text(
                      _messages[index].content,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Digite sua mensagem',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: IconButton(
                    icon: const Icon(Icons.send),
                    color: Colors.white,
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFECE5DD), // Cor de fundo estilo WhatsApp
    );
  }
}
