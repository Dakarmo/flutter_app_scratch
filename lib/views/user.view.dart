import 'package:flutter/material.dart';


class UserView extends StatefulWidget {
  
  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
 
 String query = '';
 bool notVisible = false;

  TextEditingController queryTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      // drawer: MyDrawer(),
      appBar: AppBar(
        title:  Text('Github User => $query'),
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
                     query = queryTextEditingController.text;
                   });
                  
                }, 
                icon: const Icon(Icons.search, )
              )
            ],
          )
      ],
      )

      ),
    );
  }
}