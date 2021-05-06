import 'package:ecommerce/constant.dart';
import 'package:ecommerce/screens/login.dart';
import 'package:flutter/material.dart';

class RegisterUser extends StatefulWidget {
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(p);
bool obsecureText = true;

class _RegisterUserState extends State<RegisterUser> {

  void validation(){
    final FormState _form = _formKey.currentState;
    if(_form.validate()){
      print("Yes");
    }else{
      print("No");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                            "Register",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 400,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Username",
                            hintStyle: TextStyle(
                              color: Colors.black
                            ),
                            suffixIcon: Icon(Icons.person),
                            border: OutlineInputBorder()
                          ),
                          validator: (value){
                            if(value.length < 6){
                              return "Username is too short";
                            } else if(value == ""){
                              return "Please fill username";
                            }
                            return "";
                          },
                        ),

                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(
                                  color: Colors.black
                              ),
                              suffixIcon: Icon(Icons.email),
                              border: OutlineInputBorder()
                          ),
                          validator: (value){
                            if(value == ""){
                              return "Please enter email";
                            }else if(!regExp.hasMatch(value)){
                              return "Enter valid email";
                            }
                            return "";
                          },
                        ),

                        TextFormField(
                          obscureText: obsecureText,
                          decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  color: Colors.black
                              ),
                              suffixIcon: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    obsecureText != obsecureText;
                                  });
                                  FocusScope.of(context).unfocus();
                                },
                                child: Icon(
                                  Icons.visibility,
                                  color: Colors.black,
                                ),
                              ),
                              border: OutlineInputBorder()
                          ),
                          validator: (value){
                            if(value == ""){
                              return "Please enter password";
                            }else if(value.length < 8){
                              return "Password too short";
                            }
                            return "";
                          },
                        ),

                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Phone Number",
                              hintStyle: TextStyle(
                                  color: Colors.black
                              ),
                              suffixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder()
                          ),
                          validator: (value){
                            if(value == ""){
                              return "Please enter phone number";
                            }else if(value.length < 10){
                              return "Invalid mobile number";
                            }
                            return "";
                          },
                        ),

                        Container(
                          height: 45,
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: (){
                                validation();
                              },
                              child: Text(
                                "Register"
                              )
                          ),
                        ),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "Already have an account?"
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => LogInUser()),
                                );
                              },
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                    color: kPrimaryColor
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
