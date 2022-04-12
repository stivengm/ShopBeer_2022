import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shopbeer/gui/constants.dart';
import 'package:shopbeer/gui/widgets/primary_button.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({ Key? key }) : super(key: key);

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  bool _passwordVisible = true;

  @override
  void initState() {
    _passwordVisible = true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            onChanged: (value) {

            },
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
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
            onChanged: (value) { },
            autocorrect: false,
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
          // const TextApp(text: 'Ha olvidado la contraseña?', color: blackColor),
          const SizedBox(height: 20.0),
          PrimaryButton(
            text: 'Siguiente',
            onPressed: () => Navigator.pop(context)
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

  TapGestureRecognizer _registro() {

    return TapGestureRecognizer()..onTap = () {
      Navigator.pushNamed(context, 'register');
    };

  }
}