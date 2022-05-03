import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:dio_and_json/http_service.dart';
import 'package:dio_and_json/model/list_users_respo.dart';
import 'package:dio_and_json/model/single_user_response.dart';
import 'package:dio_and_json/model/user.dart';

class ListUser extends StatefulWidget {
  const ListUser({ Key? key }) : super(key: key);

  @override
  State<ListUser> createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {

  late ListUsersResponse listUsersResponse;
  late List<User>? users;
  

  HttpService http = HttpService();
  bool isLoading = false;
  

  Future getUser() async {
    Response response;
    try {
      isLoading = true;
      response = await http.getResponse('api/users?page=2');
      isLoading = false;
      if(response.statusCode == 200){
        setState(() {
          listUsersResponse = ListUsersResponse.fromJson(response.data);
          users = listUsersResponse.users;
          
        });
      }
      else {print('there is some problem');}
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  void initState(){
    getUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
        title: Text('single user'),
      ),
      body: isLoading ?
       CircularProgressIndicator(): 
       users != null ?
       ListView.builder(
         itemCount: users!.length,
         itemBuilder: (BuildContext context, index) {
           final user = users![index];
           return ListTile(
             title: Text(user.firstname + " " +user.lastname),
             leading: Image.network(user.avatar),
             subtitle: Text(user.email),
           );
         }):Text("No user data")
         );
  }
}






