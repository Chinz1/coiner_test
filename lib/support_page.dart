import 'package:flutter/material.dart';
import 'package:coiner/bloc_support/support_bloc.dart';
import 'package:coiner/bloc_support/support_event.dart';
import 'package:coiner/bloc_support/support_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupportPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support'),
      ),
      body: BlocProvider(
        create: (_) => SupportBloc(),
        child: BlocBuilder<SupportBloc, SupportState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Align(
                          alignment: state.messages[index]['sender'] == 'user'
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: state.messages[index]['sender'] == 'user'
                                  ? Colors.blue[100]
                                  : Colors.green[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(state.messages[index]['text']!),
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
                          decoration: const InputDecoration(
                            hintText: 'Type your message here...',
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          if (_controller.text.isNotEmpty) {
                            context
                                .read<SupportBloc>()
                                .add(SendMessage(_controller.text));
                            _controller.clear();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
