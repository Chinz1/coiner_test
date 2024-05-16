import 'package:equatable/equatable.dart';

class ProfileState extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final bool isUpdated;

  const ProfileState({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.isUpdated = false,
  });

  @override
  List<Object> get props => [firstName, lastName, email, isUpdated];

  ProfileState copyWith({
    String? firstName,
    String? lastName,
    String? email,
    bool? isUpdated,
  }) {
    return ProfileState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      isUpdated: isUpdated ?? this.isUpdated,
    );
  }
}
