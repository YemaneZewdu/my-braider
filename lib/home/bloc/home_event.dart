import 'package:my_braider/home/model/user.dart';

abstract class HomeScreenEvent {}

class UserSearchError extends HomeScreenEvent {}

class UserSearchLoading extends HomeScreenEvent {}

class UserSearchSuccess extends HomeScreenEvent {
  final User user;

  UserSearchSuccess(this.user);
}
