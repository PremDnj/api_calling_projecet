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
  var data;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    http.Response response = await http.get(Uri.tryParse(url)!);
    // GetPhotosResp.fromList(jsonDecode(response.body));
    setState(() {
      data = jsonDecode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: data != null
          ? Card(
              child: ListView.builder(
                /*gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1
                ),*/
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(data[index]['title']),
                        leading: Image.network(data[index]['url']),
                        trailing: Text(data[index]['id'].toString()),
                      ),
                    );
                  },
                  itemCount: data.length),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
