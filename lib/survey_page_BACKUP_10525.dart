import 'package:flutter/material.dart';
import 'package:research_package/research_package.dart';
import 'displayResults.dart';
import 'survey_config.dart';

class SurveyPage extends StatelessWidget {
  final String? name;
  final String? date;
  final DateTime time;
  final int? testNo;
  final Function(RPTaskResult, DateTime) updateRes;

  const SurveyPage(
      {super.key, this.name, this.date, required this.time, this.testNo, required this.updateRes});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body:

              //Normal Sider
              // RPUISliderQuestionBody(answerFormat, (p0) {
              //   print(p0);
              // })

              //Multiple tasks
              Container(
        color: Colors.black,
        child: RPUITask(
          onCancel: (results) {
            resultCallback(results!);
            DateTime now = DateTime.now();
            updateRes(results, now);
          },
          task: surveyTask,
          onSubmit: (result) {
            DateTime now = DateTime.now();
            resultCallback(result);
            print("Done");
            updateRes(result, now);
          },
        ),
      )

          // Multiple Choice
          // RPUIChoiceQuestionBody(ans, (p0) {
          //   print(p0);
          //   print(ans.choices.toString());
          // }
          // ),
          ),
    );
  }

  void resultCallback(RPTaskResult result) async {
    print('FINAL RESULTS');
    print(' name: $name');
    print(' date: $date');
    print('RESULTS:');
    print(result);
    result.results.forEach((key, value) {
      print(value);
      print(value.runtimeType);
      try {
        value = value as RPActivityResult;
        print(' $key\t: ${value.results}');
      } catch (e) {
        print(value.toJson());

        // var res1 = value as RPStepResult;
        // var entries = res1.results;
        // List s = [];
        // for(var i in entries.values.single){
        //   s.add(i.text);
        // }
        // print(s);
        // print(entries.values.single[0].text);
        // print(' $key\t: ${res1.answerFormat.toJson()}');
        // }
        // print(s);
        // print(entries.values.single[0].text);
        // print(' $key\t: ${res1.answerFormat.toJson()}');
      }
    });
  }
}
