import 'package:flutter/foundation.dart';
import 'package:read_api_assignment/models/corona_virus.dart';
import 'package:http/http.dart' as http;

Future<List<CoronaVirus>> get covid async {
  http.Response response = await http.get("https://disease.sh/v3/covid-19/countries?yesterday=true&twoDaysAgo=true&sort=active&allowNull=true");

  if(response.statusCode == 200) {
    return compute(coronaVirusFromMap, response.body);
  }
  else {
    throw Exception("Error");
  }
}