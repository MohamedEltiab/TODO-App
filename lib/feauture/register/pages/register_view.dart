import 'package:flutter/material.dart';
import 'package:untitled3/feauture/firebaseUtilis.dart';

class register_view extends StatefulWidget {
  static const String routeName = "register_view";

  register_view({super.key});

  @override
  State<register_view> createState() => _register_viewState();
}

class _register_viewState extends State<register_view> {
  @override
  Widget build(BuildContext context) {
    var FullNameController = TextEditingController();
    var gmailAdressController = TextEditingController();
    var passwordController = TextEditingController();
    var ConfirmPasswordController = TextEditingController();
    String? validateEmail(String? value) {
      if (value == null || value.trim().isEmpty) {
        return 'أدخل عنوان بريدك الإلكتروني';
      }

      RegExp gmailRegex = RegExp(r'^[a-zA-Z0-9_.+-]+@gmail.com$');

      if (!gmailRegex.hasMatch(value)) {
        return "in valid email";
      }

      return null;
    }

    String? validatePassword(String? value) {
      if (value == null || value.trim().isEmpty) {
        return 'Enter your password';
      }

      // Password must be at least 8 characters long
      if (value.length < 8) {
        return 'Password must be at least 8 characters long';
      }

      // Password must contain at least one uppercase letter
      if (!value.contains(RegExp(r'[A-Z]'))) {
        return 'Password must contain at least one uppercase letter';
      }

      // Password must contain at least one lowercase letter
      if (!value.contains(RegExp(r'[a-z]'))) {
        return 'Password must contain at least one lowercase letter';
      }

      // Password must contain at least one digit
      if (!value.contains(RegExp(r'[0-9]'))) {
        return 'Password must contain at least one digit';
      }

      // You can add more specific rules here, such as requiring special characters

      return null;
    }

    String? validateConfirmPassword(String? value) {
      if (value == null || value.trim().isEmpty) {
        return 'Enter your confirm password';
      }

      // Check if the confirm password matches the original password
      if (value != passwordController.text) {
        return 'Passwords do not match';
      }

      return null;
    }

    bool obscureText = true;
    Size mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    var formKey = GlobalKey<FormState>();
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/image/background.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(),
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
                      "Register",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleLarge,
                    ),
                    SizedBox(height: mediaQuery.height * 0.2),
                    Text("Full Name",
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.black)),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: FullNameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: "Enter your Full",
                        hintStyle: TextStyle(color: Colors.blue),
                        enabledBorder: UnderlineInputBorder(),
                        focusedErrorBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 15)),
                        suffixIcon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(
                      height: 25,
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
                      obscureText: true,
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
                            setState(() {
                              obscureText = !obscureText;
                            });
                            // Toggle the password visibility
                            // Using a StatefulWidget would be better for managing the state
                            // Here is a simple solution using a ternary operator
                          },
                          child: Icon(
                            obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text("Confirm password",
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.black)),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: validateConfirmPassword,

                      controller: ConfirmPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      //       isPassword=true;
//obscureText: true,

                      decoration: InputDecoration(
                        hintText: "Enter your Confirm password",
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
                            fireebaseUtilis().createUserAccount(
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
                            Text("Craete new account ",
                                style: theme.textTheme.bodySmall
                                    ?.copyWith(color: Colors.white)),
                            Spacer(),
                            Icon(Icons.arrow_forward_outlined)
                          ],
                        )),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
