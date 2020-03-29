import 'package:flutter/material.dart';
import 'dart:convert';
import 'post.dart';
import 'package:http/http.dart' as http;

class PostsFetchData extends StatefulWidget {
  @override
  _PostsFetchData createState() => _PostsFetchData();
}

class _PostsFetchData extends State<PostsFetchData> {
  List<Post> list = List();
  var isLoading = false;

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response =
        await http.get("http://frozen-refuge-86379.herokuapp.com/api/posts");
    if (response.statusCode == 200) {
      list = (json.decode(response.body)['posts'] as List)
          .map((data) => new Post.fromJson(data))
          .toList();
      print(list[9].imagePath);
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            child: new Text("Fetch Data"),
            onPressed: _fetchData,
          ),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  print(list[index].imagePath);
                  return ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    title: new Text(list[index].title),
                    trailing: new Image.network(
                      index % 2 == 0
                          ? "https://i.picsum.photos/id/9/250/250.jpg"
                          : 'https://angular-project-image160822-nodejs.s3.us-east-2.amazonaws.com/t_1584301583894.jpg',
                      // : list[index].imagePath,
                      fit: BoxFit.cover,
                      height: 80.0,
                      width: 250.0,
                    ),
                  );
                }));
  }
}
