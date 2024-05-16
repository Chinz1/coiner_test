import 'package:equatable/equatable.dart';

abstract class SupportEvent extends Equatable {
  const SupportEvent();

  @override
  List<Object> get props => [];
}

class SendMessage extends SupportEvent {
  final String message;

  const SendMessage(this.message);

  @override
  List<Object> get props => [message];
}

class ReceiveReply extends SupportEvent {
  final String reply;

  const ReceiveReply(this.reply);

  @override
  List<Object> get props => [reply];
}
