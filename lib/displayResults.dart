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
      // print(value);
      // print(value.runtimeType);
      try {
        value = value as RPActivityResult;
        res.add(Text(' $key\t: ${value.results}'));
        // print(' $key\t: ${value.results}');
      } catch (e) {
        // print(value.toJson());
        var res1 = value as RPStepResult;
        // print(res1.results);
        var entries = res1.results;
        List s = [];
        try {
          for (var i in entries.values.single) {
            s.add(i.text);
          }
        } catch(e){
          for (var i in entries.values) {
            s.add(i);
          }
        }
        res.add(Text(' $key\t: $s',style: const TextStyle(fontSize: 16),));
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
        appBar: AppBar(backgroundColor: Colors.white,automaticallyImplyLeading: false,leading: const BackButton(color: Colors.black),elevation: 0,),
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
              Text("Time Taken: ${widget.timeTaken}",style: const TextStyle(fontSize: 16),),
              const SizedBox(height: 10),
              Text("Test No: ${widget.testNo-1}",style: const TextStyle(fontSize: 16),),
              const SizedBox(height: 10),
              SizedBox(
                height: 250,
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
