part of 'pages.dart';

class navigasi extends StatefulWidget {
  @override
  State<navigasi> createState() => _navigasiState();
}

class _navigasiState extends State<navigasi> {
  int _selectedIndex = 0;
  PageController controller = PageController();
  void _navigasiBottomBar(int index) {
    setState(() {
      _selectedIndex = index;

      controller.animateToPage(_selectedIndex,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOutCirc);
    });
  }

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        children: [
          inventory(),
          history(),
          setting(),
        ],
      ),
      bottomNavigationBar: Container(
        height: (Platform.isAndroid) ? 70 : 100,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: _navigasiBottomBar,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: '1F4247'.toColor(),
          items: [
            BottomNavigationBarItem(
              label: 'Inventory',
              icon: Icon(Icons.inventory, color: Colors.grey.shade300,),
              activeIcon: Icon(Icons.inventory, color: '1F4247'.toColor(),),
            ),
            BottomNavigationBarItem(
              label: 'History',
              icon: Icon(Icons.history, color: Colors.grey.shade300,),
              activeIcon: Icon(Icons.history, color: '1F4247'.toColor(),),
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(Icons.settings, color: Colors.grey.shade300,),
              activeIcon: Icon(Icons.settings, color: '1F4247'.toColor(),),
            ),
          ],
        ),
      ),
    );
  }
}

