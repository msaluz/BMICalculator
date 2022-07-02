import 'package:bloc/bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState(username: ""));

  void sendUsername(String userInput) => emit(UserState(username: userInput));
}
