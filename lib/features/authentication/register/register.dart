import 'package:evently_online_sat/core/UI_Utils.dart';
import 'package:evently_online_sat/core/resources/assets_manager.dart';
import 'package:evently_online_sat/core/resources/colors_manager.dart';
import 'package:evently_online_sat/core/resources/validators.dart';
import 'package:evently_online_sat/core/routes_manager/app_routes.dart';
import 'package:evently_online_sat/core/routes_manager/router.dart';
import 'package:evently_online_sat/core/widgets/custom_elevated_button.dart';
import 'package:evently_online_sat/core/widgets/custom_text_button.dart';
import 'package:evently_online_sat/core/widgets/custom_text_form_field.dart';
import 'package:evently_online_sat/firebase/firebase_service.dart';
import 'package:evently_online_sat/l10n/app_localizations.dart';
import 'package:evently_online_sat/models/register_request.dart' show RegisterRequest;
import 'package:evently_online_sat/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool securePassword = true;
  bool secureRePassword = true;
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  late TextEditingController _rePasswordController;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _rePasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(ImageAssets.eventlyLogo),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 24.h),

                    CustomTextFormField(
                      controller: _nameController,
                      validator: Validator.validateName,
                      labelText: appLocalizations.name,
                      prefixIcon: Icon(Icons.person),
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      controller: _emailController,
                      validator: Validator.validateEmail,
                      labelText: appLocalizations.email,
                      prefixIcon: Icon(Icons.email),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      controller: _passwordController,
                      validator: Validator.validatePassword,
                      isSecure: securePassword,
                      labelText: appLocalizations.password,
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: _onTogglePasswordIconClicked,
                        icon: Icon(
                          securePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      controller: _rePasswordController,
                      validator: (input) {
                        if (input == null || input.trim().isEmpty) {
                          return "Plz, confirm password";
                        }

                        if (input != _passwordController.text) {
                          return "Password doesn't match";
                        }
                        return null;
                      },
                      isSecure: secureRePassword,
                      labelText: appLocalizations.re_password,
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: _onToggleRePasswordIconClicked,
                        icon: Icon(
                          secureRePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),

                    SizedBox(height: 16.h),
                    CustomElevatedButton(
                      text: appLocalizations.create_account,
                      onPress: _createAccount,
                    ),

                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${appLocalizations.already_have_account} ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        CustomTextButton(
                          text: appLocalizations.login,
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.login,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTogglePasswordIconClicked() {
    setState(() {
      securePassword = !securePassword;
    });
  }

  void _onToggleRePasswordIconClicked() {
    setState(() {
      secureRePassword = !secureRePassword;
    });
  }

  void _createAccount() async {
    if (_formKey.currentState?.validate() == false) return;

    try{
     UIUtils.showLoading(context, isDismissible: false);
      UserCredential userCredential = await FirebaseService.register(RegisterRequest(email: _emailController.text, password: _passwordController.text));
      UserModel user = UserModel(id: userCredential.user!.uid, name: _nameController.text, email: _emailController.text, favouriteEventsIds: []);
      await FirebaseService.addUserToFireStore(user);
     UIUtils.hideDialog(context);
      UIUtils.showToastMessage("Successfully Registration", Colors.green);
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }on FirebaseAuthException catch(exception){
      UIUtils.hideDialog(context);
     UIUtils.showToastMessage(exception.code, ColorsManager.red);
    }catch(exception){

      UIUtils.hideDialog(context);
      print(exception.toString());
      UIUtils.showToastMessage("Failed to register", ColorsManager.red);
    }
  }
}
