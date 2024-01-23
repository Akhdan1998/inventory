part of 'pages.dart';

class history extends StatefulWidget {
  const history({super.key});

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {
  TableRow buildRow1(List<String> cells, {bool isHeader = false}) => TableRow(
        children: cells.map((cell) {
          final style = TextStyle(
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              fontSize: 10);
          return Container(
            color: Colors.grey.shade200,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Center(
              child: Text(
                cell,
                style: style,
              ),
            ),
          );
        }).toList(),
      );

  TableRow buildRow2(List<String> cells) => TableRow(
        children: cells.map((cell) {
          final style = TextStyle(
              fontWeight: FontWeight.normal, fontSize: 10, color: Colors.white);
          return Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Center(
              child: Text(
                cell,
                style: style,
              ),
            ),
          );
        }).toList(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 10, right: 10, top: 20),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Transaction History',
                  style: GoogleFonts.poppins().copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Table(
                  columnWidths: {
                    0: FractionColumnWidth(0.1),
                    1: FractionColumnWidth(0.2),
                  },
                  // defaultVerticalAlignment: TableCellVerticalAlignment.top,
                  border: TableBorder.all(width: 1, color: 'AAAAAA'.toColor()),
                  children: [
                    buildRow1([
                      'No.',
                      'Items',
                      'Item Code',
                      'Borrowing',
                      'Return',
                      'Purchase',
                    ], isHeader: true),
                    buildRow2([
                      '1.',
                      'HDD',
                      'HDD-01',
                      '01-01-2023',
                      '20-01-2023',
                      '11-12-2022',
                    ]),
                    buildRow2([
                      '2.',
                      'Mouse',
                      'Mouse-01',
                      '24-12-2023',
                      '15-03-2023',
                      '23-11-2021',
                    ]),
                    buildRow2([
                      '3.',
                      'Server',
                      'Server-01',
                      '02-05-2021',
                      '09-02-2021',
                      '12-11-2020',
                    ]),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
