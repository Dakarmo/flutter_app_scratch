import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:http/http.dart' as http;

class GitRepositoriesPage extends StatefulWidget {
  final String login;
  final String? avatarUrl;
  GitRepositoriesPage({required this.login, this.avatarUrl});

  @override
  State<GitRepositoriesPage> createState() => _GitRepositoriesPageState();
}

class _GitRepositoriesPageState extends State<GitRepositoriesPage>
{
  dynamic dataRepositories;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadRepositories();
  }

  void loadRepositories() async{
    final url = Uri.parse("https://api.github.com/users/${widget.login}/repos");
    http.Response response = await http.get(url);

        
      if(response.statusCode == 200){
        setState(() {
          dataRepositories = json.decode(response.body);
        });
      }else {
        print(response.statusCode);
      }
      
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Repositories ${widget.login}'),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage(widget.avatarUrl!), 
          )
        ],
      ),
      body:  Center(
        
        child: ListView.separated(
          separatorBuilder: (context, index) => 
                Divider(height: 2, color:Colors.green[200]),
          itemCount: dataRepositories==null ? 0 : dataRepositories.length,
          itemBuilder: (context, index) => ListTile(
            title: Text('${dataRepositories[index]['name']}'),
          ),
        ),
      )
    );
  }
}