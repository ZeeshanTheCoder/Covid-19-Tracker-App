import 'package:covid_tracker_app/models/card_model.dart';
import 'package:covid_tracker_app/services/states_services.dart';
import 'package:covid_tracker_app/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeCountryScreen extends StatefulWidget {
  HomeCountryScreen({super.key});

  @override
  State<HomeCountryScreen> createState() => _HomeCountryScreenState();
}

class _HomeCountryScreenState extends State<HomeCountryScreen>
    with TickerProviderStateMixin {
  StatesServices statesServices = StatesServices();

  late AnimationController _controller =
      AnimationController(duration: Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Home Country',
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),

                // Move FutureBuilder here
                FutureBuilder(
                  future: statesServices.homeCountryApi(),
                  builder: (BuildContext context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
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
                      // All Home Country Card Data

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

                      // Country Info & Cards

                      return Column(
                        children: [
                          // Country Image
                          Center(
                            child: Image.network(
                              snapshot.data!.countryInfo!.flag.toString(),
                              width: 150,
                              height: 100,
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),

                          // Stay Home, Save Pakistan!
                          Text(
                            'Stay Home, Save ${snapshot.data!.country.toString()}!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          // Country name
                          Text(
                            snapshot.data!.country.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          // All Cards Widget

                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: cardDataList.length,
                            itemBuilder: (context, index) {
                              // Cards
                              return CardWidget(
                                text_cases: 'COVID-19',
                                card_color: cardDataList[index].cardColor,
                                text_report: cardDataList[index].textReport,
                                report_number: cardDataList[index].reportNumber,
                                card_icon: cardDataList[index].cardIcon,
                              );
                            },
                          )
                        ],
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
