part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final email = TextEditingController(text: 'admin@gmail.com');
  final pass = TextEditingController(text: 'adminadmin');
  final _formState = GlobalKey<FormState>();
  bool _obsecureText = true;
  bool isLoading = false;

  void _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.text,
        password: pass.text,
      );
      // Jika berhasil login, Anda dapat melakukan navigasi atau tindakan lainnya di sini
      print("Login berhasil: ${userCredential.user?.email}");
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString('user_id', userCredential.user?.uid ?? '');
      // prefs.setString('user_email', userCredential.user?.email ?? '');
      Get.off(navigasi());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        // Menampilkan notifikasi jika email atau password tidak valid
        Fluttertoast.showToast(
            msg: "Incorrect email or password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: '4599DB'.toColor(),
            textColor: Colors.white,
            fontSize: 16.0
        );
      } else {
        // Menampilkan notifikasi untuk kesalahan lainnya
        Fluttertoast.showToast(
            msg: "The email and password combination is incorrect",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: '4599DB'.toColor(),
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formState,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: GoogleFonts.poppins().copyWith(
                  fontWeight: FontWeight.bold,
                  color: 'FFFFFF'.toColor(),
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 25),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: 'FFFFFF'.toColor(),
                ),
                cursorColor: 'FFFFFF'.toColor(),
                controller: email,
                validator: (value) {
                  if (value == '' || !value!.contains('@')) {
                    return 'Email cannot be empty!!';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.transparent,
                    ),
                  ),
                  fillColor: Colors.grey.withOpacity(0.10),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.transparent,
                    ),
                  ),
                  contentPadding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                  hintStyle: GoogleFonts.poppins().copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                  hintText: 'Enter Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                obscureText: _obsecureText,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: 'FFFFFF'.toColor(),
                ),
                cursorColor: 'FFFFFF'.toColor(),
                controller: pass,
                validator: (value) {
                  if (value == '') {
                    return 'Password cannot be empty!!';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obsecureText = !_obsecureText;
                      });
                    },
                    child: Icon(
                      _obsecureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.transparent,
                    ),
                  ),
                  fillColor: Colors.grey.withOpacity(0.10),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.transparent,
                    ),
                  ),
                  contentPadding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                  hintStyle: GoogleFonts.poppins().copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                  hintText: 'Enter Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),
              SizedBox(height: 25),
              GestureDetector(
                onTap: () async {
                  if (_formState.currentState!.validate()) {
                    setState(() {
                      isLoading = true;
                    });
                    _login();
                  } else {}
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      colors: [
                        '4599DB'.toColor(),
                        '62CDCB'.toColor(),
                      ],
                      begin: Alignment.bottomRight,
                      end: Alignment.centerLeft,
                    ),
                  ),
                  child: (isLoading = true)
                      ? Text(
                    'Login',
                    style: GoogleFonts.poppins().copyWith(
                      fontSize: 15,
                      color: 'FFFFFF'.toColor(),
                      fontWeight: FontWeight.bold,
                    ),
                  )
                      : Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: 'FFFFFF'.toColor(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void showNotifikasi(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message.toString())));
  }
}
