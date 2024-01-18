part of 'pages.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                '1F4247'.toColor(),
                '0D1D23'.toColor(),
                '09141A'.toColor(),
              ],
              begin: Alignment.centerRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 20, top: 15, bottom: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.30),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('Change password',
                      style: GoogleFonts.poppins().copyWith(
                        color: Colors.white, fontSize: 15,
                      ),),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    showDialog(context: context, builder: (BuildContext context) {
                      return AlertDialog(
                        actionsPadding: EdgeInsets.only(bottom: 5, right: 10),
                        // contentPadding: EdgeInsets.only(left: 15, top: 15, right: 15),
                        content: Text('Are you sure you want to leave?',
                          style: GoogleFonts.poppins().copyWith(),),
                        actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'No',
                                  style: GoogleFonts.poppins().copyWith(),
                                ),
                              ),
                          TextButton(
                            onPressed: () {
                              Get.offAll(SignInPage());
                            },
                            child: Text(
                              'Yes',
                              style: GoogleFonts.poppins().copyWith(),
                            ),
                          ),
                            ],
                      );
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.30),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Logout',
                          style: GoogleFonts.poppins().copyWith(
                            color: Colors.white, fontSize: 15,
                          ),),
                        Icon(Icons.logout, color: Colors.white, size: 19,)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
