import 'package:finalproject/components/palettes.dart';
<<<<<<< HEAD
import 'package:finalproject/pages/own_quote.dart';
=======
import 'package:finalproject/pages/list_quotes.dart';
>>>>>>> eb2f5db9647e76cbe69dfc2bbf7beb9d663ea691
import 'package:flutter/material.dart';
import 'package:finalproject/pages/homepage.dart';
import 'package:finalproject/pages/profile.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
<<<<<<< HEAD
  List pages = [Homepage(), FavoriteQuotes(), OwnQuotePage(), ProfilePage()];
=======
  List pages = [
    Homepage(),
    ListQuotes(),
    ProfilePage(),
  ];
>>>>>>> eb2f5db9647e76cbe69dfc2bbf7beb9d663ea691

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Palette.mainColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
<<<<<<< HEAD
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.notes_rounded), label: 'Own Quotes'),
=======
              icon: Icon(Icons.format_quote_rounded), label: 'Quotes'),
>>>>>>> eb2f5db9647e76cbe69dfc2bbf7beb9d663ea691
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff000000),
        onTap: _onItemTapped,
      ),
    );
  }
}
