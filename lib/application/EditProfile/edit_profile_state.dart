part of 'edit_profile_bloc.dart';

@immutable
class EditProfileState {
  UserProfile profile;

  EditProfileState({
    required this.profile,
  });
}

class InitialState extends EditProfileState {
  InitialState()
      : super(
          profile: UserProfile(
              name: '',
              profilePic:
                  'https://w1.pngwing.com/pngs/743/500/png-transparent-circle-silhouette-logo-user-user-profile-green-facial-expression-nose-cartoon.png'),
        );
}
