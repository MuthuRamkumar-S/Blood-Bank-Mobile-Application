import 'package:flutter/material.dart';

class Faq_page extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ Page'),
        leading: BackButton(),
        backgroundColor: Color.fromRGBO(196, 15, 15, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: Text('Frequently Asked Questions ? ',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),),
            )
          ),
        ),
          SizedBox(
            height: 20,
          ),

          //1

          Card(
            elevation: 5,
            color: Theme.of(context).colorScheme.surfaceVariant,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(10),
                  child: Text('1. Why should I donate blood ?',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent
                  ),
                  )
                ),
                Padding(padding: EdgeInsets.all(10),
                    child: Text('You have to donate blood yourself to find out. By Blood donation you greatly contribute towards a healthier, happier society by making available safe blood. Any one may need blood at any time may be ourselves or our near  ones. You also benefit in other ways by donating blood as it reduces the chances of ischemic heart diseases',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14,
                    ),
                    )
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),

          //2

          Card(
            elevation: 5,
            color: Theme.of(context).colorScheme.surfaceVariant,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ),
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(10),
                    child: Text('2. Are their any side effects of Blood donations ?',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent
                      ),
                    )
                ),
                Padding(padding: EdgeInsets.all(10),
                    child: Text('There are no side effects of blood donation. The Blood bank staff ensures that your blood donation is a good experience as far as possible to enable you to become a repeat and a regular blood donor. There are a number of people who have donated   more tha25-100 times in their life time',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    )
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),

          //3

          Card(
            elevation: 5,
            color: Theme.of(context).colorScheme.surfaceVariant,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ),
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(10),
                    child: Text('3. Can I get any disease like AIDS or Hepatitis or any other disease by Blood donation ?',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent
                      ),
                    )
                ),
                Padding(padding: EdgeInsets.all(10),
                    child: Text('As only sterile disposables are used to collect  blood and these disposables can be used only one time it eliminates any chances of acquiring any disease from blood donation.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    )
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),

          //4

          Card(
            elevation: 5,
            color: Theme.of(context).colorScheme.surfaceVariant,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ),
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(10),
                    child: Text('4. What are the eligibility criteria of blood donation ?',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent
                      ),
                    )
                ),
                Padding(padding: EdgeInsets.all(10),
                    child: Text('The eligible donors  should be  between 18 to 60 years of age, having a healthy pattern of lifestyle  The body weight should be above 45 kgs.  The haemoglobin should be above 12.5 g%',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    )
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),

          //5

          Card(
            elevation: 5,
            color: Theme.of(context).colorScheme.surfaceVariant,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ),
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(10),
                    child: Text('5. How often can I donate Blood ?',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent
                      ),
                    )
                ),
                Padding(padding: EdgeInsets.all(10),
                    child: Text('After every three –four months you can donate blood.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    )
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),

          //6

          Card(
            elevation: 5,
            color: Theme.of(context).colorScheme.surfaceVariant,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ),
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(10),
                    child: Text('6. What should I eat before blood-donation ?',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent
                      ),
                    )
                ),
                Padding(padding: EdgeInsets.all(10),
                    child: Text('Anything that you normally eat at home., Eat a  light snacks and a cold drink  before blood donation  is sufficient.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    )
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),

          //7

          Card(
            elevation: 5,
            color: Theme.of(context).colorScheme.surfaceVariant,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ),
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(10),
                    child: Text('7. How much  time does it take to donate blood ?',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent
                      ),
                    )
                ),
                Padding(padding: EdgeInsets.all(10),
                    child: Text('You will be asked to fill a donor form. Your medical history will be taken by a medical personnel and  a small drop of blood to check blood group as well as  Hb for anemia. After  simple medical screening process and being found medically fit to donate, you will be sent to blood collection  room. The actual blood collection from the donor takes about 7-10 minutes followed by a little rest and refreshments.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    )
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),

          //8

          Card(
            elevation: 5,
            color: Theme.of(context).colorScheme.surfaceVariant,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ),
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(10),
                    child: Text('8. What happens to blood I donate ?',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent
                      ),
                    )
                ),
                Padding(padding: EdgeInsets.all(10),
                    child: Text('Your blood in the blood bank is processed and within 6 hours of Blood collection It  is separated into components viz. Red Cells, White Cells, Plasma & Platelets. These Blood components are made available for the patients. By making blood components, all the useful parts of blood can be used and from one unit of blood four patients can be benefited',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    )
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),

          //9

          Card(
            elevation: 5,
            color: Theme.of(context).colorScheme.surfaceVariant,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ),
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(10),
                    child: Text('9. Post Donation care',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent
                      ),
                    )
                ),
                Padding(padding: EdgeInsets.all(10),
                    child: Text('1. Eat and Drink  the refreshment provided before leaving the blood bank \n'
                        '2. Drink more liquids than usual in next 4 hours\n'
                        '3. Avoid consuming alcohol until you have eaten something\n'
                        '4. Do not smoke for next 30 minutes'
                        '5. Avoid climbing stairs for next 30 minutes\n'
                        '6. If there is bleeding from the phlebotomy site, raise the arm and apply pressure\n'
                        '7. If fainting or dizziness occurs, either lie down or sit with the head between the knees',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    )
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ]
      )
      ),
    );
  }

}