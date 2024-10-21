import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rest_api/models/comments.dart';
import 'package:rest_api/services/remote_services.dart';


class Homepage extends StatefulWidget{
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Comments> ? comments;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    // fetch data from API

    getData() ;
  }
  getData() async {
    comments = await RemoteServices().getComments();
    if(comments != null)
      {
        setState(() {
          isLoaded = true;
        });
      }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Comments'),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(itemCount:comments ?.length,itemBuilder: (context,index){
          return Container(
            child: Text(comments![index].body,
              style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          );
        },
        ),
      ),
    );
  }
}