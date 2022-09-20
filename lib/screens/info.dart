import 'package:flutter/material.dart';

class Info extends StatefulWidget{
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood types and who can donate',style: TextStyle(fontSize: 16,color: Colors.blue),),
        centerTitle: true,
        leading: BackButton(color: Colors.black,),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Text('How Blood Type Is Determined',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(padding: EdgeInsets.all(20),
            child: Text("Blood types are determined by the presence or absence"
                " of certain antigens – substances that can trigger an"
                " immune response if they are foreign to the body.  "
                "Since some antigens can trigger a patient's immune system "
                "to attack the transfused blood, safe blood transfusions"
                " depend on careful blood typing and cross-matching.",
              textAlign: TextAlign.justify,
            ),
      ),
            Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Text("There are four major blood groups determined by "
                  "the presence or absence of two antigens, A and B, on the "
                  "surface of red blood cells. In addition to the A and B antigens,"
                  " there is a protein called the Rh factor, which can be either "
                  "present (+) or absent (–), creating the 8 most common blood types "
                  "(A+, A-,  B+, B-,  O+, O-,  AB+, AB-).",
                textAlign: TextAlign.justify,
              ),
            ),
            Center(
              child: Text('Blood Group Types with antigens',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
            ),
            const SizedBox(
              height:10
            ),
            Center(
            child: DataTable(
                columns: [
                  DataColumn(label: Text('Bloodtype/Antigens',
                    style: TextStyle(color: Colors.blue))),
                  DataColumn(label: Text('+')),
                  DataColumn(label: Text('-'))
                ],
                rows: [
                  DataRow(
                      cells: [
                        DataCell(Text('A')),
                        DataCell(Text('A+')),
                        DataCell(Text('A-')),
                      ]),
                  DataRow(
                      cells: [
                        DataCell(Text('B')),
                        DataCell(Text('B+')),
                        DataCell(Text('B-')),
                      ]),
                  DataRow(
                      cells: [
                        DataCell(Text('AB')),
                        DataCell(Text('AB+')),
                        DataCell(Text('AB-')),
                      ]),
                  DataRow(
                      cells: [
                        DataCell(Text('O')),
                        DataCell(Text('O+')),
                        DataCell(Text('O-')),
                      ]),
                ])),
            SizedBox(
              height: 20,
            ),
            Center(
            child: Text("Who can donate to whom?",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red
            ),)),
            SizedBox(
              height: 10
            ),
            Center(
            child:DataTable(
                columns: [
                  DataColumn(label: Text('Blood Type')),
                  DataColumn(label: Text('Whom you can donate'))
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('A+')),
                    DataCell(Text('A+, AB+')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('A-')),
                    DataCell(Text('A-, A+, AB-, AB+')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('B+')),
                    DataCell(Text('B+, AB+')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('B-')),
                    DataCell(Text('B-, B+, AB-, AB+')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('AB+')),
                    DataCell(Text('AB+')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('AB-')),
                    DataCell(Text('AB-, AB+')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('O+')),
                    DataCell(Text('O+, A+, B+, AB+	')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('O-')),
                    DataCell(Text('All Blood Types')),
                  ]),
                ])),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text("From whom you can receive?",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red
                  ),)),
            SizedBox(
                height: 10
            ),
            Center(
                child:DataTable(
                    columns: [
                      DataColumn(label: Text('Blood Type')),
                      DataColumn(label: Text('You Can Receive From'))
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text('A+')),
                        DataCell(Text('A+, A-, O+, O-')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('A-')),
                        DataCell(Text('A-, O-')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('B+')),
                        DataCell(Text('B+, B-, O+, O-')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('B-')),
                        DataCell(Text('B-, O-')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('AB+')),
                        DataCell(Text('All Blood Types')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('AB-')),
                        DataCell(Text('AB-, A-, B-, O-')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('O+')),
                        DataCell(Text('O+, O-')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('O-')),
                        DataCell(Text('O-')),
                      ]),
                    ]))
          ],
        ),
      ),
    );
  }

}