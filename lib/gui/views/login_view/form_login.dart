import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shopbeer/gui/constants.dart';
import 'package:shopbeer/gui/widgets/notifications_widget.dart';
import 'package:shopbeer/gui/widgets/primary_button.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({ Key? key }) : super(key: key);

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  bool _passwordVisible = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    _passwordVisible = true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (email) => email != null && !EmailValidator.validate(email) ? 'Ingrese un email válido' : null,
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: const TextStyle(
                color: primaryColor
              ),
              filled: true,
              fillColor: whiteColor,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: whiteColor
                ),
                borderRadius: BorderRadius.circular(10.0)
              )
            ),
          ),
          const SizedBox(height: 15.0),
          TextFormField(
            obscureText: _passwordVisible,
            controller: passwordController,
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (pass) => pass != null && pass.length < 6 ? 'Ingrese mínimo 6 caracteres' : null,
            decoration: InputDecoration(
              labelText: 'Contraseña',
              labelStyle: const TextStyle(
                color: primaryColor
              ),
              filled: true,
              fillColor: whiteColor,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: whiteColor
                ),
                borderRadius: BorderRadius.circular(10.0)
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              )
            ),
          ),
          const SizedBox(height: 10.0),
          const Text("Ha olvidado la contraseña?"),
          const SizedBox(height: 20.0),
          PrimaryButton(
            text: 'Siguiente',
            onPressed: signIn
          ),
          const SizedBox(height: 30.0),
          RichText(
            text: TextSpan(
              text: 'No tienes una cuenta?',
              style: const TextStyle(
                color: blackColor
              ),
              children: [
                TextSpan(
                  text: ' Regístrate',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                  recognizer: _registro()
                )
              ]
            )
          )
        ],
      ),
    );
  }

  Future signIn() async {
    final isValidForm = formKey.currentState!.validate();
    if (!isValidForm) return;

    try {
      final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(), 
        password: passwordController.text.trim()
      );
      print(response);
    } on FirebaseException catch (e) {
      NotificationsWidget(message: e.message!,).showNotificationError(context);
      return;
    }

    Navigator.of(context).pushNamedAndRemoveUntil('home', (route) => false);

  }

  TapGestureRecognizer _registro() {

    return TapGestureRecognizer()..onTap = () {
      Navigator.pushNamed(context, 'register');
    };

  }
}