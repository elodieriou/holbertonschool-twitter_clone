import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SideBarMenu extends StatefulWidget {
  const SideBarMenu({Key? key}) : super(key: key);

  @override
  _SideBarMenuState createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu> {
  // Placeholder data, will be fetched from backend later
  final String _username = 'Élodie';
  final int _followerCount = 1000;
  final int _followingCount = 23;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const CircleAvatar(
                  radius: 30,
                ),
                const SizedBox(height: 8),
                Text(
                  _username,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4), // Add margin between the two Text widgets
                  child: Row(
                    children: [
                      Text(
                        '$_followerCount: Followers',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 8), // Add spacing between the two Text widgets
                      Text(
                        '$_followingCount: Following',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              if (kDebugMode) {
                print('Menu Profile clicked');
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Lists'),
            onTap: () {
              if (kDebugMode) {
                print('Menu Lists clicked');
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.bookmark),
            title: const Text('Bookmark'),
            onTap: () {
              if (kDebugMode) {
                print('Menu Bookmark clicked');
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.flash_on),
            title: const Text('Moments'),
            onTap: () {
              if (kDebugMode) {
                print('Menu Moments clicked');
              }
            },
          ),

          const Divider(),

          ListTile(
            title: const Text('Settings and privacy'),
            onTap: () {
              if (kDebugMode) {
                print('Menu Settings and privacy clicked');
              }
            },
          ),
          ListTile(
            title: const Text('Help Center'),
            onTap: () {
              if (kDebugMode) {
                print('Menu Help Center clicked');
              }
            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              if (kDebugMode) {
                print('Menu Logout clicked');
              }
            },
          ),
          // Add more menu items as needed
        ],
      ),
    );
  }
}