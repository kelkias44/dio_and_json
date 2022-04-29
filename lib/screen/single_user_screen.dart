import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:dio_and_json/http_service.dart';
import 'package:dio_and_json/model/single_user_response.dart';
import 'package:dio_and_json/model/user.dart';

class SingleUser extends StatefulWidget {
  const SingleUser({ Key? key }) : super(key: key);

  @override
  State<SingleUser> createState() => _SingleUserState();
}

class _SingleUserState extends State<SingleUser> {

  HttpService http = HttpService();
  late SingleUserResponse singleUser;
  late User user;
  bool isLoading = false;

  Future getUser() async {
    Response response;
    try {
      isLoading = true;
      response = await http.getResponse('api/users?page=2');
      isLoading = false;
      if(response.statusCode == 200){
        setState(() {
          singleUser = SingleUserResponse.fromJson(response.data);
          user = singleUser.user;
          
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
      appBar: AppBar(
        title: Text('single user'),
      ),
      body: isLoading ?
       CircularProgressIndicator():
       Container(
         width: double.infinity,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Image.network(user.avatar),
             Text("${user.id}"),
             Text(user.firstname + " " + user.lastname),
             Text(user.email)
           ],
         ),
       )
      
    );
  }
}