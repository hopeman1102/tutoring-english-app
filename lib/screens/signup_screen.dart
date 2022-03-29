import 'package:flutter/material.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/utils/styles.dart';
import 'package:flutter/services.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final String welcome = "Join the exciting adventure!";
  final String rule = "- Password should be 8-20 characters\n" +
      "- Password should have a lower case letter\n" +
      "- Password should have a upper case letter\n" +
      "- Password should have a number or acceptable characters";
  late bool _passwordVisible;
  late bool _confirmPasswordVisible;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
    _confirmPasswordVisible = false;
  }

  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Form(
      key: formKey,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              verticalSpaceLarge,
              Text(
                welcome,
                style: ktsMediumTitleText,
              ),
              verticalSpaceMedium,
              Container(
                  height: screenSize.height * 0.1,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "First name is required.";
                      } else {
                        return null;
                      }
                    },
                  )),
              // verticalSpaceSmall,
              Container(
                  height: screenSize.height * 0.1,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Last name is required.";
                      } else {
                        return null;
                      }
                    },
                  )),
              // verticalSpaceSmall,
              Container(
                  height: screenSize.height * 0.1,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only n
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Mobile Number is required.";
                      }
                      if (value.length != 10) {
                        return "Mobile Number must have 10 characters.";
                      }
                      return null;
                    },
                  )),
              // verticalSpaceSmall,
              Container(
                  height: screenSize.height * 0.1,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email Address is required.";
                      }
                      if (!RegExp(
                              r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                          .hasMatch(value)) {
                        return "Email Address is wrong format.";
                      }
                      return null;
                    },
                  )),
              // verticalSpaceSmall,
              Container(
                height: screenSize.height * 0.1,
                child: TextFormField(
                  controller: _pass,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password",
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xff9FA5C0),
                          ))),
                  obscureText: !_passwordVisible,
                  validator: (val) {
                    if (val!.isEmpty) return 'Password is required.';
                    if (!(RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,20}$')
                            .hasMatch(val) ||
                        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[!@#\$&*~]).{8,20}$')
                            .hasMatch(val))) return 'Password is wrong format.';
                    return null;
                  },
                  onSaved: (val) => _pass.text = val!,
                ),
              ),
              // verticalSpaceSmall,
              Text(rule, style: ktsMediumInputText),
              verticalSpaceMedium,
              Container(
                height: screenSize.height * 0.1,
                child: TextFormField(
                  controller: _confirmPass,
                  obscureText: !_confirmPasswordVisible,
                  validator: (val) {
                    if (val!.isEmpty) return 'Confirm password is required';
                    if (val != _pass.text)
                      return 'Confirm password does not match';
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Confirm Password",
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _confirmPasswordVisible =
                                  !_confirmPasswordVisible;
                            });
                          },
                          icon: Icon(
                            _confirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xff9FA5C0),
                          ))),
                ),
              ),
              verticalSpaceSmall,
              Row(children: [
                Expanded(
                  child: OutlinedButton(
                    child: Text(
                      "Back",
                      style: ktsButton,
                    ),
                    style: OutlinedButton.styleFrom(
                      fixedSize: const Size(165, 50),
                      primary: kcPrimaryColor,
                      side: BorderSide(width: 1.0, color: kcPrimaryColor),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                horizontalSpaceSmall,
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      fixedSize:
                          MaterialStateProperty.all<Size?>(const Size(165, 50)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(kcPrimaryColor),
                    ),
                    // onPressed: validate,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        //Register successfully
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      'Sign Up',
                      style: ktsButton,
                    ),
                  ),
                ),
              ]),
            ],
          )),
    );
  }
}
