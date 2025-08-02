import 'package:covid_tracker_app/models/card_model.dart';
import 'package:covid_tracker_app/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatefulWidget {
  String name, image;
  int totalCase,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      todayDeaths,
      test;
  DetailsScreen({
    super.key,
    required this.name,
    required this.image,
    required this.totalCase,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.todayDeaths,
    required this.test,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  // Selected Cards Data

  List<CardData> buildCardDataList() {
    return [
      CardData(
          cardColor: Colors.blue,
          textReport: 'Total Cases',
          reportNumber: widget.totalCase.toString(),
          cardIcon: 'assets/images/cards_images/total.png'),
      CardData(
          cardColor: Colors.red,
          textReport: 'Total Death',
          reportNumber: widget.totalDeaths.toString(),
          cardIcon: 'assets/images/cards_images/heart.png'),
      CardData(
          cardColor: Colors.green,
          textReport: 'Total Recovered',
          reportNumber: widget.totalRecovered.toString(),
          cardIcon: 'assets/images/cards_images/recovered.png'),
      CardData(
          cardColor: Colors.pink,
          textReport: 'Total Active',
          reportNumber: widget.active.toString(),
          cardIcon: 'assets/images/cards_images/active.png'),
      CardData(
          cardColor: Colors.amber,
          textReport: 'Critical Cases',
          reportNumber: widget.critical.toString(),
          cardIcon: 'assets/images/cards_images/critical.png'),
      CardData(
        cardColor: Colors.purple,
        textReport: 'Today Deaths',
        reportNumber: widget.todayDeaths.toString(),
        cardIcon: 'assets/images/cards_images/today_death.png',
      ),
      CardData(
          cardColor: Colors.orange,
          textReport: 'Today Recovered',
          reportNumber: widget.todayRecovered.toString(),
          cardIcon: 'assets/images/cards_images/today_recover.png'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<CardData> cardDataList = buildCardDataList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image & Text
                SizedBox(
                  height: 10,
                ),

                Center(
                  child: Image.network(
                    widget.image,
                    width: 150,
                    height: 100,
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                // Stay Home, Save Country Nmae!
                Text(
                  'Stay Home, Save ${widget.name.toString()}!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                // Select Country Nmae

                Text(
                  widget.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                // Selected card Widget

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
            ),
          ),
        ),
      ),
    );
  }
}
