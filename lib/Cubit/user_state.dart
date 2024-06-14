abstract class UserState {}

class InitialState extends UserState {}

//Udate UI when signIn is successed
class SignInSuccessed extends UserState {}

//Udate UI when signIn loading
class SignInLoading extends UserState {}

//Udate UI when signIn is Faild
class SignInFailure extends UserState {
  final String errMessage;
  SignInFailure({required this.errMessage});
}
