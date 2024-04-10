import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'), // Set app bar title
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        'Hello',
                        style: theme.textTheme.bodyLarge!
                            .copyWith(color: theme.colorScheme.onPrimary),
                      ),
                    ),
                  );
                }
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondary,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'Hi!',
                      style: theme.textTheme.bodyLarge!
                          .copyWith(color: theme.colorScheme.onSecondary),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: theme.primaryColorLight, // Set background color
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Handle send message logic
                    _messageController.clear(); // Clear message after sending
                  },
                  icon: const Icon(Icons.send),
                  color: theme.primaryColor, // Set icon color
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
