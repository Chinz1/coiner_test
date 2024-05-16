import 'package:equatable/equatable.dart';

class SupportState extends Equatable {
  final List<Map<String, String>> messages;

  const SupportState({this.messages = const []});

  @override
  List<Object> get props => [messages];

  SupportState copyWith({List<Map<String, String>>? messages}) {
    return SupportState(
      messages: messages ?? this.messages,
    );
  }
}
