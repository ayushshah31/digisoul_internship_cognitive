import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:research_package/model.dart';
import 'package:trial/survey_page.dart';
import 'package:intl/intl.dart';

import 'displayResults.dart';

class UserDemographicsPage extends StatefulWidget {
  @override
  UserDemographicsPageState createState() => UserDemographicsPageState();
}

class UserDemographicsPageState extends State<UserDemographicsPage> {
  int? age;
  String? gender;
  String? name;
  String? location;
  final DateTime today = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');
  late String formattedDate;
  late DateTime time;
  int testNo = 1;
  RPTaskResult? result;
  String timeTaken = "";
  bool showRes = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formattedDate = formatter.format(today);
    time = today ;
  }

  void updateResTime(RPTaskResult getRes,DateTime end){
    setState(() {
      result = getRes;
      timeTaken = (end.difference(today)).toString();
      showRes = true;
    });
  }

  void updateTest(){
    setState(() {
      testNo++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 60, right: 60, top: 40),
                  child: Text(
                    'Please enter your details before starting the survey',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                const Padding(
                    padding: EdgeInsets.only(left: 25, bottom: 10, top: 20),
                    child: Row(children: <Widget>[
                      Text(
                        'Full name',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.left,
                      )
                    ])),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                    child: TextField(
                      onChanged: (text) {
                        name = text;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your name'),
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 25, bottom: 10, top: 20),
                    child: Row(children: <Widget>[
                      Text(
                        'Time: ${today.hour}:${today.minute}',
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.left,
                      )
                    ])),

                Padding(
                    padding: const EdgeInsets.only(left: 25, bottom: 10, top: 20),
                    child: Row(children: <Widget>[
                      Text(
                        'Date: ${formatter.format(today)}',
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.left,
                      )
                    ])),
                Padding(
                    padding: const EdgeInsets.only(left: 25, bottom: 10, top: 20),
                    child: Row(children: <Widget>[
                      Text(
                        'Test No: ${testNo}',
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.left,
                      )
                    ])),
                Container(height: 50),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffC32C39),
                  fixedSize: const Size(300, 60),
                ),
                child: const Text(
                  'Continue to Survey',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  updateTest();
                  Navigator.of(context).push(MaterialPageRoute<dynamic>(
                      builder: (context) => SurveyPage(
                        name: name,
                        time: time,
                        date: formattedDate,
                        testNo: testNo,
                        updateRes: updateResTime,
                      )));
                },
              ),
            ),
            if(showRes)
              Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffC32C39),
                  fixedSize: const Size(300, 60),
                ),
                child: const Text(
                  'Display Results',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DisplayResults(result: result!,testNo: testNo,timeTaken: timeTaken)));
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
