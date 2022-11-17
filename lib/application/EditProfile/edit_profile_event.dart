part of 'edit_profile_bloc.dart';

@immutable
abstract class EditProfileEvent {}

class ProfilePic extends EditProfileEvent {}

class SaveProfie extends EditProfileEvent {
  SaveProfie({
    required this.name,
    required this.number,
  });
  String name;
  List<int> number;
}
