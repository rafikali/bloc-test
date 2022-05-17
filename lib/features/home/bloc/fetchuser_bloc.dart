import 'package:bloc/bloc.dart';
import 'package:bloctest/core/helpers/failure.dart';
import 'package:bloctest/features/home/models/user_model.dart';
import 'package:bloctest/features/home/repo/home_repo.dart';
import 'package:bloctest/injector.dart';
import 'package:meta/meta.dart';

part 'fetchuser_event.dart';
part 'fetchuser_state.dart';

class FetchuserBloc extends Bloc<FetchuserEvent, FetchuserState> {
  FetchuserBloc() : super(FetchuserInitial()) {
    on<GetUserEvent>((event, emit) async {
      emit(GettingUserState());
      final response = await locator<HomeRepo>().fetchUsers();
      emit(response.fold((l) => GotUsersState(users: l),
          (r) => GettingFailedState(failure: r)));
    });
  }
}
