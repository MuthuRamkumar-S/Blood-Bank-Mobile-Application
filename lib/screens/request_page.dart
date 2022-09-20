import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Request_page extends StatefulWidget{

  String email;
  Request_page(this.email);
  @override
  _Request_pageState createState()=> _Request_pageState(email);
}

class _Request_pageState extends State<Request_page>{

  String email;
  _Request_pageState(this.email);
  @override
  Widget build(BuildContext context) {
    CollectionReference needer = FirebaseFirestore.instance.collection('needer');

    return FutureBuilder<DocumentSnapshot>(
      //Fetching data from the documentId specified of the student
      future: needer.doc(email).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Your Request'),
              leading: BackButton(),
            ),
              body:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text('No Requests'),
                  )
                ],
              )
          );
        }
        //Data is output to the user
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            appBar: AppBar(
              title: Text('Your Request'),
              leading: BackButton()
            ),
            body: Column(
            children: [
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
                        Text(data['blood']),
                        Text(data['antigen'])
                      ],
                    ),
                  ),
                  title: Row(
                    children: [
                      Text('Name : '),
                      Text(' '),
                      Text(data['first']),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      Text('Age : '),
                      Text(data['age1']),
                      Text('   Phone : '),
                      Text(data['phone'])
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
                                      Text(data['first'])
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Blood Group : '),
                                      Text(data['blood'])
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Antigen : '),
                                      Text(data['antigen'])
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Age : '),
                                      Text(data['age1'])
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('email : '),
                                      Text(data['email'])
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('city : '),
                                      Text(data['add2'])
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('state : '),
                                      Text(data['state'])
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('country : '),
                                      Text(data['country'])
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('phone : '),
                                      Text(data['phone'])
                                    ],
                                  ),
                                ],
                              ),
                            )
                    );
                  }
              )
            ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10)
                  ),
                    child:Center(
                        child:Row(
                            children: [
                              Icon(
                                IconData(0xe1b9, fontFamily: 'MaterialIcons'),
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text('Delete',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white
                                ),
                              ),
                            ]
                        )
                    )
                ),
                onTap: (){
                  print('delete');
                  delete();
                },
              )
            ]
          )
            );
        }
        return Text("loading");
      },
    );
  }
void delete(){
    FirebaseFirestore.instance.collection('needer').doc(email).delete();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Deleted')));
}
}
