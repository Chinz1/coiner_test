import 'package:bloc/bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateProfile>(_onUpdateProfile);
  }

  void _onLoadProfile(LoadProfile event, Emitter<ProfileState> emit) {
    // Load the profile data (this is just a placeholder, you might load from a repository)
    emit(state.copyWith(
      firstName: '',
      lastName: '',
      email: '',
    ));
  }

  void _onUpdateProfile(UpdateProfile event, Emitter<ProfileState> emit) {
    emit(state.copyWith(
      firstName: event.firstName,
      lastName: event.lastName,
      email: event.email,
      isUpdated: true,
    ));
  }
}
