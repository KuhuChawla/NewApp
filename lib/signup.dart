import 'package:flutter/material.dart';
import 'package:flutter_application_167/authentication.dart';
import 'package:flutter_application_167/homepage.dart';
import 'package:flutter_application_167/login.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isLoading = false;
  AuthenticationService authMethod = new AuthenticationService();
  TextEditingController emailTextEditingController =
      new TextEditingController();
  TextEditingController passwordTextEditingController =
      new TextEditingController();

  static final formKey = GlobalKey<FormState>();
  signMeUp() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      await authMethod
          .signUpWithEmailAndPassword(emailTextEditingController.text,
              passwordTextEditingController.text)
          .then((val) {
        //print("${val.uid}");
        if (val != null) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        } else {
          setState(() {
            isLoading = false;
            //show snackbar
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
        ),
      ),
      body: isLoading
          ? Container(
              child: Center(
              child: CircularProgressIndicator(),
            ))
          : SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  height: MediaQuery.of(context).size.height - 50,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Create an Account",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      new Form(
                        key: formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              validator: (val) {
                                return RegExp(
                                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                        .hasMatch(val)
                                    ? null
                                    : "invalid email";
                              },
                              controller: emailTextEditingController,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                suffixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              obscureText: true, //to show stars
                              validator: (val) {
                                return val.length > 6
                                    ? null
                                    : "provide 6+ character ";
                              },
                              controller: passwordTextEditingController,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                suffixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            // inputFile(label: "Email"),
                            // inputFile(label: "Password", obscureText: true),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            child: MaterialButton(
                              minWidth: double.infinity,
                              height: 60,
                              onPressed: () {
                                signMeUp();
                              },
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Text(
                                "SignUp",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          SizedBox(height: 20.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: Text.rich(
                              TextSpan(
                                  text: 'Already have an account  ',
                                  children: [
                                    TextSpan(
                                        text: 'Login',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18)),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
    );
  }

  Widget makeInput({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400])),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400])),
            )),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
