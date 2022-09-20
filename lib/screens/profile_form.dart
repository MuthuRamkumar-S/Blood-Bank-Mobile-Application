import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:bloodbank/reusable_widgets/reusable_widget.dart';

class Profile_form extends StatefulWidget {
  String email;
  Profile_form(this.email);

  @override
  _Profile_formState createState() => _Profile_formState(email);
}

class _Profile_formState extends State<Profile_form>
{
  String email;

  _Profile_formState(this.email);
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _lnamecontroller = TextEditingController();
  TextEditingController _fnamecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _phonecontroller = TextEditingController();
  TextEditingController _addresscontroller = TextEditingController();
  TextEditingController _dobcontroller = TextEditingController();
  TextEditingController _gendercontroller = TextEditingController();
  TextEditingController _qualifycontroller = TextEditingController();
  TextEditingController _desigcontroller = TextEditingController();
  TextEditingController _aboutcontroller = TextEditingController();

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
  Widget build(BuildContext context)
  {
    // final Storage storage = Storage();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                profiletextfield("Enter your First name", false, _namecontroller),
                const SizedBox(
                  height: 15,
                ),
                profiletextfield("Enter your Last name", false, _lnamecontroller),
                const SizedBox(
                  height: 15,
                ),
                profiletextfield("Enter your father name", false, _fnamecontroller),
                const SizedBox(
                  height: 15,
                ),
                profiletextfield("Enter your email id", false, _emailcontroller),
                const SizedBox(
                  height: 15,
                ),
                profiletextfield("Enter your phone", false, _phonecontroller),
                const SizedBox(
                  height: 15,
                ),
                profiletextfield("Enter your address", false, _addresscontroller),
                const SizedBox(
                  height: 15,
                ),
                profiletextfield("Enter your DOB", false, _dobcontroller),
                const SizedBox(
                  height: 15,
                ),
                profiletextfield("Enter your gender", false, _gendercontroller),
                const SizedBox(
                  height: 15,
                ),
                profiletextfield("Enter your qualification", false, _qualifycontroller),
                const SizedBox(
                  height: 15,
                ),
                profiletextfield("Enter your designation", false, _desigcontroller),
                const SizedBox(
                  height: 30,
                ),
                profiletextfield("About Yourself", false, _aboutcontroller),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () async{
                      final results = await FilePicker.platform.pickFiles(
                          allowMultiple: false,
                          type: FileType.custom,
                          allowedExtensions: ['png','jpg','jpeg']
                      );
                      if(results == null){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No file selected')));
                      }
                      final path = results?.files.single.path!;
                      final fileName = results?.files.single.name;

                      File file = File(path!);
                      final ref = FirebaseStorage
                          .instance
                          .ref()
                          .child(email);
                      await ref.putFile(file);
                      url = await ref.getDownloadURL();

                      // url =await FirebaseStorage.instance.ref('images/$fileName').getDownloadURL();

                    }, child: Text('Upload your profile photo'),
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                Opacity(
                    opacity: 0.5,
                    child:GestureDetector(
                        onTap: () => {
                          name = _namecontroller.text,
                          lname = _lnamecontroller.text,
                          fname = _fnamecontroller.text,
                          email1 = _emailcontroller.text,
                          phone = _phonecontroller.text,
                          address = _addresscontroller.text,
                          dob = _dobcontroller.text,
                          gender = _gendercontroller.text,
                          qualify = _qualifycontroller.text,
                          desig = _desigcontroller.text,
                          about = _aboutcontroller.text,
                          print(url),
                          print(email),
                          // create.add({'name':name,'father name':fname,'email':email,'phone':phone,'address':address,'dob':dob,'gender':gender,'qualify':qualify,'desig':desig})
                          if(url==''){
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select profile'))),
                          }
                          else{
                          createUser(name,lname,fname,email1,phone,address,dob,gender,qualify,desig,about,url,email),
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.blue
                          ),
                          child: Center(
                            child: Text("Submit",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)),
                          ),
                        ))
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
  createUser(name,lname,fname,email1,phone,address,dob,gender,qualify,desig,about,url,email) async {
    print('given '+email1);
    print('id'+email);
    final user = FirebaseFirestore.instance.collection('profile').doc(email);
    final json = {
      'name':name,'lname':lname,'fname':fname,'email1':email1,'phone':phone,'address':address,'dob':dob,'gender':gender,'qualify':qualify,'desig':desig,'about':about,'url':url
    };
    await user.set(json);
    return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Submitted')));
  }
}