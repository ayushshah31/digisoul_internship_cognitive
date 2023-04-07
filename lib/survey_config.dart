import 'package:cognition_package/model.dart';
import 'package:research_package/model.dart';
import 'package:research_package/research_package.dart';

/// Here the list of cognitive test are added to an RP ordered task.
/// Uncomment the ones you want to see a demo of.
RPOrderedTask surveyTask = RPOrderedTask(
    identifier: 'surveyTaskID',
    steps: [
      q1,
      q2,
      q3,
      q4,
      q5,
      q6,
      q7,
      q8,
      q9,
      flanker,
      visualArrayChange,
      corsiBlockTapping,
      completionStep,
    ],
    closeAfterFinished: true);

RPCompletionStep completionStep = RPCompletionStep(identifier: 'completionID', title: 'Finished')
  ..text = 'Thank you for taking the tests';

RPActivityStep tappingStep = RPTappingActivity(
  identifier: 'Tapping step ID',
);

RPQuestionStep q1 = RPQuestionStep(
    identifier: "EMA Question 1",
    title: "1. What were you doing right before the survey (Check all that apply)?",
    answerFormat: answerFormat1);
RPAnswerFormat answerFormat1 = RPChoiceAnswerFormat(answerStyle: RPChoiceAnswerStyle.MultipleChoice, choices: [
  RPChoice(text: "Hanging out", value: 0),
  RPChoice(text: "TV/Movie", value: 1),
  RPChoice(text: "socializing", value: 2),
  RPChoice(text: "Talking on the phone", value: 3),
  RPChoice(text: "Texting", value: 4),
  RPChoice(text: "Gaming", value: 5),
  RPChoice(text: "Computer/App", value: 6),
  RPChoice(text: "Work/School", value: 7),
  RPChoice(text: "Reading", value: 8),
  RPChoice(text: "Housework/chores", value: 9),
  RPChoice(text: "Eat/drink", value: 10),
  RPChoice(text: "Child care", value: 11),
  RPChoice(text: "Alcohol use", value: 12),
  RPChoice(text: "Marijuana use", value: 13),
  RPChoice(text: "Physical activity/sports", value: 14),
  RPChoice(text: "Transit/Driving", value: 15),
  RPChoice(text: "Walking", value: 16),
  RPChoice(text: "Relaxing", value: 17),
  RPChoice(text: "Other", value: 18)
]);

RPQuestionStep q2 = RPQuestionStep(
    identifier: "EMA Question 2", title: "2. Where are you now (Check all that apply)?", answerFormat: answerFormat2);
RPAnswerFormat answerFormat2 = RPChoiceAnswerFormat(answerStyle: RPChoiceAnswerStyle.MultipleChoice, choices: [
  RPChoice(text: "Your home", value: 0),
  RPChoice(text: "Relative’s home", value: 1),
  RPChoice(text: "Friend’s home", value: 2),
  RPChoice(text: "School", value: 3),
  RPChoice(text: "Work", value: 4),
  RPChoice(text: "In car", value: 5),
  RPChoice(text: "Other transit", value: 6)
]);

RPQuestionStep q3 = RPQuestionStep(
    identifier: "EMA Question 3",
    title: "3. Are you with other people? (check all that apply)",
    answerFormat: answerFormat3);
RPAnswerFormat answerFormat3 = RPChoiceAnswerFormat(answerStyle: RPChoiceAnswerStyle.MultipleChoice, choices: [
  RPChoice(text: "Alone", value: 0),
  RPChoice(text: "With people I don't know", value: 1),
  RPChoice(text: "With people I know", value: 2)
]);

RPQuestionStep q4 = RPQuestionStep(
    identifier: "EMA Question 4",
    title: "4. In the few minutes before completing this survey, were you...",
    answerFormat: answerFormat4);
RPAnswerFormat answerFormat4 = RPChoiceAnswerFormat(
    answerStyle: RPChoiceAnswerStyle.SingleChoice,
    choices: [RPChoice(text: "standing", value: 0), RPChoice(text: "TV/sitting walking lying down", value: 1)]);

RPQuestionStep q5 = RPQuestionStep(
    identifier: "EMA Question 5",
    title: "5. Since the past 4 hours, have you consumed(check all that apply)",
    answerFormat: answerFormat5);
RPAnswerFormat answerFormat5 = RPChoiceAnswerFormat(answerStyle: RPChoiceAnswerStyle.MultipleChoice, choices: [
  RPChoice(text: "Food", value: 0),
  RPChoice(text: "Marijuana", value: 1),
  RPChoice(text: "Water", value: 2),
  RPChoice(text: "Tobacco ", value: 3)
]);

RPQuestionStep q6 = RPQuestionStep(
    identifier: "EMA Question 6",
    title: "6. Since the past 4 hours, how much alcohol did you consume?",
    answerFormat: answerFormat6);
RPAnswerFormat answerFormat6 = RPChoiceAnswerFormat(answerStyle: RPChoiceAnswerStyle.SingleChoice, choices: [
  RPChoice(text: "None", value: 0),
  RPChoice(text: "Less than 1 drink 1 drink", value: 1),
  RPChoice(text: "2 drinks", value: 2),
  RPChoice(text: "3 drinks", value: 3),
  RPChoice(text: "4 drinks", value: 4),
  RPChoice(text: "5 drinks", value: 5),
  RPChoice(text: "6 or more drinks", value: 6)
]);

RPQuestionStep q7 = RPQuestionStep(
    identifier: "EMA Question 7",
    title: "7. Since the past 4 hours, have you experienced any events with regards to routine?",
    answerFormat: answerFormat7);
RPAnswerFormat answerFormat7 = RPChoiceAnswerFormat(answerStyle: RPChoiceAnswerStyle.MultipleChoice, choices: [
  RPChoice(text: "Positive Events", value: 0),
  RPChoice(text: "Negative Events", value: 1),
  RPChoice(text: "Not Applicable", value: 1),
]);

RPQuestionStep q8 = RPQuestionStep(
    identifier: "EMA Question 8",
    title:
        "If yes to positive: How much of a positive impact did this routine event or situation (likert scale from 1-10,0=NA)",
    answerFormat: answerFormat8);
RPAnswerFormat answerFormat8 = RPSliderAnswerFormat(minValue: 0, maxValue: 10, divisions: 10);

RPQuestionStep q9 = RPQuestionStep(
    identifier: "EMA Question 9",
    title:
        "If yes to negative: How much of a negative impact did this routine event or situation (likert scale from 1-10,0=NA)",
    answerFormat: answerFormat9);
RPAnswerFormat answerFormat9 = RPSliderAnswerFormat(minValue: 0, maxValue: 10, divisions: 10);

RPActivityStep reactionTimeStep = RPReactionTimeActivity(
  includeInstructions: true,
  includeResults: true,
  lengthOfTest: 2,
  identifier: 'Reaction Time step ID',
);

RPActivityStep rapidVisualInfoProcessingStep =
    RPRapidVisualInfoProcessingActivity(identifier: 'RVIP step ID', lengthOfTest: 10);

RPActivityStep activityStepTrail =
    RPTrailMakingActivity(identifier: 'Trail Making step ID', trailType: TrailType.B, includeResults: false);

RPActivityStep activityStepLetterTapping =
    RPLetterTappingActivity(identifier: 'Letter Tapping step ID', includeResults: false);

RPActivityStep pairedAssociatesLearningStep = RPPairedAssociatesLearningActivity(
  // maxTestDuration: ,
  includeResults: true,
  includeInstructions: true,
  identifier: 'PAL step ID',
);

RPActivityStep corsiBlockTapping = RPCorsiBlockTappingActivity(
  identifier: 'Corsi Block Tapping step ID',
);

RPActivityStep stroopEffect = RPStroopEffectActivity(
  identifier: 'Stroop Effect step ID',
  lengthOfTest: 60,
);

RPActivityStep flanker = RPFlankerActivity(
    identifier: 'Flanker step ID', lengthOfTest: 90 /* 300 */, numberOfCards: 10, includeResults: true);

RPActivityStep pictureSequenceMemory = RPPictureSequenceMemoryActivity(
    identifier: 'PictureSequenceMemory step ID',
    lengthOfTest: 180,
    numberOfTests: 1,
    numberOfPics: 6,
    includeResults: false);

RPActivityStep wordRecall =
    RPWordRecallActivity(identifier: 'WordRecall step ID', lengthOfTest: 180, numberOfTests: 3, includeResults: false);

RPActivityStep delayedRecall = RPDelayedRecallActivity(
    identifier: 'DelayedRecall step ID', lengthOfTest: 180, numberOfTests: 3, includeResults: false);

RPActivityStep visualArrayChange = RPVisualArrayChangeActivity(
    identifier: 'VisualArrayChange step ID', lengthOfTest: 60, numberOfTests: 3, waitTime: 3, includeResults: false);

RPActivityStep continuousVisualTracking = RPContinuousVisualTrackingActivity(
    identifier: 'ContinuousVisualTracking step ID',
    numberOfTests: 3,
    amountOfDots: 15,
    dotSize: 40,
    lengthOfTest: 180,
    trackingSpeed: Duration(seconds: 5),
    includeResults: false);
