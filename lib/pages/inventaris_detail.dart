part of 'pages.dart';

class inventaris extends StatefulWidget {
  const inventaris({super.key});

  @override
  State<inventaris> createState() => _inventarisState();
}

class _inventarisState extends State<inventaris> {
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
      body: Container(
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
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.30),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Item',
                                              style: GoogleFonts.poppins()
                                                  .copyWith(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              'Item code',
                                              style: GoogleFonts.poppins()
                                                  .copyWith(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              'Purchase date',
                                              style: GoogleFonts.poppins()
                                                  .copyWith(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              'First stock',
                                              style: GoogleFonts.poppins()
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
                                              style: GoogleFonts.poppins()
                                                  .copyWith(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              ':',
                                              style: GoogleFonts.poppins()
                                                  .copyWith(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              ':',
                                              style: GoogleFonts.poppins()
                                                  .copyWith(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              ':',
                                              style: GoogleFonts.poppins()
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
                                              style: GoogleFonts.poppins()
                                                  .copyWith(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              e.get('kode') ?? '-',
                                              style: GoogleFonts.poppins()
                                                  .copyWith(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              e.get('tanggal') ?? '-',
                                              style: GoogleFonts.poppins()
                                                  .copyWith(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              e.get('nilaiAwal'),
                                              style: GoogleFonts.poppins()
                                                  .copyWith(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                            // Text(
                                            //   e.get('pemakaian') ?? '-',
                                            //   style: GoogleFonts.poppins()
                                            //       .copyWith(
                                            //     color: Colors.white,
                                            //     fontSize: 13,
                                            //   ),
                                            // ),
                                            // Text(
                                            //   e.get('umurTeknis') ?? '-',
                                            //   style: GoogleFonts.poppins()
                                            //       .copyWith(
                                            //     color: Colors.white,
                                            //     fontSize: 13,
                                            //   ),
                                            // ),
                                            // Text(
                                            //   e.get('umurFungsional') ?? '-',
                                            //   style: GoogleFonts.poppins()
                                            //       .copyWith(
                                            //     color: Colors.white,
                                            //     fontSize: 13,
                                            //   ),
                                            // ),
                                            // Text(
                                            //   NumberFormat.currency(
                                            //       locale: 'id', decimalDigits: 0)
                                            //       .format(e.get('penyusutan')),
                                            //   // 'Rp. ' + e.get('penyusutan') + ' ,-',
                                            //   style: GoogleFonts.poppins()
                                            //       .copyWith(
                                            //     color: Colors.white,
                                            //     fontSize: 13,
                                            //   ),
                                            // ),
                                            // Text(
                                            //   NumberFormat.currency(
                                            //       locale: 'id', decimalDigits: 0)
                                            //       .format(e.get('sisiNilai')),
                                            //   // 'Rp. ' + e.get('sisiNilai') + ' ,-',
                                            //   style: GoogleFonts.poppins()
                                            //       .copyWith(
                                            //     color: Colors.white,
                                            //     fontSize: 13,
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ],
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
    );
  }
}
