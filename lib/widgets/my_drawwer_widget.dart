import 'package:flutter/material.dart';

import '../config/global_params.dart';

// ce widget gere le menu de gauche
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: CircleAvatar(
              radius: 10.0,
              backgroundColor: Colors.blue,
            ),
          ),
          Divider(height: 4, color: Colors.blue),
          ...(GlobalParams.menus as List).map((item) {
            return Column(
              children: [
                ListTile(
                  title: Text(
                    '${item['title']}',
                    style: const TextStyle(fontSize: 17, letterSpacing: 1.5),
                  ),
                  leading: Icon(item['icon']),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, item['route']);
                  },
                ),
                const Divider(
                  height: 5,
                  color: Colors.blue,
                )
              ],
            );
          })
        ],
      ),
    );
  }
}
