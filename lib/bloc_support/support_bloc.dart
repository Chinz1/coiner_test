import 'package:bloc/bloc.dart';
import 'support_event.dart';
import 'support_state.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  SupportBloc() : super(const SupportState()) {
    on<SendMessage>(_onSendMessage);
    on<ReceiveReply>(_onReceiveReply);
  }

  void _onSendMessage(SendMessage event, Emitter<SupportState> emit) {
    final messages = List<Map<String, String>>.from(state.messages);
    messages.add({"sender": "user", "text": event.message});
    emit(state.copyWith(messages: messages));

    // Automatically reply after sending a message
    _autoReply(event.message, emit);
  }

  void _onReceiveReply(ReceiveReply event, Emitter<SupportState> emit) {
    final messages = List<Map<String, String>>.from(state.messages);
    messages.add({"sender": "support", "text": event.reply});
    emit(state.copyWith(messages: messages));
  }

  void _autoReply(String message, Emitter<SupportState> emit) {
    String reply;

    if (message.toLowerCase().contains('hello')) {
      reply = 'Hello! How can I assist you today?';
    } else if (message.toLowerCase().contains('issue')) {
      reply =
          'I\'m sorry to hear that you are facing an issue. Can you please provide more details?';
    } else {
      reply =
          'Thank you for reaching out. Our support team will get back to you shortly.';
    }

    Future.delayed(const Duration(seconds: 1), () {
      add(ReceiveReply(reply));
    });
  }
}
