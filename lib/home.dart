import 'package:flutter/material.dart';

import 'AddVideo.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int pageIdx=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (idx){
            setState(() {
              pageIdx=idx;
            });
          },
          type: BottomNavigationBarType.fixed,
          // backgroundColor: Colors.white70,
          selectedItemColor: Colors.red,
          currentIndex: pageIdx,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.explore,size: 30,),
              label: "explore",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_library,size: 30,),
              label: "Library",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline_rounded,size: 50,),
              label: "Add",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications,size: 30,),
              label: "notifications",
            ),
          ]
      ),
      body: pages[pageIdx],
    );
  }
  var pages=[
    Text("explore"),
    Text("Libreary"),
    AddVideo(),
    Text("notifications"),

  ];
}
