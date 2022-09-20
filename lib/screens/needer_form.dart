import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bloodbank/reusable_widgets/reusable_widget.dart';

class Needer_form extends StatefulWidget{
  String email;
  Needer_form(this.email);
  @override
  _Needer_formstate createState() => _Needer_formstate(email);
}

class _Needer_formstate extends State<Needer_form>{

  String email;
  _Needer_formstate(this.email);
  static const IconData bloodtype = IconData(0xe0e3, fontFamily: 'MaterialIcons');

  String bg1 = "";
  String bg2 = "";
  String first = "";
  String age1 ="";
  String email1 = "";
  String phone = "";
  String add1 = "";
  String add2 = "";
  String state = "";
  String country = "";
  String phone2 = "";

  late int age;

  TextEditingController _firstnameTextController = TextEditingController();
  TextEditingController _ageTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _phoneTextController = TextEditingController();
  TextEditingController _add1TextController = TextEditingController();
  TextEditingController _add2TextController = TextEditingController();
  TextEditingController _stateTextController = TextEditingController();
  TextEditingController _countryTextController = TextEditingController();
  TextEditingController _phone2TextController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text('Register for blood',
            style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(

        child: Container(
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    profiletextfield("Name", false,
                        _firstnameTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    profiletextfield("Age", false,
                        _ageTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButtonFormField(
                        items: <String>["A","B","AB","O"].map(
                                (e) => DropdownMenuItem(child: Text(e),value: e,)
                        ).toList(),
                        onChanged: (String? val) {
                          setState(() {
                            bg1 = val!;
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down_circle,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                            hintText: "Blood Type",
                            hintStyle: TextStyle(
                                color: Colors.black38,
                                fontSize: 15
                            ),
                        ),
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButtonFormField(
                        items: <String>["+","-"].map(
                                (e) => DropdownMenuItem(child: Text(e),value: e,)
                        ).toList(),
                        onChanged: (String? val) {
                          setState(() {
                            bg2 = val!;
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down_circle,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                            hintText: "Antigen",
                            hintStyle: TextStyle(
                                color: Colors.black38,
                                fontSize: 15
                            ),
                        ),
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    profiletextfield("Email", false,
                        _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    profiletextfield("Phone", false,
                        _phoneTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    profiletextfield("Address Line 1", false,
                        _add1TextController),
                    const SizedBox(
                      height: 20,
                    ),
                    profiletextfield("Address Line 2", false,
                        _add2TextController),
                    const SizedBox(
                      height: 20,
                    ),
                    profiletextfield("State", false,
                        _stateTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    profiletextfield("Country", false,
                        _countryTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    profiletextfield("Phone number 2", false,
                        _phone2TextController),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                        onTap: ()=>{
                          first = _firstnameTextController.text,
                          age1 = _ageTextController.text,
                          email1 = _emailTextController.text,
                          phone = _phoneTextController.text,
                          add1 = _add1TextController.text,
                          add2 = _add2TextController.text,
                          phone2 = _phone2TextController.text,
                          state = _stateTextController.text,
                          country = _countryTextController.text,
                          if(_firstnameTextController.text == '' ){
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Firstname is empty')))
                          }
                          else if(_ageTextController.text == ''){
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Age is empty')))
                          }
                          else if(bg1==''){
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Blood group is empty')))
                            }
                            else if(bg2==''){
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Antigen is empty')))
                              }
                              else if(_emailTextController.text==''){
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Email is empty')))
                                }
                                else if(_emailTextController.text != ''){
                                    if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(_emailTextController.text)){
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Enter a valid email')))
                                    }
                                  }
                                  else if(_phoneTextController.text ==''){
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Phone is empty')))
                                    }
                                    else if(_phoneTextController.text != ''){
                                        if(RegExp(r"^[a-zA-Z]").hasMatch(_phoneTextController.text))
                                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Enter Valid Phone')))
                                      }
                                  else if(_add1TextController.text == ''){
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Address line 1 is empty')))
                                    }
                                    else if(_add2TextController.text == ''){
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Address line 2 is empty')))
                                      }
                                        else if(_stateTextController.text == ''){
                                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('State is empty')))
                                          }
                                          else if(_countryTextController.text == ''){
                                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Country is empty')))
                                            },
                          createUser(
                              first,age1,email1,phone,add1,add2,state,country,phone2,bg1,bg2,email),
                        },
                        child: Container(
                          height: 50,
                          width: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.black12
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(95, 10, 20, 0),
                            child: Text("Submit",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)),
                          ),
                        )
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ))
        ),
      ),
    );
  }

  createUser(first,age1,email1,phone,add1,add2,state,country,phone2,bg1,bg2,email)async{
    final user = FirebaseFirestore.instance.collection('needer').doc(email);
    final json = {
      'first':first,'age1':age1,'email':email1,'phone':phone,'add1':add1,'add2':add2,'state':state,'country':country,'phone2':phone2,'blood':bg1,'antigen':bg2
    };
    await user.set(json);
    return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Submitted')));;
  }

}