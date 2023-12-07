import 'package:diu_qr_code_scanner/core/global_theme.dart';
import 'package:diu_qr_code_scanner/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:diu_qr_code_scanner/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:diu_qr_code_scanner/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:diu_qr_code_scanner/features/authentication/presentation/widgets/login_bottom_widget.dart';
import 'package:diu_qr_code_scanner/global_widgets/custom_button.dart';
import 'package:diu_qr_code_scanner/global_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../widgets/login_top_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is LoggedIn) {
          print('Token: ${state.token}');
        } else if (state is AuthenticationError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              const LoginTopWidget(),
              const Gap(15),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Welcome to, \nDIU CMS",
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: customPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const Gap(10),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              labelText: 'Email',
                              isDone: false,
                              onSaved: (value) {
                                _username = value!;
                              },
                            ),
                            const Gap(15),
                            CustomTextFormField(
                              labelText: 'Password',
                              isDone: true,
                              onSaved: (value) {
                                _password = value!;
                              },
                            ),
                          ],
                        ),
                      ),
                      const Gap(20),
                      state is LoggingIn
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : CustomButton(
                              title: 'LOGIN',
                              onTap: () {
                                // Validate and submit the form
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  _formKey.currentState?.save();
                                }
                              },
                            ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              const LoginBottomWidget(),
            ],
          ),
        );
      },
    );
  }
}
