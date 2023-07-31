import 'package:flutter/material.dart';
import 'package:twitter/widgets/side_bar_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // GlobalKey to control the Scaffold state
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign the GlobalKey to the Scaffold
      appBar: AppBar(
        title: const Text('Home'),
        // Add a leading icon button to open the drawer
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Open the drawer using the GlobalKey
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: const SideBarMenu(), // Your SideBarMenu widget
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
