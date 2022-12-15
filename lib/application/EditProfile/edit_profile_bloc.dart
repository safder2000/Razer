import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:razer/functions/user_profile_functions.dart';
import 'package:razer/model/user_profile_model.dart';

import '../../functions/image_fuctions.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(InitialState()) {
    on<EditProfileEvent>((event, emit) {});

    on<ProfilePic>((event, emit) async {
      // final imageUrl =
      //     'https://w1.pngwing.com/pngs/743/500/png-transparent-circle-silhouette-logo-user-user-profile-green-facial-expression-nose-cartoon.png';
      final imageUrl = await ImageFunctions.getImage();
      log(imageUrl.toString());

      // if (imageUrl != null) {}

      emit(
        EditProfileState(
          profile: UserProfile(
            name: state.profile.name,
            profilePic: imageUrl ??
                'https://w1.pngwing.com/pngs/743/500/png-transparent-circle-silhouette-logo-user-user-profile-green-facial-expression-nose-cartoon.png',
          ),
        ),
      );
    });
    on<SaveProfie>((event, emit) {
      saveProfile(
        name: event.name,
        profilePic: state.profile.profilePic,
      );
      emit(
        EditProfileState(
          profile: UserProfile(
            name: event.name,
            profilePic: state.profile.profilePic,
          ),
        ),
      );
    });
  }
}
