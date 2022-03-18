class SignUpState {}

class Uploading extends SignUpState {}

class UploadSuccess extends SignUpState {}

class UploadFailure extends SignUpState {
  var error;

  UploadFailure({this.error});
}
