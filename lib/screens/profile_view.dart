import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile_view extends StatelessWidget{

  String email;
  Profile_view(this.email);

  String name = '';
  String lname = '';
  String fname = '';
  String email1 = '';
  String phone = '';
  String address = '';
  String dob = '';
  String gender = '';
  String qualify = '';
  String desig = '';
  String about = '';
  String url = '';

  @override
  Widget build(BuildContext context) {
    CollectionReference fetch = FirebaseFirestore.instance.collection(
        'profile');
    return FutureBuilder<DocumentSnapshot>(
      future: fetch.doc(email).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
          snapshot.data!.data() as Map<String, dynamic>;

          name = ('${data['name']}');
          lname = ('${data['lname']}');
          fname = ('${data['fname']}');
          email1 = ('${data['email1']}');
          phone = ('${data['phone']}');
          address = ('${data['address']}');
          dob = ('${data['dob']}');
          gender = ('${data['gender']}');
          qualify = ('${data['qualfiy']}');
          desig = ('${data['desig']}');
          about = ('${data['about']}');
          url = ('${data['url']}');
          // View(name,lname,fname,email,phone,address,dob,gender,qualify,desig,about);
          return Scaffold(
            appBar: AppBar(
              leading: BackButton(),
              backgroundColor: Colors.red,
              elevation: 0,
            ),
            body: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 20,
                ),
                ClipOval(
                  // child: Image.asset("assets/images/avatar.png",
                  //   width: 130,
                  //   height: 130,
                  // ),
                  child: Image.network(url,
                    width: 130,
                    height: 130,),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text('Welcome '+name+' !',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
                    child: Row(
                      children: [
                        Expanded(child:
                        Text(about,style: TextStyle(fontSize: 13,color: Colors.grey),
                          textAlign: TextAlign.justify,),)
                      ],
                    )
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(padding: EdgeInsets.fromLTRB(40, 10, 0, 0),
                    child: Row(
                      children: [
                        Text("Name  ",style: TextStyle(fontSize: 18),),
                        Padding(padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                          child: Text(name+' '+lname,style: TextStyle(fontSize: 18),),)
                      ],
                    )
                ),
                Padding(padding: EdgeInsets.fromLTRB(40, 10, 0, 0),
                    child: Row(
                      children: [
                        Text("Email  ",style: TextStyle(fontSize: 18),),
                        Padding(padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                          child: Text(email1,style: TextStyle(fontSize: 18),),)
                      ],
                    )
                ),
                Padding(padding: EdgeInsets.fromLTRB(40, 10, 0, 0),
                    child: Row(
                      children: [
                        Text("Phone  ",style: TextStyle(fontSize: 18),),
                        Padding(padding: EdgeInsets.fromLTRB(64, 0, 0, 0),
                          child: Text(phone,style: TextStyle(fontSize: 18),),)
                      ],
                    )
                ),
                Padding(padding: EdgeInsets.fromLTRB(40, 10, 0, 0),
                    child: Row(
                      children: [
                        Text("Address  ",style: TextStyle(fontSize: 18),),
                        Padding(padding: EdgeInsets.fromLTRB(54, 0, 0, 0),
                          child: Text(address,style: TextStyle(fontSize: 18),),)
                      ],
                    )
                ),
                Padding(padding: EdgeInsets.fromLTRB(40, 10, 0, 0),
                    child: Row(
                      children: [
                        Text("Gender  ",style: TextStyle(fontSize: 18),),
                        Padding(padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                          child: Text(gender,style: TextStyle(fontSize: 18),),)
                      ],
                    )
                ),
                Padding(padding: EdgeInsets.fromLTRB(40, 10, 0, 0),
                    child: Row(
                      children: [
                        Text("Education  ",style: TextStyle(fontSize: 18),),
                        Padding(padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                          child: Text(qualify,style: TextStyle(fontSize: 18),),)
                      ],
                    )
                ),
                Padding(padding: EdgeInsets.fromLTRB(40, 10, 0, 0),
                    child: Row(
                      children: [
                        Text("Designation  ",style: TextStyle(fontSize: 18),),
                        Padding(padding: EdgeInsets.fromLTRB(26, 0, 0, 0),
                          child: Text(desig,style: TextStyle(fontSize: 18),),)
                      ],
                    )
                ),
              ],
            ),
          );
        }
        return Text('loading');
      }),
    );

  }

}
