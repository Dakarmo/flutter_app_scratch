import 'package:flutter/material.dart';
import 'package:flutter_app_scratch/config/global.params.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> listItems = [];

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
            child:  const Center(
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/logo.png'),
                    radius: 20,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('images/profile.webp'),
                    radius: 50,
                  ),
                ],
              ),
            ),
          ),

          // Boucle `for` pour ajouter les ListTile
            ..._buildMenuItems(context),
            


          // ListView.builder(
          //   shrinkWrap: true, // Permet d'éviter que la ListView prenne tout l'espace
          //   itemCount: GlobalParams.menus.length,
          //   itemBuilder: (context, index) {
          //     final item = GlobalParams.menus[index];
              
          //     return Column(
          //       children: [
          //         ListTile(
          //           title: Text(item['title'], style: const TextStyle(fontSize: 22)),
          //           leading: Icon(item['icon'], color: Colors.green[300],),
          //           trailing: Icon(Icons.arrow_right, color: Colors.green[300],),
          //           onTap: (){
          //             Navigator.of(context).pop();
          //             Navigator.pushNamed(context, item['route']);
          //           },
          //         ),
          //         Divider(height: 4, color: Colors.green[100]),
          //       ],
          //     );
          //   },
          // ),


          // ...(GlobalParams.menus as List).map((item){
          //   return ListTile(
          //     title: Text('${item['title']}', style: const TextStyle(fontSize: 22)),
          //     leading: Icon(item['icon'], color: Colors.green[300],),
          //     trailing: Icon(Icons.arrow_right, color: Colors.green[300],),
          //     onTap: (){
          //       Navigator.of(context).pop();
          //       Navigator.pushNamed(context,'${item['route']}');
          //     },
          //   );
          // }),
          // Divider(height: 4, color: Colors.green[100]),



        ],
      )
      );
  }
}

// Fonction qui génère les items via une boucle `for`
List<Widget> _buildMenuItems(BuildContext context) {
  List<Widget> listItems = [];

  // Boucle `for` pour ajouter chaque élément de GlobalParams.menus
  for (var item in GlobalParams.menus) {
    listItems.add(
      Column(
        children: [
          ListTile(
            title: Text(item['title'], style: const TextStyle(fontSize: 22)),
            leading: Icon(item['icon'], color: Colors.green[300]),
            trailing: Icon(Icons.arrow_right, color: Colors.green[300]),
            onTap: () {
              // Action lors de l'appui sur un élément
              Navigator.of(context).pop();
              Navigator.pushNamed(context, item['route']);
            },
          ),
         Divider(height: 4, color: Colors.green[100]),
        ],
        
      ),
    );
  }

  return listItems;
}