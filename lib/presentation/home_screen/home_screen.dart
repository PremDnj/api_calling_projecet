import 'dart:convert';
import 'dart:io';

import 'package:api_callback_project/data/model/photos/get_photos_resp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  var url = "https://jsonplaceholder.typicode.com/photos";
  GetPhotosResp getPhotosResp = GetPhotosResp();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    http.Response response = await http.get(Uri.tryParse(url)!);
    GetPhotosResp.fromList(jsonDecode(response.body));
    print(getPhotosResp.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getPhotosResp != null
          ? Card(
              child: Text(''),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
