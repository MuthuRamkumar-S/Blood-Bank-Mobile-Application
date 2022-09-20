import 'package:bloodbank/screens/donarslist.dart';
import 'package:bloodbank/screens/request_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'bloodregister.dart';
import 'faq_page.dart';
import 'info.dart';

class Navbar extends StatefulWidget{
  @override
  String email;
  Navbar(this.email);
  _Navbarstate createState() => _Navbarstate(email);
}

class _Navbarstate extends State<Navbar>{

  String email;
  _Navbarstate(this.email);
  String name='';
  String email1 ='';

  static const IconData question_mark_outlined = IconData(0xf064c, fontFamily: 'MaterialIcons');
  static const IconData bloodtype = IconData(0xe0e3, fontFamily: 'MaterialIcons');
  static const IconData donarlist = IconData(0xe384, fontFamily: 'MaterialIcons', matchTextDirection: true);
  static const IconData info = IconData(0xe33c, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(accountName: Text('Welcome'),
              accountEmail: Text(''),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset('assets/images/avatar.png',
                  width: 90,
                  height: 90,),
                ),
              ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(196, 15, 15, 1),
            ),
          ),
          ListTile(
            title: Text('Register as Donar'),
            leading: Icon(bloodtype),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Bloodregister(email)));
            },
          ),
          ListTile(
            title: Text("Donor's list"),
            leading: Icon(donarlist),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Donarslist()));
            },
          ),
          ListTile(
            title: Text("Your Blood Request"),
            leading: Icon(bloodtype),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>Request_page(email)));
          }
          ),
          ListTile(
            title: Text("Who can donate"),
            leading: Icon(info),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>Info()));
            },
          ),
          ListTile(
            title: Text('FAQ ?'),
            leading: Icon(question_mark_outlined),
            dense: true,
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Faq_page()));
            },
          ),
        ],
      ),
    );
  
}

}