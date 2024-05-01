part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class ChangePasswordEvent extends ProfileEvent {
  final ChangePasswordBody body;

  ChangePasswordEvent({required this.body});
}

class UploadPhotoEvent extends ProfileEvent {
  final File file;

  UploadPhotoEvent({required this.file});
}

class DeleteAccountEvent extends ProfileEvent {
  DeleteAccountEvent();
}
