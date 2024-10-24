import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meragi_task_karthik/core/constants/colors.dart';
import 'package:meragi_task_karthik/core/constants/images.dart';
import 'package:meragi_task_karthik/core/constants/styles.dart';
import 'package:meragi_task_karthik/modules/auth/bloc/auth_bloc.dart';
import 'package:meragi_task_karthik/modules/common/snack_bar.dart';
import 'package:meragi_task_karthik/modules/home/home_screen.dart';
import 'package:meragi_task_karthik/modules/shared/widgets/bold_text.dart';
import 'package:meragi_task_karthik/modules/shared/widgets/forgot_password.dart';
import 'package:meragi_task_karthik/modules/shared/widgets/gradient_button.dart';
import 'package:meragi_task_karthik/modules/shared/widgets/mobile_header.dart';
import 'package:meragi_task_karthik/modules/shared/widgets/outlined_button.dart';
import 'package:meragi_task_karthik/modules/shared/widgets/recent_login_widget.dart';
import 'package:meragi_task_karthik/modules/shared/widgets/signup_widget.dart';
import 'package:meragi_task_karthik/modules/shared/widgets/small_text.dart';
import '../../../core/responsive/responsive.dart';
import '../../shared/widgets/footer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
        if (state is AuthFailure) {
          Snack.pop(context, state.error);
        }
        if (state is AuthSuccess) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (route) => false);
        }
      }, builder: (context, state) {
        if (state is AuthLoading) {
          return const CircularProgressIndicator();
        }
        return SingleChildScrollView(
          child: Responsive.isMobile(context)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (Responsive.isMobile(context)) const MobileHeader(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 12.0, right: 12.0, top: 2.0, bottom: 12.0),
                      child: Column(
                        children: [
                          const BoldTextWidget(text: "Join our"),
                          const BoldTextWidget(text: "community today"),
                          const SmallTextWidget(
                            text:
                                "Get connected, find designers to start a project",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GradientButton(
                              height: 55,
                              width: 360,
                              onPressed: () {},
                              title: "Sign Up"),
                          const SizedBox(
                            height: 15,
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Or, Login with",
                              style: kSmallStyle,
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxHeight: 50,
                                maxWidth:
                                    MediaQuery.of(context).size.width - 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OutlinedButtonWidget(
                                    onPressed: () {}, title: 'Facebook'),
                                OutlinedButtonWidget(
                                    onPressed: () {}, title: 'Linkedin'),
                                OutlinedButtonWidget(
                                    onPressed: () {}, title: 'Google'),
                              ],
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                if (Responsive.isMobile(context))
                                  const Text("Mobile"),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxHeight: 70,
                                      maxWidth:
                                          MediaQuery.of(context).size.width -
                                              30),
                                  child: TextFormField(
                                    controller: emailController,
                                    decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(),
                                        labelText: "Email",
                                        labelStyle: kLabelBoldStyle,
                                        border: OutlineInputBorder()),
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                              .hasMatch(value)) {
                                        return "Enter valid email";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxHeight: 70,
                                      maxWidth:
                                          MediaQuery.of(context).size.width -
                                              30),
                                  child: TextFormField(
                                    controller: passwordController,
                                    obscureText: showPassword,
                                    decoration:  InputDecoration(
                                       enabledBorder:
                                                 const OutlineInputBorder(),
                                       suffixIcon: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    showPassword =
                                                        !showPassword;
                                                  });
                                                },
                                                icon: Icon(
                                                  showPassword
                                                      ? (Icons.visibility_off)
                                                      : (Icons.visibility),
                                                  color:
                                                      AppColors.backgroundColor,
                                                  size: 25,
                                                ),
                                              ),
                                        labelText: "Password",
                                        labelStyle: kLabelBoldStyle,
                                        border: const OutlineInputBorder()),
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 6) {
                                        return "Minimum 6 characters required";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const ForgotPasswordWidget(),
                          const SizedBox(
                            height: 18,
                          ),
                          GradientButton(
                              height: 55,
                              width: 360,
                              onPressed: () {
                                final isvalid =
                                    _formKey.currentState!.validate();
                                if (isvalid) {
                                  _formKey.currentState!.save();
                                  context.read<AuthBloc>().add(AuthLogin(
                                      email: emailController.text.trim(),
                                      password:
                                          passwordController.text.trim()));
                                }
                              },
                              title: "Login")
                        ],
                      ),
                    ),
                  ],
                )
              :
              //web/desktop
              SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(80, 60, 80, 80),
                        // padding: const EdgeInsets.only(
                        //     left: 100.0, right: 100.0, top: 20,),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ConstrainedBox(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width /
                                                8),
                                    child: Image.asset(logoWeb)),
                                SizedBox(
                                  width: deviceWidth / 6,
                                ),
                                Form(
                                  key: _formKey,
                                  child: Row(
                                    children: [
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                            maxHeight: 50,
                                            maxWidth: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                6),
                                        child: TextFormField(
                                          controller: emailController,
                                          decoration: const InputDecoration(
                                              enabledBorder:
                                                  OutlineInputBorder(),
                                              labelText: "Email",
                                              labelStyle: kSmallStyle,
                                              border: OutlineInputBorder()),
                                          validator: (value) {
                                            if (value!.isEmpty ||
                                                !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                                    .hasMatch(value)) {
                                              return "Enter valid email";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                            maxHeight: 50,
                                            maxWidth: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                6),
                                        child: TextFormField(
                                          controller: passwordController,
                                          obscureText: showPassword,
                                          decoration: InputDecoration(
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    showPassword =
                                                        !showPassword;
                                                  });
                                                },
                                                icon: Icon(
                                                  showPassword
                                                      ? (Icons.visibility_off)
                                                      : (Icons.visibility),
                                                  color:
                                                      AppColors.backgroundColor,
                                                  size: 25,
                                                ),
                                              ),
                                              enabledBorder:
                                                  const OutlineInputBorder(),
                                              labelText: "Password",
                                              labelStyle: kSmallStyle,
                                              border: const OutlineInputBorder()),
                                          validator: (value) {
                                            if (value!.isEmpty ||
                                                value.length < 6) {
                                              return "Minimum 6 characters required";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: deviceWidth / 28,
                                      ),
                                      GradientButton(
                                          height: deviceheight / 18,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              8,
                                          onPressed: () {
                                            final isvalid = _formKey
                                                .currentState!
                                                .validate();
                                            if (isvalid) {
                                              _formKey.currentState!.save();
                                              context.read<AuthBloc>().add(
                                                  AuthLogin(
                                                      email: emailController
                                                          .text
                                                          .trim(),
                                                      password:
                                                          passwordController
                                                              .text
                                                              .trim()));
                                            }
                                          },
                                          title: "Login"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const ForgotPasswordWidget(),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 3.5,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 7,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [RecentLoginWidget(), SignupWidget()],
                            )
                          ],
                        ),
                      ),
                      const Footer()
                    ],
                  ),
                ),
        );
      }),
    );
  }
}
