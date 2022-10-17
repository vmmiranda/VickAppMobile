import 'package:flutter/material.dart';
import 'package:flutter_vick_app/pages/Contato/contato.dart';
import 'package:flutter_vick_app/pages/Gerais/viagem.dart';
import 'package:flutter_vick_app/pages/Reservas/home.dart';
import 'package:flutter_vick_app/pages/Widgets/icones.dart';

class MainScreenViagem extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreenViagem> {
  int _indiceAtual = 0;
  late PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: List.generate(3, (index) => HomeViagem()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: "Reservas"),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_travel), label: "Viagens"),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_page), label: "Contato"),
        ],
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });

    switch (_indiceAtual) {
      case 0:
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return Travel();
            },
          ),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return Contato();
            },
          ),
        );
        break;
      default:
        print("ERRO");
    }
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  Widget barIcon(
      {IconData icon = Icons.home, int page = 0, bool badge = false}) {
    return IconButton(
      icon: badge ? Icones(icon: icon, size: 20.0) : Icon(icon, size: 20.0),
      color:
          _page == page ? Theme.of(context).accentColor : Colors.blueGrey[300],
      onPressed: () => _pageController.jumpToPage(page),
    );
  }
}
