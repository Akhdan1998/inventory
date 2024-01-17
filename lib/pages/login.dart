part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final email = TextEditingController(text: 'WKWK@');
  final pass = TextEditingController(text: 'WKWK');
  final _formState = GlobalKey<FormState>();
  final LinearGradient _gradient = LinearGradient(
    colors: [
      '94783E'.toColor(),
      'F3EDA6'.toColor(),
      'F8FAE5'.toColor(),
      'FFE2BE'.toColor(),
      'D5BE88'.toColor(),
      'F8FAE5'.toColor(),
      'D5BE88'.toColor(),
    ],
    begin: Alignment.topRight,
    end: Alignment.centerLeft,
  );
  bool _obsecureText = true;
  bool isLoading = false;

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
                    // _formState.currentState!.save();
                    setState(() {
                      isLoading = true;
                    });
                  //   if (FirebaseAuth.instance.currentUser == null) {
                  //     try {
                  //       await FirebaseAuth.instance.signInWithEmailAndPassword(
                  //         email: email.text, password: pass.text,
                  //       );
                  //     } on FirebaseAuthException catch (e) {
                  //       showNotifikasi(context, e.message.toString());
                  //     }
                  //   }
                    Get.to(navigasi());
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
}
