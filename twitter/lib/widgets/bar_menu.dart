import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/providers/share_state.dart';
import 'package:twitter/screens/home_screen.dart';
import 'package:twitter/screens/search_screen.dart';
import 'package:twitter/screens/notifications_screen.dart';
import 'package:twitter/screens/chats_screen.dart';

class BarMenu extends StatefulWidget {
  const BarMenu({super.key});

  @override
  _BarMenuState createState() => _BarMenuState();
}

class _BarMenuState extends State<BarMenu> {
  late PageController _pageController;
  int _currentIndex = 0;

  Color _selectedItemColor = Colors.blue;
  Color _unselectedItemColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          const HomeScreen(),
          SearchScreen(),
          NotificationsScreen(),
          ChatsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
        ],
        selectedItemColor: _selectedItemColor,
        unselectedItemColor: _unselectedItemColor,
      ),
    );
  }
}
