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
  String language = '1';

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
                        decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                            color: (selectedButton == '1')
                                ? '1F4247'.toColor()
                                : Colors.transparent,
                          ),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Inventory',
                          style: GoogleFonts.poppins().copyWith(
                              color: (selectedButton == '1')
                                  ? Colors.white
                                  : '1F4247'.toColor(),
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                          color: (selectedButton == '2')
                              ? '1F4247'.toColor()
                              : Colors.transparent,
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Add items',
                          style: GoogleFonts.poppins().copyWith(
                            color: (selectedButton == '2')
                                ? Colors.white
                                : '1F4247'.toColor(),
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
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
