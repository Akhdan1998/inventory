part of 'pages.dart';

class inventory extends StatefulWidget {
  const inventory({super.key});

  @override
  State<inventory> createState() => _inventoryState();
}

class _inventoryState extends State<inventory> {
  PageController pageController = PageController(initialPage: 0);
  String selectedButton = '1';
  int _selectedIndex = 0;
  PageController controller = PageController();
  int pageChanged = 0;

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
      // appBar: AppBar(
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         colors: [
      //           '1F4247'.toColor(),
      //           '0D1D23'.toColor(),
      //           '09141A'.toColor(),
      //         ],
      //         begin: Alignment.centerRight,
      //         end: Alignment.bottomLeft,
      //       ),
      //     ),
      //   ),
      //   automaticallyImplyLeading: false,
      //   centerTitle: true,
      //   title: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      //     GestureDetector(
      //       onTap: () {
      //         setState(() {
      //           selectedButton = '1';
      //         });
      //         pageController.animateToPage(0,
      //             duration: Duration(milliseconds: 250),
      //             curve: Curves.bounceInOut);
      //       },
      //       child: Container(
      //         alignment: Alignment.center,
      //         padding: EdgeInsets.only(top: 5, bottom: 5),
      //         color: Colors.transparent,
      //         child: Text(
      //           'Inventory',
      //           style: GoogleFonts.poppins().copyWith(
      //             color: Colors.white,
      //           ),
      //         ),
      //       ),
      //     ),
      //     Container(
      //         width: 5,
      //         height: 30,
      //         child: VerticalDivider(
      //           thickness: 2,
      //         )),
      //     GestureDetector(
      //       onTap: () {
      //         setState(() {
      //           selectedButton = '2';
      //         });
      //         pageController.animateToPage(1,
      //             duration: Duration(milliseconds: 250),
      //             curve: Curves.bounceInOut);
      //       },
      //       child: Container(
      //         alignment: Alignment.center,
      //         padding: EdgeInsets.only(top: 5, bottom: 5),
      //         color: Colors.transparent,
      //         child: Text(
      //           'Add items',
      //           style: GoogleFonts.poppins().copyWith(
      //             color: Colors.white,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ]),
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                right: 0, left: 0,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedButton = '1';
                        });
                        pageController.animateToPage(0,
                            duration: Duration(milliseconds: 250),
                            curve: Curves.bounceInOut);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        color: Colors.transparent,
                        child: Text(
                          'Inventory',
                          style: GoogleFonts.poppins().copyWith(
                            color: '1F4247'.toColor(),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        width: 5,
                        height: 30,
                        child: VerticalDivider(
                          thickness: 2,
                        )),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedButton = '2';
                        });
                        pageController.animateToPage(1,
                            duration: Duration(milliseconds: 250),
                            curve: Curves.bounceInOut);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        color: Colors.transparent,
                        child: Text(
                          'Add items',
                          style: GoogleFonts.poppins().copyWith(
                            color: '1F4247'.toColor(),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
            ),
            Positioned(
              top: 50,right: 0, left: 0,
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      pageChanged = index;
                    });
                    print(pageChanged);
                  },
                  children: [
                    inventaris(),
                    tambah(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
