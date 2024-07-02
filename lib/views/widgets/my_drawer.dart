import 'package:flutter/material.dart';
import 'package:shopping_new/views/screens/admin/admin_screen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            child: const Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorites'),
            onTap: () {
              Navigator.pop(context);
              // Add navigation to Favorites screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.category),
            title: const Text('Category'),
            onTap: () {
              Navigator.pop(context);
              // Add navigation to Category screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.admin_panel_settings),
            title: const Text('Admin'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AdminScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              // Add navigation to Settings screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.more_horiz),
            title: const Text('More'),
            onTap: () {
              Navigator.pop(context);
              // Add navigation to more items
            },
          ),
        ],
      ),
    );
  }
}
