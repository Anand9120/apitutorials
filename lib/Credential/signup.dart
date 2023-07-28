import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  void login(String email,password)async{
    try{
      Response response=await post(
          Uri.parse('https://reqres.in/api/login'),
    body: {
            'email':email,
      'password':password
    }

      );
      if(response.statusCode==200){
        print('Login created successful');
      }
      else{
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
        title: Text('Sign Up'),

      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40,decoration: BoxDecoration(color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(50)
            ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller:emailController ,
                    decoration: InputDecoration(
                      hintText: 'Email',


                    ),
                  ),
                ),
              ),
            )
,SizedBox(height: 10,),
            Container(
              height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.grey),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password'
                  ),
                ),
              ),
            )
            ,SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
              login(emailController.text.toString(),passwordController.text.toString());}
              ,
              child: Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.deepOrange),
                child: Center(child: Text('LogIn',style: TextStyle(color: Colors.black38,),)),
              ),
            )

          ],
        ),
      ),
    );
  }
}
