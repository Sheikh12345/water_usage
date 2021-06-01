import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class DailyUsageGraph extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DailyUsageGraphState();
}

class DailyUsageGraphState extends State<DailyUsageGraph> {
  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();
var totalWaterConsumed;
var currentFlowRate;

  @override
  void initState() {
    super.initState();
   try{
     _databaseReference
         .child("usersdata")
         .child("44WRaDjVfITlp1zv6t8AlHRXgml1")
         .child("FlatData").once().then((value){
       setState(() {
         this.totalWaterConsumed = value.value['Total Water Consumed'].toString();
        this.currentFlowRate = value.value["Current Flow Rate"];
       });
     });
   }catch(e){
     print("error "+e.toString());
   }
  }
  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text("Daily Usage Graph",style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: size.width*0.06),),
          ),
        Container(
            width: size.width,
            height: size.height*0.75,
            child:StreamBuilder(
            stream: _databaseReference
                   .child("usersdata")
                   .child("44WRaDjVfITlp1zv6t8AlHRXgml1")
                   .child("FlatData")
                   .child("forGraph").child("TotalWaterConsumed").onValue,
            builder: (_,snapshot){
              if(snapshot.hasData){
                var ref = snapshot.data.snapshot.value;

                return Container(
                     height:size.height,
                     width: double.infinity,
                     child: Row(
                       children: [
                         Expanded(
                           child: BarChart(
                             BarChartData(
                               alignment: BarChartAlignment.spaceAround,
                               maxY: 70,
                               barTouchData: BarTouchData(
                                 enabled: false,
                                 touchTooltipData: BarTouchTooltipData(
                                   tooltipBgColor: Colors.transparent,
                                   tooltipPadding: const EdgeInsets.all(0),
                                   tooltipMargin: 2,
                                   getTooltipItem: (
                                       BarChartGroupData group,
                                       int groupIndex,
                                       BarChartRodData rod,
                                       int rodIndex,
                                       ) {
                                     return BarTooltipItem(
                                       rod.y.round().toString(),
                                       TextStyle(
                                         color: Colors.white,
                                         fontWeight: FontWeight.bold,
                                       ),
                                     );
                                   },
                                 ),
                               ),
                               titlesData: FlTitlesData(
                                 show: true,
                                 bottomTitles: SideTitles(
                                   showTitles: true,
                                   getTextStyles: (value) => const TextStyle(
                                       color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
                                   margin: 5,
                                   getTitles: (double value) {
                                     switch (value.toInt()) {
                                       case 0:
                                         return '1';
                                       case 1:
                                         return '2';
                                       case 2:
                                         return '3';
                                       case 3:
                                         return '4';
                                       case 4:
                                         return '5';
                                       case 5:
                                         return '6';
                                       case 6:
                                         return '7';
                                       case 7:
                                         return '8';
                                       case 8:
                                         return '9';
                                         case 9:
                                         return '10';
                                       default:
                                         return '';
                                     }
                                   },
                                 ),
                                 leftTitles: SideTitles(showTitles: false),
                               ),
                               borderData: FlBorderData(
                                 show: false,
                               ),
                               barGroups: [
                                 BarChartGroupData(
                                   x: 0,
                                   barRods: [
                                     BarChartRodData(y: double.parse(ref["12am-1am"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                   ],
                                   showingTooltipIndicators: [0],
                                 ),
                                 BarChartGroupData(
                                   x: 1,
                                   barRods: [
                                     BarChartRodData(y: double.parse(ref["1am-2am"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                   ],
                                   showingTooltipIndicators: [0],
                                 ),
                                 BarChartGroupData(
                                   x: 2,
                                   barRods: [
                                     BarChartRodData(y: double.parse(ref["2am-3am"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                   ],
                                   showingTooltipIndicators: [0],
                                 ),
                                 BarChartGroupData(
                                   x: 3,
                                   barRods: [
                                     BarChartRodData(y: double.parse(ref["3am-4am"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                   ],
                                   showingTooltipIndicators: [0],
                                 ),
                                 BarChartGroupData(
                                   x: 4,
                                   barRods: [
                                     BarChartRodData(y: double.parse(ref["4am-5am"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                   ],
                                   showingTooltipIndicators: [0],
                                 ),
                                 BarChartGroupData(
                                   x: 5,
                                   barRods: [
                                     BarChartRodData(y: double.parse(ref["5am-6am"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                   ],
                                   showingTooltipIndicators: [0],
                                 ),

                                 BarChartGroupData(
                                   x: 6,
                                   barRods: [
                                     BarChartRodData(y: double.parse(ref["6am-7am"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                   ],
                                   showingTooltipIndicators: [0],
                                 ),
                                 BarChartGroupData(
                                   x: 7,
                                   barRods: [
                                     BarChartRodData(y:double.parse(ref["7am-8am"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                   ],
                                   showingTooltipIndicators: [0],
                                 ),
                                 BarChartGroupData(
                                   x: 8,
                                   barRods: [
                                     BarChartRodData(y:double.parse(ref["8am-9am"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                   ],
                                   showingTooltipIndicators: [0],
                                 ),

                               ],
                             ),
                           ),
                         ),
                         Expanded(
                           child: BarChart(
                             BarChartData(
                               alignment: BarChartAlignment.spaceAround,
                               maxY: 70,
                               barTouchData: BarTouchData(
                                 enabled: false,
                                 touchTooltipData: BarTouchTooltipData(
                                   tooltipBgColor: Colors.transparent,
                                   tooltipPadding: const EdgeInsets.all(0),
                                   tooltipMargin: 2,
                                   getTooltipItem: (
                                       BarChartGroupData group,
                                       int groupIndex,
                                       BarChartRodData rod,
                                       int rodIndex,
                                       ) {
                                     return BarTooltipItem(
                                       rod.y.round().toString(),
                                       TextStyle(
                                         color: Colors.white,
                                         fontWeight: FontWeight.bold,
                                       ),
                                     );
                                   },
                                 ),
                               ),
                               titlesData: FlTitlesData(
                                 show: true,
                                 bottomTitles: SideTitles(
                                   showTitles: true,
                                   getTextStyles: (value) => const TextStyle(
                                       color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
                                   margin: 5,
                                   getTitles: (double value) {
                                     switch (value.toInt()) {
                                       case 0:
                                         return '10';
                                       case 1:
                                         return '11';
                                       case 2:
                                         return '12';
                                       case 3:
                                         return '13';
                                       case 4:
                                         return '14';
                                       case 5:
                                         return '15';
                                       case 6:
                                         return '16';
                                         case 7:
                                         return '17';
                                       default:
                                         return '';
                                     }
                                   },
                                 ),
                                 leftTitles: SideTitles(showTitles: false),
                               ),
                               borderData: FlBorderData(
                                 show: false,
                               ),
                               barGroups: [
                                 BarChartGroupData(
                                   x: 0,
                                   barRods: [
                                     BarChartRodData(y:double.parse(ref["9am-10am"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                   ],
                                   showingTooltipIndicators: [0],
                                 ),

                                 BarChartGroupData(
                                   x: 1,
                                   barRods: [

                                     BarChartRodData(y: double.parse(ref["10am-11am"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                   ],
                                   showingTooltipIndicators: [0],
                                 ),
                                 BarChartGroupData(
                                   x: 2,
                                   barRods: [
                                     BarChartRodData(y: double.parse(ref["11am-12pm"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                   ],
                                   showingTooltipIndicators: [0],
                                 ),
                                 BarChartGroupData(
                                   x: 3,
                                   barRods: [
                                     BarChartRodData(y: double.parse(ref["12pm-1pm"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                   ],
                                   showingTooltipIndicators: [0],
                                 ),
                                 BarChartGroupData(
                                   x: 4,
                                   barRods: [
                                     BarChartRodData(y:double.parse(ref["1pm-2pm"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                   ],
                                   showingTooltipIndicators: [0],
                                 ),
                                 BarChartGroupData(
                                   x: 5,
                                   barRods: [
                                     BarChartRodData(y:double.parse(ref["2pm-3pm"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                   ],
                                   showingTooltipIndicators: [0],
                                 ),
                                 BarChartGroupData(
                                   x: 6,
                                   barRods: [
                                     BarChartRodData(y:double.parse(ref["3pm-4pm"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                   ],
                                   showingTooltipIndicators: [0],
                                 ),

                                 BarChartGroupData(
                                   x: 7,
                                   barRods: [
                                     BarChartRodData(y: double.parse(ref["4pm-5pm"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                   ],
                                   showingTooltipIndicators: [0],
                                 ),
                               ],
                             ),
                           ),
                         ),
                         Expanded(
                           child: BarChart(
                             BarChartData(
                               alignment: BarChartAlignment.spaceAround,
                               maxY: 70,
                               barTouchData: BarTouchData(
                                 enabled: false,
                                 touchTooltipData: BarTouchTooltipData(
                                   tooltipBgColor: Colors.transparent,
                                   tooltipPadding: const EdgeInsets.all(0),
                                   tooltipMargin: 2,
                                   getTooltipItem: (
                                       BarChartGroupData group,
                                       int groupIndex,
                                       BarChartRodData rod,
                                       int rodIndex,
                                       ) {
                                     return BarTooltipItem(
                                       rod.y.round().toString(),
                                       TextStyle(
                                         color: Colors.white,
                                         fontWeight: FontWeight.bold,
                                       ),
                                     );
                                   },
                                 ),
                               ),
                               titlesData: FlTitlesData(
                                 show: true,
                                 bottomTitles: SideTitles(
                                   showTitles: true,
                                   getTextStyles: (value) => const TextStyle(
                                       color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
                                   margin: 5,
                                   getTitles: (double value) {
                                     switch (value.toInt()) {
                                       case 0:
                                         return '18';
                                       case 1:
                                         return '19';
                                       case 2:
                                         return '20';
                                       case 3:
                                         return '21';
                                       case 4:
                                         return '22';
                                       case 5:
                                         return '23';
                                         case 6:
                                         return '24';
                                       default:
                                         return '';
                                     }
                                   },
                                 ),
                                 leftTitles: SideTitles(showTitles: false),
                               ),
                               borderData: FlBorderData(
                                 show: false,
                               ),
                               barGroups: [
                                 BarChartGroupData(
                                   x: 0,
                                   barRods: [
                                     BarChartRodData(y:double.parse(ref["5pm-6pm"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                   ],
                                   showingTooltipIndicators: [0],
                                 ),
                                 BarChartGroupData(
                                   x: 1,
                                   barRods: [
                                     BarChartRodData(y: double.parse(ref["6pm-7pm"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                   ],
                                   showingTooltipIndicators: [0],
                                 ),
                                 BarChartGroupData(
                                   x: 2,
                                   barRods: [
                                     BarChartRodData(y: double.parse(ref["7pm-8pm"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                   ],
                                   showingTooltipIndicators: [0],
                                 ),
                                 BarChartGroupData(
                                   x: 3,
                                   barRods: [
                                     BarChartRodData(y: double.parse(ref["8pm-9pm"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                   ],
                                   showingTooltipIndicators: [0],
                                 ),
                                 BarChartGroupData(
                                   x: 4,
                                   barRods: [
                                     BarChartRodData(y: double.parse(ref["9pm-10pm"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                   ],
                                   showingTooltipIndicators: [0],
                                 ),
                                 BarChartGroupData(
                                   x: 5,
                                   barRods: [
                                     BarChartRodData(y:double.parse(ref["10pm-11pm"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                   ],
                                   showingTooltipIndicators: [0],
                                 ),
                                 BarChartGroupData(
                                   x: 6,
                                   barRods: [
                                     BarChartRodData(y: double.parse(ref["11pm-12am"].toString()), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                                   ],
                                   showingTooltipIndicators: [0],
                                 ),
                               ],
                             ),
                           ),
                         ),
                       ],
                     ),
                   );
                 }else {
                   return CircularProgressIndicator();
                 }
            },
          )
          ),
          Container(
            margin: EdgeInsets.only(top: size.height*0.02),
            child: Text("Total Water Consumed: $totalWaterConsumed",style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: size.width*0.06),),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height*0.01),
            child: Text("Current Flow Rate: $currentFlowRate",style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: size.width*0.06),),
          ),
        ],
      )
    ),

    );
  }
}
