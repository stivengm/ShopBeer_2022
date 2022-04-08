import 'package:flutter/material.dart';
import 'package:shopbeer/gui/constants.dart';
import 'package:shopbeer/gui/views/login_view/form_login.dart';
import 'package:shopbeer/gui/widgets/curved_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({ Key? key }) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return SizedBox(
      height: double.infinity,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              CurvedWidget(
                curvedDistance: 80.0,
                curvedHeight: 80.0,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 100.0, left: 50.0),
                  height: 300.0,
                  color: primaryColor,
                  child: Text("Iniciar sesión", style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 30.0, color: whiteColor),),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 300.0, right: 28.0, left: 28.0),
                child: const FormLogin(),
              )
            ],
          ),
        ),
      )
    );
  }
}