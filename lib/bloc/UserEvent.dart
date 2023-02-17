// ignore: file_names
abstract class UsersEvent{}

class GetUsersEvent extends UsersEvent{
  // you can pass param here
  String id;
  GetUsersEvent({required this.id});
}