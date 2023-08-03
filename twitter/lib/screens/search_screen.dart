import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:twitter/widgets/users_search_results_widget.dart';
import 'package:twitter/assets/user_data.dart';
import 'package:twitter/widgets/entry_field.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                  radius: 20,
                ),
                const SizedBox(width: 10), // Add spacing between avatar and text field
                Expanded(
                  child: CustomEntryField(
                    hint: 'Search',
                    controller: _searchController,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.settings, color: Colors.blue),
                  onPressed: () {
                    if (kDebugMode) {
                      print('Settings Button Clicked');
                    }// Handle sign-in logic here using _emailController and _passwordController.
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                final user = userList[index];
                return UsersSearchResultsWidget(
                  name: user['name'],
                  username: user['username'],
                  bio: user['bio'],
                  imgUrl: user['imgUrl'],
                  isVerified: user['isVerified'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}