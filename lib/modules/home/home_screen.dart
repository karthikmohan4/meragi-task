import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meragi_task_karthik/modules/auth/bloc/auth_bloc.dart';
import 'package:meragi_task_karthik/modules/auth/ui/login_screen.dart';
import 'package:meragi_task_karthik/modules/shared/widgets/gradient_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
        if (state is AuthInitial) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) =>const LoginScreen()),
              (route) => false);
        }
      }, builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: GradientButton(
                  height: 55,
                  width: 360,
                  onPressed: () {
                    context.read<AuthBloc>().add(AuthLogout());
                  },
                  title: "Logout"),
            )
          ],
        );
      }),
    );
  }
}
