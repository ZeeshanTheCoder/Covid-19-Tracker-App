import 'dart:convert';

import 'package:covid_tracker_app/models/countries_states_model.dart';
import 'package:covid_tracker_app/models/world_states_model.dart';
import 'package:covid_tracker_app/services/utils/app_url.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<WorldStatesModel> fetchWorldStatesRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatsApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> countriesListApi() async {
    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Error');
    }
  }

  Future<HomeCountryModel> homeCountryApi() async {
    final response = await http.get(Uri.parse(AppUrl.homeCountry));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return HomeCountryModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }
}
