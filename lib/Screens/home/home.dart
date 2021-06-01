import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:water_usage/Screens/Graph/daily_usage_graph.dart';
import 'package:water_usage/models/daily_usage_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

  List<DailyUsageModel> _data;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(onPressed: (){
                updateChatValues();
              },
                color: Color(0xff382fe2),
              child: Text("Daily graph",style: TextStyle(
                color: Colors.white,

              ),),
              )
            ],
          ),
        ),
    ));
  }

  double totalWaterConsumed=0;
  void updateChatValues() {
    _databaseReference
        .child("usersdata")
        .child("BNUzWwEH8VfnpxAdzeN8p8L0PR23")
        .child("-MZqeb0NYf5kkCWXgDIF")
        .child("Flat Data")
        .child("Mainline").once().then((value){
      totalWaterConsumed = value.value["Total Water Consumed"];
    });
    _databaseReference
        .child("usersdata")
        .child("BNUzWwEH8VfnpxAdzeN8p8L0PR23")
        .child("-MZqeb0NYf5kkCWXgDIF")
        .child("Flat Data")
        .child("Mainline")
        .child("forGraph").child("TotalWaterConsumed").once().then((value){
      // _data = [
      //   DailyUsageModel(usageValue: double.parse(value.value["afterOneHOur"].toString()), hours: "1", color: charts.ColorUtil.fromDartColor(Colors.blue)),
      //   DailyUsageModel(usageValue:  double.parse(value.value["afterTwoHOur"].toString()), hours: "2", color: charts.ColorUtil.fromDartColor(Colors.blue)),
      //   DailyUsageModel(usageValue: double.parse(value.value["afterThreeHOur"].toString()), hours: "3", color: charts.ColorUtil.fromDartColor(Colors.blue)),
      //   DailyUsageModel(usageValue:  double.parse(value.value["afterFourHOur"].toString()), hours: "4", color: charts.ColorUtil.fromDartColor(Colors.blue)),
      //   DailyUsageModel(usageValue: double.parse(value.value["afterFiveHOur"].toString()), hours: "5", color: charts.ColorUtil.fromDartColor(Colors.blue)),
      //   DailyUsageModel(usageValue: double.parse(value.value["afterSixHOur"].toString()), hours: "6", color: charts.ColorUtil.fromDartColor(Colors.blue)),
      //   DailyUsageModel(usageValue: double.parse(value.value["afterSevenHOur"].toString()), hours: "7", color: charts.ColorUtil.fromDartColor(Colors.blue)),
      //   DailyUsageModel(usageValue: double.parse(value.value["afterEightHOur"].toString()), hours: "8", color: charts.ColorUtil.fromDartColor(Colors.blue)),
      //   DailyUsageModel(usageValue: double.parse(value.value["afterEightHOur"].toString()), hours: "9", color: charts.ColorUtil.fromDartColor(Colors.blue)),
      //   DailyUsageModel(usageValue: double.parse(value.value["afterNineHOur"].toString()), hours: "10", color: charts.ColorUtil.fromDartColor(Colors.blue)),
      //   DailyUsageModel(usageValue: double.parse(value.value["afterTenHOur"].toString()), hours: "11", color: charts.ColorUtil.fromDartColor(Colors.blue)),
      //   DailyUsageModel(usageValue:  double.parse(value.value["afterElevenHOur"].toString()), hours: "12", color: charts.ColorUtil.fromDartColor(Colors.blue)),
      //   DailyUsageModel(usageValue:  double.parse(value.value["afterTwelveHOur"].toString()), hours: "13", color: charts.ColorUtil.fromDartColor(Colors.blue)),
      //   DailyUsageModel(usageValue: double.parse(value.value["afterThirteenHOur"].toString()), hours: "14", color: charts.ColorUtil.fromDartColor(Colors.blue)),
      //   DailyUsageModel(usageValue:  double.parse(value.value["afterFourteenHOur"].toString()), hours: "15", color: charts.ColorUtil.fromDartColor(Colors.blue)),
      //   DailyUsageModel(usageValue:  double.parse(value.value["afterFifteenHOur"].toString()), hours: "16", color: charts.ColorUtil.fromDartColor(Colors.blue)),
      //   DailyUsageModel(usageValue: double.parse(value.value["afterSixteenHOur"].toString()), hours: "17", color: charts.ColorUtil.fromDartColor(Colors.blue)),
      //   DailyUsageModel(usageValue: double.parse(value.value["afterSeventeenHOur"].toString()), hours: "18", color: charts.ColorUtil.fromDartColor(Colors.blue)),
      //   DailyUsageModel(usageValue: double.parse(value.value["afterEighteenHOur"].toString()), hours: "19", color: charts.ColorUtil.fromDartColor(Colors.blue)),
      //   DailyUsageModel(usageValue:  double.parse(value.value["afterNineteenHOur"].toString()), hours: "20", color: charts.ColorUtil.fromDartColor(Colors.blue)),
      //   DailyUsageModel(usageValue:  double.parse(value.value["afterTwentyOneHOur"].toString()), hours: "21", color: charts.ColorUtil.fromDartColor(Colors.blue)),
      //   DailyUsageModel(usageValue:  double.parse(value.value["afterTwentyTwoHOur"].toString()), hours: "22", color: charts.ColorUtil.fromDartColor(Colors.blue)),
      //   DailyUsageModel(usageValue: double.parse(value.value["afterTwentyThreeHOur"].toString()), hours: "23", color: charts.ColorUtil.fromDartColor(Colors.blue)),
      //   DailyUsageModel(usageValue: double.parse(value.value["afterTwentyFourHOur"].toString()), hours: "24", color: charts.ColorUtil.fromDartColor(Colors.blue)),
      // ];
    }).whenComplete((){

      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>DailyUsageGraph()));
    });
  }
}
