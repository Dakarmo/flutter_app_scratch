import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_scratch/views/user.repo.view.dart';
import 'package:http/http.dart' as http;

class UserView extends StatefulWidget {
  
  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
 
  String query = '';
  bool notVisible = false;
  TextEditingController queryTextEditingController = TextEditingController();
  dynamic data;
  int currentPage=0;
  int totalPage=0;
  int pageSize=20;
  List<dynamic> items=[];
  ScrollController scrollController = ScrollController();

void _search(String query) {
    final url = Uri.parse("https://api.github.com/search/users?q=$query&per_page=$pageSize&page=$currentPage");
    http.get(url)
      .then((response) {
        setState(() {
          data = json.decode(response.body);
          items.addAll(data['items']);
          if(data['total_count'] % pageSize == 0){

            totalPage = data['total_count']~/pageSize; 
          }else{
            totalPage = (data['total_count']~/pageSize )+ 1; 
          }
        });
      })
      .catchError((err){
        print(err);
    });
  }

  @override
  void initState() {

    super.initState();
    scrollController.addListener((){
      if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
        setState(() {
          if(currentPage<totalPage-1){
            ++currentPage;
            _search(query);
          }
        });
      }
    });

    queryTextEditingController.addListener(()
    {
      if(queryTextEditingController.text==''){
        setState(() {
          items=[];
          currentPage=0;
          totalPage=0;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      // drawer: MyDrawer(),
      appBar: AppBar(
        title:  Text('Github User => $query ||  Pagination :  $currentPage / $totalPage'),
      ),
      body:   Center(
        // child: Text(
        //   'Github User', 
        //   // style: TextStyle(color: Colors.green, fontSize: 26), 
        //   style: Theme.of(context).textTheme.headlineMedium, 
        // ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    obscureText: notVisible,
                    onChanged: (value) {
                      setState(() {
                        query=value;
                      });
                    },
                    controller: queryTextEditingController,
                    decoration: InputDecoration(
                      // icon: const Icon(Icons.logout),
                      // suffixIcon: const Icon(Icons.visibility),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            notVisible = !notVisible;
                          });
                        },
                        icon:  Icon(
                          notVisible == true ? Icons.visibility_off : Icons.visibility
                        ),
                      ),
                       
                      contentPadding: const EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          width: 1, color: Colors.green,
                        )
                      )
                    ),
                    
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                   setState(() {
                      items=[];
                      currentPage=0;
                      query = queryTextEditingController.text;
                      _search(query);
                   });
                  
                }, 
                icon: const Icon(Icons.search, )
              )
            ],
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => 
                Divider(height: 2, color:Colors.green[200]),
              controller: scrollController,
              itemCount: items.length,
              itemBuilder: (context, index) {
              
                return ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: 
                      (context)=>GitRepositoriesPage(login: items[index]['login'], avatarUrl: items[index]['avatar_url'],))
                    );
                  },
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(items[index]['avatar_url']),
                            radius: 20,
                          ),
                          const SizedBox(width: 10, ),
                          Text("${items[index]['login']}"),
                        ],
                      ),
                      CircleAvatar(
                        child: Text("${items[index]['score']}"),
                            // radius: 10,
                      )
                    ],
                  ),
                  
                );
                      
              }),
          )
      ],
      )

      ),
    );
  }
  
  
}