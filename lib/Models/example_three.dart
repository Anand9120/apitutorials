import 'dart:convert';

import 'package:apitutorials/Models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  List<UserModel> userList=[];
  Future<List<UserModel>> getUserApi() async{

    final response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data= jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map i in data){
        print(i['name']);
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    }
    else{
      return userList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Api Course'),
    ),
      body: Column(
        children: [
          Expanded(child: FutureBuilder(
            future: getUserApi(),builder: (context,AsyncSnapshot<List<UserModel>> snapshot){
              if(!snapshot.hasData){
                return CircularProgressIndicator();
              }
              return ListView.builder(itemCount: userList.length,itemBuilder: (context,index){
                return Card(

  child:   Column(

    children: [

      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

        Text('Title'),SizedBox(width: 10,),Text(snapshot.data![index].name.toString())

      ],)

    ],

  ),

                );
              });
          },

          ))
        ],
      ),
    );
  }
}
