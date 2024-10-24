import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meragi_task_karthik/modules/shared/local_storage/secure_local_storage.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLogin>((event, emit) async {
      emit(AuthLoading());
      try {
        if (event.email.isNotEmpty && event.password.isNotEmpty) {
          final storedEmail = await SecureStorage().readSecureData('email');
          final storedPassword =
              await SecureStorage().readSecureData('password');
          if ((storedEmail == event.email.toString()) &&
              (storedPassword == event.password)) {
            emit(AuthSuccess());
          } else {
            emit(AuthFailure(error: "Wrong email/password"));
          }
        } else {
          emit(AuthFailure(error: "Login failed"));
        }
      } catch (e) {
        emit(AuthFailure(error: "Login failed"));
      }
    });

    on<AuthLogout>((event, emit) async {
      await SecureStorage().deleteSecureData('email');
      await SecureStorage().deleteSecureData('password');
      emit(AuthInitial());
    });
  }
}
