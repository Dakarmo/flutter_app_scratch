import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:  ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.green.shade600,
                  Colors.white,
                ]
              )
            ),
            child: const CircleAvatar(
              backgroundImage: AssetImage('images/logo.png'),
            ),
          ),
          ListTile(
            title: const Text('Home', style: TextStyle(fontSize: 22)),
            leading: Icon(Icons.home, color: Colors.green[300],),
            trailing: Icon(Icons.arrow_right, color: Colors.green[300],),
            onTap: (){},
          ),
          Divider(height: 4, color: Colors.green[100]),
          ListTile(
            title: const Text('Météo', style: TextStyle(fontSize: 22)),
            leading: Icon(Icons.wb_sunny, color: Colors.green[300],),
            trailing: Icon(Icons.arrow_right, color: Colors.green[300],),
            onTap: (){},
          ),
          Divider(height: 4, color: Colors.green[100]),
          ListTile(
            title: const Text('Gallerie', style: TextStyle(fontSize: 22)),
            leading: Icon(Icons.storage, color: Colors.green[300],),
            trailing: Icon(Icons.arrow_right, color: Colors.green[300],),
            onTap: (){},
          ),
          Divider(height: 4, color: Colors.green[100]),
        ],
      )
      );
  }
}