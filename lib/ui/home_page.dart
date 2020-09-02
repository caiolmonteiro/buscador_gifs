import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _search;

  int _offset = 0;

  _getGifs() async{
    http.Response response;
    if(_search == null)
      response = await http.get("https://api.giphy.com/v1/gifs/trending?api_key=PJ9WxBd7ttO1Hvoya6f2jrtBxU5pYgKg&limit=20&rating=g");
    else
      response = await http.get("https://api.giphy.com/v1/gifs/search?api_key=PJ9WxBd7ttO1Hvoya6f2jrtBxU5pYgKg&q=$_search&limit=25&offset=$_offset&rating=g&lang=en");
    return json.decode(response.body);
  }

  @override
  void initState(){
    super.initState();
    _getGifs().then((map){
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network("https://developers.giphy.com/branch/master/static/header-logo-8974b8ae658f704a5b48a2d039b8ad93.gif"),
        centerTitle: true,
      ),
    );
  }
}
