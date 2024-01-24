part of 'pages.dart';

class inventaris extends StatefulWidget {
  const inventaris({super.key});

  @override
  State<inventaris> createState() => _inventarisState();
}

class _inventarisState extends State<inventaris> {
  final namaEdit = TextEditingController();
  final kodeEdit = TextEditingController();
  final tanggalEdit = TextEditingController();
  final nilaiAwalEdit = TextEditingController();
  final _formState = GlobalKey<FormState>();

  Future<void> getData() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    QuerySnapshot querySnapshot = await users.get();

    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      print('ID: ${documentSnapshot.id}, Data: ${documentSnapshot.data()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Scaffold(
      body: Form(
        key: _formState,
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
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
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: StreamBuilder<QuerySnapshot>(
                stream: users.snapshots(),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.docs.isNotEmpty) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: snapshot.data!.docs
                              .map(
                                (e) => Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          namaEdit.text = e.get('nama') ?? '';
                                          kodeEdit.text = e.get('kode') ?? '';
                                          tanggalEdit.text =
                                              e.get('tanggal') ?? '';
                                          nilaiAwalEdit.text =
                                              e.get('nilaiAwal') ?? '';
                                        });

                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                content: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        "Edit Items",
                                                        style: GoogleFonts
                                                                .poppins()
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                      SizedBox(height: 10),
                                                      TextFormField(
                                                        textCapitalization:
                                                            TextCapitalization
                                                                .sentences,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        cursorColor:
                                                            Colors.black,
                                                        controller: namaEdit,
                                                        validator: (value) {
                                                          if (value == '') {
                                                            return 'Item Name cannot be empty!!';
                                                          }
                                                          return null;
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              width: 1,
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                          ),
                                                          fillColor: Colors.grey
                                                              .withOpacity(
                                                                  0.10),
                                                          filled: true,
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            9)),
                                                            borderSide:
                                                                BorderSide(
                                                              width: 1,
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                          ),
                                                          contentPadding:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  top: 5,
                                                                  bottom: 5),
                                                          hintStyle: GoogleFonts
                                                                  .poppins()
                                                              .copyWith(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color: Colors.grey,
                                                          ),
                                                          hintText:
                                                              'Enter the item name',
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        9),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 15),
                                                      TextFormField(
                                                        keyboardType:
                                                            TextInputType.text,
                                                        cursorColor:
                                                            Colors.black,
                                                        controller: kodeEdit,
                                                        validator: (value) {
                                                          if (value == '') {
                                                            return 'Item code cannot be empty!!';
                                                          }
                                                          return null;
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            9)),
                                                            borderSide:
                                                                BorderSide(
                                                              width: 1,
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                          ),
                                                          fillColor: Colors.grey
                                                              .withOpacity(
                                                                  0.10),
                                                          filled: true,
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            9)),
                                                            borderSide:
                                                                BorderSide(
                                                              width: 1,
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                          ),
                                                          contentPadding:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  top: 5,
                                                                  bottom: 5),
                                                          hintStyle: GoogleFonts
                                                                  .poppins()
                                                              .copyWith(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color: Colors.grey,
                                                          ),
                                                          hintText:
                                                              'Enter Item Code',
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        9),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 15),
                                                      TextFormField(
                                                        onTap: () async {
                                                          DateTime? pickeddate =
                                                              await showDatePicker(
                                                                  context:
                                                                      context,
                                                                  initialDate:
                                                                      DateTime
                                                                          .now(),
                                                                  firstDate:
                                                                      DateTime(
                                                                          1945),
                                                                  lastDate:
                                                                      DateTime(
                                                                          2500));

                                                          if (pickeddate !=
                                                              null) {
                                                            setState(() {
                                                              tanggalEdit
                                                                  .text = DateFormat(
                                                                      'dd-MM-yyyy')
                                                                  .format(
                                                                      pickeddate);
                                                            });
                                                          }
                                                        },
                                                        keyboardType:
                                                            TextInputType.text,
                                                        cursorColor:
                                                            Colors.black,
                                                        controller: tanggalEdit,
                                                        validator: (value) {
                                                          if (value == '') {
                                                            return 'Date cannot be empty!!';
                                                          }
                                                          return null;
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          suffixIcon: Icon(
                                                            Icons
                                                                .calendar_today,
                                                            // color: Colors.white,
                                                            size: 18,
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            9)),
                                                            borderSide:
                                                                BorderSide(
                                                              width: 1,
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                          ),
                                                          fillColor: Colors.grey
                                                              .withOpacity(
                                                                  0.10),
                                                          filled: true,
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            9)),
                                                            borderSide:
                                                                BorderSide(
                                                              width: 1,
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                          ),
                                                          contentPadding:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  top: 5,
                                                                  bottom: 5),
                                                          hintStyle: GoogleFonts
                                                                  .poppins()
                                                              .copyWith(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color: Colors.grey,
                                                          ),
                                                          hintText:
                                                              'Enter Date',
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        9),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 15),
                                                      TextFormField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        cursorColor:
                                                            Colors.black,
                                                        controller:
                                                            nilaiAwalEdit,
                                                        validator: (value) {
                                                          if (value == '') {
                                                            return 'Initial value cannot be empty!!';
                                                          }
                                                          return null;
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            9)),
                                                            borderSide:
                                                                BorderSide(
                                                              width: 1,
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                          ),
                                                          fillColor: Colors.grey
                                                              .withOpacity(
                                                                  0.10),
                                                          filled: true,
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            9)),
                                                            borderSide:
                                                                BorderSide(
                                                              width: 1,
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                          ),
                                                          contentPadding:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  top: 5,
                                                                  bottom: 5),
                                                          hintStyle: GoogleFonts
                                                                  .poppins()
                                                              .copyWith(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color: Colors.grey,
                                                          ),
                                                          hintText:
                                                              'Enter initial stock',
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        9),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                actions: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      if (_formState
                                                          .currentState!
                                                          .validate()) {
                                                        users.doc(e.id).update({
                                                          'nama': namaEdit.text,
                                                          'kode': kodeEdit.text,
                                                          'tanggal':
                                                              tanggalEdit.text,
                                                          'nilaiAwal':
                                                              nilaiAwalEdit
                                                                  .text,
                                                        });
                                                      }
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              "Change item successfully",
                                                          toastLength: Toast
                                                              .LENGTH_SHORT,
                                                          gravity: ToastGravity
                                                              .BOTTOM,
                                                          timeInSecForIosWeb: 5,
                                                          backgroundColor:
                                                              '4599DB'
                                                                  .toColor(),
                                                          textColor:
                                                              Colors.white,
                                                          fontSize: 16.0);
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 48,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            '4599DB'.toColor(),
                                                            '62CDCB'.toColor(),
                                                          ],
                                                          begin: Alignment
                                                              .bottomRight,
                                                          end: Alignment
                                                              .centerLeft,
                                                        ),
                                                      ),
                                                      child: Text(
                                                        'Save',
                                                        style: GoogleFonts
                                                                .poppins()
                                                            .copyWith(
                                                          fontSize: 15,
                                                          color: 'FFFFFF'
                                                              .toColor(),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.30),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Item',
                                                      style:
                                                          GoogleFonts.poppins()
                                                              .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Item code',
                                                      style:
                                                          GoogleFonts.poppins()
                                                              .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Purchase date',
                                                      style:
                                                          GoogleFonts.poppins()
                                                              .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                    Text(
                                                      'First stock',
                                                      style:
                                                          GoogleFonts.poppins()
                                                              .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 15),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      ':',
                                                      style:
                                                          GoogleFonts.poppins()
                                                              .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                    Text(
                                                      ':',
                                                      style:
                                                          GoogleFonts.poppins()
                                                              .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                    Text(
                                                      ':',
                                                      style:
                                                          GoogleFonts.poppins()
                                                              .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                    Text(
                                                      ':',
                                                      style:
                                                          GoogleFonts.poppins()
                                                              .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 15),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      e.get('nama') ?? '-',
                                                      style:
                                                          GoogleFonts.poppins()
                                                              .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                    Text(
                                                      e.get('kode') ?? '-',
                                                      style:
                                                          GoogleFonts.poppins()
                                                              .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                    Text(
                                                      e.get('tanggal') ?? '-',
                                                      style:
                                                          GoogleFonts.poppins()
                                                              .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                    Text(
                                                      e.get('nilaiAwal'),
                                                      style:
                                                          GoogleFonts.poppins()
                                                              .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        actionsPadding:
                                                            EdgeInsets.only(
                                                                bottom: 5,
                                                                top: 0),
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 15,
                                                                top: 15,
                                                                right: 15),
                                                        content: Text(
                                                          'Are you sure you want to delete this item?',
                                                          style: GoogleFonts
                                                              .poppins(),
                                                        ),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text(
                                                              'No',
                                                              style: GoogleFonts
                                                                  .poppins(),
                                                            ),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              users
                                                                  .doc(e.id)
                                                                  .delete();
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Text(
                                                              'Yes',
                                                              style: GoogleFonts
                                                                  .poppins(),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    });
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }
                }),
          ),
        ),
      ),
    );
  }
}
