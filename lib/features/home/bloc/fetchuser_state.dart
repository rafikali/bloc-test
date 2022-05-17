part of 'fetchuser_bloc.dart';

@immutable
abstract class FetchuserState {}

class FetchuserInitial extends FetchuserState {}

class GettingUserState extends FetchuserState {}

class GotUsersState extends FetchuserState {
  final List<UserModel> users;
  GotUsersState({required this.users});
}

class GettingFailedState extends FetchuserState {
  final Failure failure;
  GettingFailedState({required this.failure});
}
