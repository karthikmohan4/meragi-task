
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meragi_task_karthik/modules/auth/bloc/auth_bloc.dart';
import 'package:meragi_task_karthik/modules/auth/ui/login_screen.dart';
import 'package:meragi_task_karthik/modules/common/app_bloc_observer.dart';
import 'package:meragi_task_karthik/modules/shared/local_storage/secure_local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();
   SecureStorage().writeSecureData('email', 'karthik@gmail.com');
  SecureStorage().writeSecureData('password', '123456');

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthBloc(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
        ));
  }
}
