import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/neederid.dart';

class Needers_list extends StatefulWidget{

  @override
  _Needers_listState createState() => _Needers_listState();
}

class _Needers_listState extends State<Needers_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black,),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Needer's List", style: TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),),
        centerTitle: true,
        ),
      body: SingleChildScrollView(
        child:SizedBox(
            height: 320,
            child: StreamBuilder(
              stream: readUsers(),
              builder: (context,
                  AsyncSnapshot<List<Neederid>> snapshot) {
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
    ),
    );
  }
  Widget builduser(Neederid user) =>
      Card(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                    Text(user.bloodtype),
                    Text(user.antigen)
                  ],
                ),
              ),
              title:
              Text(user.name),
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
                                  Text(user.bloodtype)
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
                                  Text(user.add2)
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

  Stream<List<Neederid>> readUsers() =>
      FirebaseFirestore.instance
          .collection('needer')
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map<Neederid>((doc) => Neederid.fromJson(doc.data()))
              .toList());
}