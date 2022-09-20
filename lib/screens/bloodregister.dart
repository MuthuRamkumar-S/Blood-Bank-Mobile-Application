import 'package:bloodbank/utils/color_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bloodbank/reusable_widgets/reusable_widget.dart';

class Bloodregister extends StatefulWidget{
  String emailpass;
  Bloodregister(this.emailpass);
  @override
  _Bloodregisterstate createState() => _Bloodregisterstate(emailpass);
}

class _Bloodregisterstate extends State<Bloodregister>{

  String emailpass;
  _Bloodregisterstate(this.emailpass);

  static const IconData emailicon = IconData(0xe22a, fontFamily: 'MaterialIcons');
  static const IconData fathericon = IconData(0xe03c, fontFamily: 'MaterialIcons');
  static const IconData add1icon = IconData(0xf06d5, fontFamily: 'MaterialIcons');
  static const IconData add3icon = IconData(0xee45, fontFamily: 'MaterialIcons');
  static const IconData stateicon = IconData(0xf531, fontFamily: 'MaterialIcons');
  static const IconData phoneicon = IconData(0xe4a2, fontFamily: 'MaterialIcons');
  static const IconData bloodtype = IconData(0xe0e3, fontFamily: 'MaterialIcons');
  static const IconData location_city = IconData(0xe3a8, fontFamily: 'MaterialIcons');
  static const IconData flagicon = IconData(0xe28e, fontFamily: 'MaterialIcons');

  String bg1 = "";
  String bg2 = "";
  String first = "";

  String last = "";
  String father = "";
  String age1 ="";
  String email = "";
  String phone = "";
  String add1 = "";
  String add2 = "";
  String add3 = "";
  String state = "";
  String country = "";
  String phone2 = "";

  late int age;

  TextEditingController _firstnameTextController = TextEditingController();
  TextEditingController _lastnameTextController = TextEditingController();
  TextEditingController _fathernameTextController = TextEditingController();
  TextEditingController _ageTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _phoneTextController = TextEditingController();
  TextEditingController _add1TextController = TextEditingController();
  TextEditingController _add2TextController = TextEditingController();
  TextEditingController _add3TextController = TextEditingController();
  TextEditingController _stateTextController = TextEditingController();
  TextEditingController _countryTextController = TextEditingController();
  TextEditingController _phone2TextController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Register as a donar'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(

        child: Container(
          decoration: BoxDecoration(gradient: LinearGradient(colors: [
            hexStringToColor("#FF7276"),
            hexStringToColor("#FF7276"),
            hexStringToColor("#FF7276"),
          ]
          )
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
          child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset("assets/images/avatar.png",fit: BoxFit.fitWidth,width: 180,height: 180),
            const SizedBox(
              height: 30,
            ),
            reusableTextField("Firstname", Icons.person_outline, false,
                _firstnameTextController),
            const SizedBox(
              height: 20,
            ),
            reusableTextField("Lastname", Icons.person_outline, false,
                _lastnameTextController),
            const SizedBox(
              height: 20,
            ),
            reusableTextField("Father's name", fathericon, false,
                _fathernameTextController),
            const SizedBox(
              height: 20,
            ),
            reusableTextField("Age", Icons.person_outline, false,
                _ageTextController),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 360,
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.redAccent,width: 2),
                borderRadius: BorderRadius.circular(30),
                color: Color.fromRGBO(246, 172, 172, 1)
              ),
                  child: DropdownButtonFormField(
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
                      color: Colors.redAccent,
                    ),
                    decoration: InputDecoration(
                      hintText: "Blood Type",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),
                      prefixIcon: Icon(bloodtype,
                      color: Colors.white,)
                    ),
                ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 360,
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.redAccent,width: 2),
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromRGBO(246, 172, 172, 1)
              ),
              child: DropdownButtonFormField(
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
                  color: Colors.redAccent,
                ),
                decoration: InputDecoration(
                    hintText: "Antigen",
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                    ),
                    prefixIcon: Icon(bloodtype,
                      color: Colors.white,)
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            reusableTextField("Email", emailicon, false,
                _emailTextController),
            const SizedBox(
              height: 20,
            ),
            reusableTextField("Phone", phoneicon, false,
                _phoneTextController),
            const SizedBox(
              height: 20,
            ),
            reusableTextField("Address Line 1", add1icon, false,
                _add1TextController),
            const SizedBox(
              height: 20,
            ),
            reusableTextField("Address Line 2", location_city, false,
                _add2TextController),
            const SizedBox(
              height: 20,
            ),
            reusableTextField("Address Line 3", add3icon, false,
                _add3TextController),
            const SizedBox(
              height: 20,
            ),
            reusableTextField("State", stateicon, false,
                _stateTextController),
            const SizedBox(
              height: 20,
            ),
            reusableTextField("Country", flagicon, false,
                _countryTextController),
            const SizedBox(
              height: 20,
            ),
            reusableTextField("Phone number 2", phoneicon, false,
                _phone2TextController),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: ()=>{
                first = _firstnameTextController.text,
                last = _lastnameTextController.text,
                father = _fathernameTextController.text,
                age1 = _ageTextController.text,
                email = _emailTextController.text,
                phone = _phoneTextController.text,
                add1 = _add1TextController.text,
                add2 = _add2TextController.text,
                add3 = _add3TextController.text,
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
                else if(_add3TextController.text == ''){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('City is empty')))
                }
                else if(_stateTextController.text == ''){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('State is empty')))
                }
                else if(_countryTextController.text == ''){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Country is empty')))
                }
                else if(_ageTextController.text!=''){
                  age = int.parse(_ageTextController.text),
                  if(age < 18){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('You are not eligible to donate')))
                  }
                },
                createUser(
                    first,last,father,age1,email,phone,add1,add2,add3,state,country,phone2,emailpass,bg1,bg2),
          },
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white
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

  createUser(first,last,father,age1,email,phone,add1,add2,add3,state,country,phone2,emailpass,bg1,bg2)async{
    final user = FirebaseFirestore.instance.collection('donar').doc(email);
    final json = {
      'first':first,'last':last,'father':father,'age1':age1,'email':email,'phone':phone,'add1':add1,'add2':add2,'add3':add3,'state':state,'country':country,'phone2':phone2,'blood':bg1,'antigen':bg2
    };
    await user.set(json);
    return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Submitted')));;
  }

}