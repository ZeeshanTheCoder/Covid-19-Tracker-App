import 'package:covid_tracker_app/models/card_model.dart';
import 'package:covid_tracker_app/models/world_states_model.dart';
import 'package:covid_tracker_app/services/states_services.dart';
import 'package:covid_tracker_app/widgets/card_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class GlobalScreen extends StatefulWidget {
  GlobalScreen({super.key});

  @override
  State<GlobalScreen> createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller =
      AnimationController(duration: Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  StatesServices statesServices = StatesServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'COVID-19 Tracker',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Image & Text
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/home_bg.png',
                        width: 300,
                        height: 250,
                      ),
                      Text(
                        'Stay Home, Stay Safe!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // Global Records
                SizedBox(height: 20),

                Text(
                  'Global COVID-19',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                FutureBuilder(
                  future: statesServices.fetchWorldStatesRecords(),
                  builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                    if (!snapshot.hasData) {
                      return SizedBox(
                        height: 100,
                        child: SpinKitFadingCircle(
                          color: Colors.red,
                          size: 50,
                          controller: _controller,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data == null) {
                      return Text('No data available');
                    } else {
                      List<CardData> cardDataList = [
                        CardData(
                          cardColor: Colors.blue,
                          textReport: 'Total Cases',
                          reportNumber: snapshot.data!.cases.toString(),
                          cardIcon: 'assets/images/cards_images/total.png',
                        ),
                        CardData(
                          cardColor: Colors.red,
                          textReport: 'Total Death',
                          reportNumber: snapshot.data!.deaths.toString(),
                          cardIcon: 'assets/images/cards_images/heart.png',
                        ),
                        CardData(
                          cardColor: Colors.green,
                          textReport: 'Total Recovered',
                          reportNumber: snapshot.data!.recovered.toString(),
                          cardIcon: 'assets/images/cards_images/recovered.png',
                        ),
                        CardData(
                          cardColor: Colors.pink,
                          textReport: 'Total Active',
                          reportNumber: snapshot.data!.active.toString(),
                          cardIcon: 'assets/images/cards_images/active.png',
                        ),
                        CardData(
                          cardColor: Colors.amber,
                          textReport: 'Critical Cases',
                          reportNumber: snapshot.data!.critical.toString(),
                          cardIcon: 'assets/images/cards_images/critical.png',
                        ),
                        CardData(
                          cardColor: Colors.purple,
                          textReport: 'Today Deaths',
                          reportNumber: snapshot.data!.todayDeaths.toString(),
                          cardIcon:
                              'assets/images/cards_images/today_death.png',
                        ),
                        CardData(
                          cardColor: Colors.orange,
                          textReport: 'Today Recovered',
                          reportNumber:
                              snapshot.data!.todayRecovered.toString(),
                          cardIcon:
                              'assets/images/cards_images/today_recover.png',
                        ),
                      ];

                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cardDataList.length,
                        itemBuilder: (context, index) {
                          // Cards
                          return CardWidget(
                            text_cases: 'Global',
                            card_color: cardDataList[index].cardColor,
                            text_report: cardDataList[index].textReport,
                            report_number: cardDataList[index].reportNumber,
                            card_icon: cardDataList[index].cardIcon,
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
