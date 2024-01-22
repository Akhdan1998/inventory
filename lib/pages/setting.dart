part of 'pages.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  bool _obsecureText1 = true;
  bool _obsecureText2 = true;

  void _logout() async {
    try {
      await _auth.signOut();
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.remove('user_id');
      // prefs.remove('user_email');
      Get.offAll(SignInPage());
      print("sukses logout");
    } catch (e) {
      print("Error during logout: $e");
    }
  }

  void _changePassword() async {
    try {
      User? user = _auth.currentUser;

      if (user == null) {
        // Tidak ada pengguna yang sedang login
        return;
      }

      AuthCredential credential = EmailAuthProvider.credential(
        email: user.email ?? '',
        password: _currentPasswordController.text,
      );

      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(_newPasswordController.text);

      // Mengosongkan controller
      _currentPasswordController.clear();
      _newPasswordController.clear();

      // Menampilkan notifikasi bahwa password berhasil diganti
      Navigator.pop(context);
      _showToast("Password berhasil diganti", Colors.green);
    } on FirebaseAuthException catch (e) {
      // Menampilkan notifikasi untuk kesalahan yang mungkin terjadi
      _showToast("Terjadi kesalahan: ${e.message}", Colors.red);
      print('ERRORRR ${e.message}');
    }
  }

  void _showToast(String message, Color backgroundColor) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

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
                  onTap: () {
                    showDialog(context: context, builder: (BuildContext context) {
                      return Form(
                        key: _formState,
                        child: AlertDialog(
                          actionsAlignment: MainAxisAlignment.center,
                          actionsPadding: EdgeInsets.only(bottom: 15, top: 15),
                          contentPadding: EdgeInsets.only(left: 15, top: 15, right: 15),
                          content: StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextFormField(
                                    key: Key('current_password'),
                                    obscureText: _obsecureText1,
                                    cursorColor: Colors.black,
                                    controller: _currentPasswordController,
                                    validator: (value) {
                                      if (value == '') {
                                        return 'The previous password cannot be empty!!';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _obsecureText1 = !_obsecureText1;
                                          });
                                        },
                                        child: Icon(
                                          _obsecureText1
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Colors.grey, size: 15,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      fillColor: Colors.grey.withOpacity(0.10),
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(9)),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.only(
                                          left: 10, top: 5, bottom: 5),
                                      hintStyle: GoogleFonts.poppins().copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.grey,
                                      ),
                                      hintText: 'previous password',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(9),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    key: Key('new_password'),
                                    obscureText: _obsecureText2,
                                    cursorColor: Colors.black,
                                    controller: _newPasswordController,
                                    validator: (value) {
                                      if (value == '') {
                                        return 'The latest password cannot be empty!!';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _obsecureText2 = !_obsecureText2;
                                          });
                                        },
                                        child: Icon(
                                          _obsecureText2
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Colors.grey, size: 15,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      fillColor: Colors.grey.withOpacity(0.10),
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(9)),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.only(
                                          left: 10, top: 5, bottom: 5),
                                      hintStyle: GoogleFonts.poppins().copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.grey,
                                      ),
                                      hintText: 'Latest password',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(9),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                if (_formState.currentState!.validate()) {
                                  _changePassword();
                                } else {}
                              },
                              child: Text('Change Password'),
                            ),
                          ],
                        ),
                      );
                    });
                  },
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
                              _logout();
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
