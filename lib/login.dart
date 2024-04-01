// import 'dart:ffi';
// import 'dart:js_interop';
// import 'dart:ui';

import 'package:get/get.dart';
import 'package:mysql1/mysql1.dart';

// import 'Mysql.dart';

import 'package:avikances/admin_dashbord.dart';
import 'package:flutter/material.dart';
// import 'package:mysql_client/mysql_client.dart';
import 'package:http/http.dart' as http;



class   FormScreen extends StatefulWidget  {
  @override
  State<FormScreen> createState() => FormScreenState();
}



class FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passToggle = true;


  Future<void> _login() async {
    final String username = emailController.text;
    final String password = passwordController.text;

    final response = await http.post(
      Uri.parse('http://localhost:8080/api/v1/login/getUsernamePassword'), // Replace with your backend login endpoint
      body: {
        'username': username,
        'password': password,
         
      },
    );

    if (response.statusCode == 200) {
      // Successful login
      
      Navigator.push(

        context,
        MaterialPageRoute(builder: (context) => Dashbord()),
      );
    } else {
      // Failed login
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid username or password. Please try again.'),
        ),
      );
    }
  }


  @override
  Widget  build(BuildContext context) {




    return Scaffold(
      appBar: AppBar(
        title: Text("Department Login Page"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/logo.png",
                  height: 200,
                  width: 200,
                  repeat: ImageRepeat.noRepeat,
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if(value==null || value.isEmpty ){
                      return 'please enter your username';
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: passToggle,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffix: InkWell(
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: Icon(
                          passToggle ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 60),
                InkWell(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      _login();
                    }
                  },

                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );


  }



}
