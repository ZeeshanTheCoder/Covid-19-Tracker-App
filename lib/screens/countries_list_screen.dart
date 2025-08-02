import 'package:covid_tracker_app/screens/details_screen.dart';
import 'package:covid_tracker_app/services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();

  StatesServices statesServices = StatesServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Search By Country',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              // search bar

              TextFormField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Search with country name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),

              // All Countries
              Expanded(
                child: FutureBuilder(
                  future: statesServices.countriesListApi(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          // Shimmer Effect

                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade700,
                            highlightColor: Colors.grey.shade100,
                            child: Column(
                              children: [
                                // all countries
                                ListTile(
                                  // image
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    color: Colors.white,
                                  ),

                                  title: Container(
                                    height: 10,
                                    width: 89,
                                    color: Colors.white,
                                  ),
                                  subtitle: Container(
                                    height: 10,
                                    width: 89,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          String name = snapshot.data![index]['country'];
                          if (searchController.text.isEmpty) {
                            return Column(
                              children: [
                                // All Countries Data
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailsScreen(
                                          name: snapshot.data![index]
                                              ['country'],
                                          image: snapshot.data![index]
                                              ['countryInfo']['flag'],
                                          totalCase: snapshot.data![index]
                                              ['cases'],
                                          totalDeaths: snapshot.data![index]
                                              ['deaths'],
                                          totalRecovered: snapshot.data![index]
                                              ['recovered'],
                                          active: snapshot.data![index]
                                              ['active'],
                                          critical: snapshot.data![index]
                                              ['critical'],
                                          todayDeaths: snapshot.data![index]
                                              ['todayDeaths'],
                                          todayRecovered: snapshot.data![index]
                                              ['todayRecovered'],
                                          test: snapshot.data![index]['tests'],
                                        ),
                                      ),
                                    );
                                  },
                                  child: ListTile(
                                    // image
                                    leading: Image(
                                      image: NetworkImage(
                                        snapshot.data![index]['countryInfo']
                                            ['flag'],
                                      ),
                                      height: 50,
                                      width: 50,
                                    ),

                                    // country name
                                    title: Text(
                                      snapshot.data![index]['country'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    // country cases
                                    subtitle: Text(
                                      snapshot.data![index]['cases'].toString(),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else if (name
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase())) {
                            return Column(
                              children: [
                                // all search countries
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailsScreen(
                                          name: snapshot.data![index]
                                              ['country'],
                                          image: snapshot.data![index]
                                              ['countryInfo']['flag'],
                                          totalCase: snapshot.data![index]
                                              ['cases'],
                                          totalDeaths: snapshot.data![index]
                                              ['deaths'],
                                          totalRecovered: snapshot.data![index]
                                              ['recovered'],
                                          active: snapshot.data![index]
                                              ['active'],
                                          critical: snapshot.data![index]
                                              ['critical'],
                                          todayDeaths: snapshot.data![index]
                                              ['todayDeaths'],
                                          todayRecovered: snapshot.data![index]
                                              ['todayRecovered'],
                                          test: snapshot.data![index]['tests'],
                                        ),
                                      ),
                                    );
                                  },
                                  child: ListTile(
                                    // image
                                    leading: Image(
                                      image: NetworkImage(
                                        snapshot.data![index]['countryInfo']
                                            ['flag'],
                                      ),
                                      height: 50,
                                      width: 50,
                                    ),

                                    // country name
                                    title: Text(
                                      snapshot.data![index]['country'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    // country cases
                                    subtitle: Text(
                                      snapshot.data![index]['cases'].toString(),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Container();
                          }
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
