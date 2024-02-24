import 'package:flutter/material.dart';
import 'package:untitled3/feauture/firebaseUtilis.dart';
import 'package:untitled3/feauture/register/pages/register_view.dart';

class login_view extends StatefulWidget {
  static const String routeName = "login_view";

  const login_view({super.key});

  @override
  State<login_view> createState() => _login_viewState();
}

class _login_viewState extends State<login_view> {
  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'enter validate gmail';
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'enter validate password';
    }
  }

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    Size mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    bool obscureText = true;
    var gmailAdressController = TextEditingController();
    var passwordController = TextEditingController();

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/image/background.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        // backgroundColor: Colors.transparent,

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.8),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: mediaQuery.height * 0.1),
                    Text(
                      "login",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleLarge,
                    ),
                    SizedBox(height: mediaQuery.height * 0.2),
                    Text("Welcome back!",
                        style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 25)),
                    SizedBox(
                      height: 36,
                    ),
                    Text("E-mail",
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.black)),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: gmailAdressController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Enter your email adress",
                        hintStyle: TextStyle(color: Colors.blue),
                        enabledBorder: UnderlineInputBorder(),
                        focusedErrorBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 15)),
                        suffixIcon: Icon(Icons.email_rounded),
                      ),
                      validator: validateEmail,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text("password",
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.black)),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: validatePassword,
                      controller: passwordController,
                      keyboardType: TextInputType.phone,
                      //       isPassword=true;
//obscureText: true,

                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        enabledBorder: UnderlineInputBorder(),
                        focusedErrorBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 15)),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {});
                            // Toggle the password visibility
                            // Using a StatefulWidget would be better for managing the state
                            // Here is a simple solution using a ternary operator
                            obscureText = !obscureText;
                          },
                          child: Icon(
                            obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate())
                            fireebaseUtilis().loginAccount(
                                gmailAdressController.text,
                                passwordController.text);
                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 20),
                            backgroundColor: theme.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Row(
                          children: [
                            Text("login",
                                style: theme.textTheme.bodySmall
                                    ?.copyWith(color: Colors.white)),
                            Spacer(),
                            Icon(Icons.arrow_forward_outlined)
                          ],
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Text("OR",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, register_view.routeName);
                      },
                      child: Text("Create new account!",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
