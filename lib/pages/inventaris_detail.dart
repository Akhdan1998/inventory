part of 'pages.dart';

class inventaris extends StatefulWidget {
  const inventaris({super.key});

  @override
  State<inventaris> createState() => _inventarisState();
}

class _inventarisState extends State<inventaris> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        height: MediaQuery.of(context).size.height - 144,
        alignment: Alignment.center,
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Item',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Item code',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Purchase date',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Initial Value',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Usage (Years)',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Technical Age (Years)',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Functional Age (Years)',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Annual Depreciation',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Remaining Value',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                        ],
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(':',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text(':',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text(':',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text(':',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text(':',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text(':',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text(':',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text(':',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text(':',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                        ],
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('HDD',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('HDD-01',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('01/01/2023',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Rp. 1.500.000',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('1',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('10',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('8',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Rp. 187.500',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Rp. 1.312.500',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Item',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Item code',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Purchase date',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Initial Value',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Usage (Years)',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Technical Age (Years)',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Functional Age (Years)',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Annual Depreciation',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Remaining Value',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                        ],
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(':',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text(':',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text(':',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text(':',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text(':',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text(':',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text(':',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text(':',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text(':',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                        ],
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mouse',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Mouse-01',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('01/01/2023',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Rp. 350.000',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('1',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('2',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('1',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Rp. 350.000',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Rp. 0',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Item',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Item code',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Purchase date',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Initial Value',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Usage (Years)',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Technical Age (Years)',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Functional Age (Years)',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Annual Depreciation',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Remaining Value',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                        ],
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(':',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text(':',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text(':',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text(':',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text(':',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text(':',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text(':',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text(':',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text(':',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                        ],
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Server',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Server-01',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('10/01/2023',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Rp. 25.500.000',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('4',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('15',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('10',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Rp. 2.550.000',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                          Text('Rp. 15.300.000',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontSize: 13,
                            ),),
                        ],
                      ),
                    ],
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
