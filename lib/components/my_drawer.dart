import 'package:flutter/material.dart';

import '../auth/auth_service.dart';
import '../pages/settings_page.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(){
    //get auth services
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //logo
          DrawerHeader(child: Center(
            child: Icon(
              Icons.message,
              color: Theme.of(context).colorScheme.primary,
              size: 40,
            ),
          ),
          ),
          //homelist
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ListTile(
              title: const Text("H O M E"),
              leading:const Icon(Icons.home),
              onTap: (){
                //pop the drawer
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ListTile(
              title: const Text("S E T T I N G S "),
              leading:const Icon(Icons.settings),
              onTap: (){
                Navigator.pop(context);
                //navigate to settings page
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context)=>const SettingsPage()
                    ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ListTile(
              title: const Text("L O G O U T "),
              leading:const Icon(Icons.logout),
              onTap: logout,
            ),
          )


          //seatings


          //logout

      ],),
    );
  }
}
