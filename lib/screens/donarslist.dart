import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:bloodbank/model/userid.dart';
import 'package:flutter/material.dart';

class Donarslist extends StatefulWidget{

  @override
  _DonarslistState createState() => _DonarslistState();
}

class _DonarslistState extends State<Donarslist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.black,),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Donor's List", style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
                children: [
                  SizedBox(
                      height: 30050,
                      child: StreamBuilder(
                        stream: readUsers(),
                        builder: (context,
                            AsyncSnapshot<List<Userid>> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }
                          else if (snapshot.hasData) {
                            final users = snapshot.data!;
                            return ListView(
                              children: users.map(builduser).toList(),
                            );
                          }
                          else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      )
                  )
                ]
            )
        )
    );
  }

  Widget builduser(Userid user) =>
      Card(
          margin: EdgeInsets.all(10),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          color: Colors.blue,
          child: ListTile(
            leading: CircleAvatar(
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(user.blood),
                  Text(user.antigen)
                ],
              ),
            ),
            title: Row(
              children: [
                Text(user.name),
                Text(''),
                Text(user.last)
              ],
            ),
            subtitle: Row(
              children: [
                Text('Age : '),
                Text(user.age),
                Text('   Phone : '),
                Text(user.phone)
              ],
            ),
            trailing: Icon(
              Icons.arrow_forward_ios, size: 30, color: Colors.white,),
            textColor: Colors.white,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) =>
                  CupertinoAlertDialog(
                      title: Text('Details'),
                      content:Column(
                        children: [
                          Row(
                            children: [
                              Text('Name : '),
                              Text(user.name)
                            ],
                          ),
                          Row(
                            children: [
                              Text('Blood Group : '),
                              Text(user.blood)
                            ],
                          ),
                          Row(
                            children: [
                              Text('Antigen : '),
                              Text(user.antigen)
                            ],
                          ),
                          Row(
                            children: [
                              Text('Age : '),
                              Text(user.age)
                            ],
                          ),
                          Row(
                            children: [
                              Text('email : '),
                              Text(user.email)
                            ],
                          ),
                          Row(
                            children: [
                              Text('city : '),
                              Text(user.city)
                            ],
                          ),
                          Row(
                            children: [
                              Text('state : '),
                              Text(user.state)
                            ],
                          ),
                          Row(
                            children: [
                              Text('country : '),
                              Text(user.country)
                            ],
                          ),
                          Row(
                            children: [
                              Text('phone : '),
                              Text(user.phone)
                            ],
                          ),
                        ],
                      ),
                    actions: [
                      TextButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                            print('yes');
                          },
                          child: Text('Send SOS')
                      )
                    ],
                  )
              );
            }
          )
      );

  Stream<List<Userid>> readUsers() =>
      FirebaseFirestore.instance
          .collection('donar')
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map<Userid>((doc) => Userid.fromJson(doc.data()))
              .toList());
}