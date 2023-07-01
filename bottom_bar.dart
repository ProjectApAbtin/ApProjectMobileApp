import 'package:booktickets/screens/DashboardB.dart';
import 'package:booktickets/screens/bodyone.dart';
import 'package:booktickets/screens/home_screen.dart';
import 'package:booktickets/screens/pf_screen.dart';
import 'package:booktickets/screens/profileAvatarPage.dart';
import 'package:booktickets/screens/search_screen.dart';
import 'package:booktickets/screens/wallet_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex=0;
  static final List<Widget>_widgetOptions =<Widget>[
    HomeScreen(),
    SearchScreen(),
    const Text("Ticket"),
    ProfileA(),
    WalletPage(),

  ];
  void _onItemTapped(int index){
setState(() {
  _selectedIndex=index;
});


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        showSelectedLabels: false, //false or true?
        showUnselectedLabels:true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Colors.blueGrey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), activeIcon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search),activeIcon:Icon(Icons.search) , label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket),activeIcon:Icon(Icons.airplane_ticket) , label: "Tickets"),
          BottomNavigationBarItem(icon: Icon(Icons.person),activeIcon:Icon(Icons.person) , label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.wallet),activeIcon:Icon(Icons.wallet) , label: "Wallet"),

        ],
      ),
    );
  }
}
