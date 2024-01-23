part of 'pages.dart';

class tambah extends StatefulWidget {
  const tambah({super.key});

  @override
  State<tambah> createState() => _tambahState();
}

class _tambahState extends State<tambah> {
  final nama = TextEditingController();
  final kode = TextEditingController();
  final tanggal = TextEditingController();
  final nilaiAwal = TextEditingController();
  final pemakaian = TextEditingController();
  final umurTeknis = TextEditingController();
  final umurFungsional = TextEditingController();
  final penyusutan = TextEditingController();
  final sisiNilai = TextEditingController();
  final _formState = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
        key: _formState,
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: MediaQuery.of(context).viewInsets.bottom),
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
          height: (Platform.isAndroid)
              ? MediaQuery.of(context).size.height - 144
              : MediaQuery.of(context).size.height - 209,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            reverse: false,
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: 'FFFFFF'.toColor(),
                  ),
                  cursorColor: 'FFFFFF'.toColor(),
                  controller: nama,
                  validator: (value) {
                    if (value == '') {
                      return 'Item Name cannot be empty!!';
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
                    hintText: 'Enter the item name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: 'FFFFFF'.toColor(),
                  ),
                  cursorColor: 'FFFFFF'.toColor(),
                  controller: kode,
                  validator: (value) {
                    if (value == '') {
                      return 'Item code cannot be empty!!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
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
                    hintText: 'Enter Item Code',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  onTap: () async {
                    DateTime? pickeddate =
                    await showDatePicker(
                        context: context,
                        initialDate:
                        DateTime.now(),
                        firstDate: DateTime(1945),
                        lastDate: DateTime(2500));

                    if (pickeddate != null) {
                      setState(() {
                        tanggal.text =
                            DateFormat('dd-MM-yyyy')
                                .format(pickeddate);
                      });
                    }
                  },
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: 'FFFFFF'.toColor(),
                  ),
                  cursorColor: 'FFFFFF'.toColor(),
                  controller: tanggal,
                  validator: (value) {
                    if (value == '') {
                      return 'Date cannot be empty!!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                      size: 18,
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
                    hintText: 'Enter Date',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: 'FFFFFF'.toColor(),
                  ),
                  cursorColor: 'FFFFFF'.toColor(),
                  controller: nilaiAwal,
                  validator: (value) {
                    if (value == '') {
                      return 'initial value cannot be empty!!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
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
                    hintText: 'Enter initial value',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: 'FFFFFF'.toColor(),
                  ),
                  cursorColor: 'FFFFFF'.toColor(),
                  controller: pemakaian,
                  validator: (value) {
                    if (value == '') {
                      return 'Usage(Years) cannot be empty!!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
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
                    hintText: 'Enter Usage(Years)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: 'FFFFFF'.toColor(),
                  ),
                  cursorColor: 'FFFFFF'.toColor(),
                  controller: umurTeknis,
                  validator: (value) {
                    if (value == '') {
                      return 'Technical age(Years) cannot be empty!!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
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
                    hintText: 'Enter Technical age(Years)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: 'FFFFFF'.toColor(),
                  ),
                  cursorColor: 'FFFFFF'.toColor(),
                  controller: umurFungsional,
                  validator: (value) {
                    if (value == '') {
                      return 'Functional age(Years) cannot be empty!!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
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
                    hintText: 'Enter Functional age(Years)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: 'FFFFFF'.toColor(),
                  ),
                  cursorColor: 'FFFFFF'.toColor(),
                  controller: penyusutan,
                  validator: (value) {
                    if (value == '') {
                      return 'Annual depreciation cannot be empty!!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
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
                    hintText: 'Enter Annual depreciation',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: 'FFFFFF'.toColor(),
                  ),
                  cursorColor: 'FFFFFF'.toColor(),
                  controller: sisiNilai,
                  validator: (value) {
                    if (value == '') {
                      return 'Value side cannot be empty!!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
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
                    hintText: 'Enter Value side',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () async {
                    if (_formState.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      users.add({
                        'nama': nama.text,
                        'kode': kode.text,
                        'tanggal': tanggal.text,
                        'nilaiAwal': nilaiAwal.text,
                        'pemakaian': pemakaian.text,
                        'umurTeknis': umurTeknis.text,
                        'umurFungsional': umurFungsional.text,
                        'penyusutan': penyusutan.text,
                        'sisiNilai': sisiNilai.text,
                      });
                      nama.text = '';
                      kode.text = '';
                      tanggal.text = '';
                      nilaiAwal.text = '';
                      pemakaian.text = '';
                      umurTeknis.text = '';
                      umurFungsional.text = '';
                      penyusutan.text = '';
                      sisiNilai.text = '';
                      Fluttertoast.showToast(
                          msg: "The item data has been successfully saved",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 5,
                          backgroundColor: '4599DB'.toColor(),
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
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
                      'Save',
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
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
