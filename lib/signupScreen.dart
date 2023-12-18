import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
class SignUpScrenn extends StatefulWidget {
  const SignUpScrenn({super.key});

  @override
  State<SignUpScrenn> createState() => _SignUpScrennState();
}

class _SignUpScrennState extends State<SignUpScrenn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  void login(String email, password) async{
    try{
      // Response response = await post(Uri.parse('https://reqres.in/api/register'),//signup
      Response response = await post(Uri.parse('https://reqres.in/api/login'), //login
        body: {
        'email':email ,
         'password':password
        }
      );
      if(response.statusCode==200){
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        // print('account created successfully'); // account created
        print('Login successfully');
      }else{
        print('Failed');
      }

    }catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign Up Api",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(height: 40,),
            InkWell(
              onTap:(){
                login(emailController.text.toString(),passwordController.text.toString());
                
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10)
                ),
                // child: Center(child: Text('Sign Up',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),),
                child: Center(child: Text('Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),),
                
              ),
            )
          ],
        ),
      ),
    );
  }
}
