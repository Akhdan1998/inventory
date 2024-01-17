part of 'pages.dart';

class tambah extends StatefulWidget {
  const tambah({super.key});

  @override
  State<tambah> createState() => _tambahState();
}

class _tambahState extends State<tambah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Container(
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
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: Text('Add Items',
              style: GoogleFonts.poppins().copyWith(
                color: Colors.white,
              ),),
          ),
        ),
      ),
    );
  }
}
