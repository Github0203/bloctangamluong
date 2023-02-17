// ignore: file_names
import '../data/data.dart';

class GetUsersState {}

class GetUsersUnInitial extends GetUsersState {}

class GetUsersLoading extends GetUsersState {
  
}

class GetUsersSuccess extends GetUsersState {
  List<User> users;

  // ignore: unnecessary_null_comparison
  GetUsersSuccess(this.users) : assert(users != null);
}

class GetUsersError extends GetUsersState {}