import 'package:flutter/material.dart';
import 'package:research_package/model.dart';

class DisplayResults extends StatefulWidget {
  final RPTaskResult result;
  final String timeTaken;
  final int testNo;
  DisplayResults({super.key, required this.result,required this.timeTaken,required this.testNo});

  @override
  State<DisplayResults> createState() => _DisplayResultsState();
}

class _DisplayResultsState extends State<DisplayResults> {
  List<Text> res = [];

  void getTests(){
    widget.result.results.forEach((key, value) {
      try {
        value = value as RPActivityResult;
        res.add(Text(' $key\t: ${value.results}',style: TextStyle(fontSize: 16),));
      } catch(e){
        var res1 = value as RPStepResult;
        var entries = res1.results;
        List s = [];
        for(var i in entries.values.single){
          s.add(i.text);
        }
        res.add(Text(' $key\t: $s',style: TextStyle(fontSize: 16),));
        // print(entries.values.single[0].text);
        // print(' $key\t: ${res1.answerFormat.toJson()}');
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTests();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white,automaticallyImplyLeading: false,leading: BackButton(color: Colors.black),elevation: 0,),
        body: Padding(
          padding: const EdgeInsets.only(left:10,right:10),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only( top: 40),
                child: Text(
                  'Thankyou For Completing the test\nYour Latest Test Results: ',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 15),
              Text("Time Taken: ${widget.timeTaken}",style: TextStyle(fontSize: 16),),
              SizedBox(height: 10),
              Text("Test No: ${widget.testNo-1}",style: TextStyle(fontSize: 16),),
              SizedBox(height: 10),
              SizedBox(
                height: 400,
                child: ListView.builder(
                  itemCount: res.length,
                    itemBuilder: (context, index){
                      return Container(
                        child: res[index],
                      );
                    },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80, bottom: 50),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffC32C39),
                    fixedSize: const Size(300, 60),
                  ),
                  child: const Text(
                    'Back to home page',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
