// To parse this JSON data, do
//
//     final coronaVirus = coronaVirusFromMap(jsonString);

import 'dart:convert';

List<CoronaVirus> coronaVirusFromMap(String str) => List<CoronaVirus>.from(json.decode(str).map((x) => CoronaVirus.fromMap(x)));

String coronaVirusToMap(List<CoronaVirus> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class CoronaVirus {
  CoronaVirus({
    this.updated,
    this.country,
    this.countryInfo,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.todayRecovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
    this.population,
    this.continent,
    this.oneCasePerPeople,
    this.oneDeathPerPeople,
    this.oneTestPerPeople,
    this.activePerOneMillion,
    this.recoveredPerOneMillion,
    this.criticalPerOneMillion,
  });

  int updated;
  String country;
  CountryInfo countryInfo;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int todayRecovered;
  int active;
  int critical;
  int casesPerOneMillion;
  double deathsPerOneMillion;
  int tests;
  int testsPerOneMillion;
  int population;
  Continent continent;
  int oneCasePerPeople;
  int oneDeathPerPeople;
  int oneTestPerPeople;
  double activePerOneMillion;
  double recoveredPerOneMillion;
  double criticalPerOneMillion;

  factory CoronaVirus.fromMap(Map<String, dynamic> json) => CoronaVirus(
    updated: json["updated"],
    country: json["country"],
    countryInfo: CountryInfo.fromMap(json["countryInfo"]),
    cases: json["cases"],
    todayCases: json["todayCases"] == null ? null : json["todayCases"],
    deaths: json["deaths"] == null ? null : json["deaths"],
    todayDeaths: json["todayDeaths"] == null ? null : json["todayDeaths"],
    recovered: json["recovered"] == null ? null : json["recovered"],
    todayRecovered: json["todayRecovered"] == null ? null : json["todayRecovered"],
    active: json["active"],
    critical: json["critical"] == null ? null : json["critical"],
    casesPerOneMillion: json["casesPerOneMillion"] == null ? null : json["casesPerOneMillion"],
    deathsPerOneMillion: json["deathsPerOneMillion"] == null ? null : json["deathsPerOneMillion"].toDouble(),
    tests: json["tests"] == null ? null : json["tests"],
    testsPerOneMillion: json["testsPerOneMillion"] == null ? null : json["testsPerOneMillion"],
    population: json["population"] == null ? null : json["population"],
    continent: continentValues.map[json["continent"]],
    oneCasePerPeople: json["oneCasePerPeople"] == null ? null : json["oneCasePerPeople"],
    oneDeathPerPeople: json["oneDeathPerPeople"] == null ? null : json["oneDeathPerPeople"],
    oneTestPerPeople: json["oneTestPerPeople"] == null ? null : json["oneTestPerPeople"],
    activePerOneMillion: json["activePerOneMillion"].toDouble(),
    recoveredPerOneMillion: json["recoveredPerOneMillion"] == null ? null : json["recoveredPerOneMillion"].toDouble(),
    criticalPerOneMillion: json["criticalPerOneMillion"] == null ? null : json["criticalPerOneMillion"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "updated": updated,
    "country": country,
    "countryInfo": countryInfo.toMap(),
    "cases": cases,
    "todayCases": todayCases == null ? null : todayCases,
    "deaths": deaths == null ? null : deaths,
    "todayDeaths": todayDeaths == null ? null : todayDeaths,
    "recovered": recovered == null ? null : recovered,
    "todayRecovered": todayRecovered == null ? null : todayRecovered,
    "active": active,
    "critical": critical == null ? null : critical,
    "casesPerOneMillion": casesPerOneMillion == null ? null : casesPerOneMillion,
    "deathsPerOneMillion": deathsPerOneMillion == null ? null : deathsPerOneMillion,
    "tests": tests == null ? null : tests,
    "testsPerOneMillion": testsPerOneMillion == null ? null : testsPerOneMillion,
    "population": population == null ? null : population,
    "continent": continentValues.reverse[continent],
    "oneCasePerPeople": oneCasePerPeople == null ? null : oneCasePerPeople,
    "oneDeathPerPeople": oneDeathPerPeople == null ? null : oneDeathPerPeople,
    "oneTestPerPeople": oneTestPerPeople == null ? null : oneTestPerPeople,
    "activePerOneMillion": activePerOneMillion,
    "recoveredPerOneMillion": recoveredPerOneMillion == null ? null : recoveredPerOneMillion,
    "criticalPerOneMillion": criticalPerOneMillion == null ? null : criticalPerOneMillion,
  };


}

enum Continent { NORTH_AMERICA, EUROPE, SOUTH_AMERICA, ASIA, AFRICA, AUSTRALIA_OCEANIA, EMPTY }

final continentValues = EnumValues({
  "Africa": Continent.AFRICA,
  "Asia": Continent.ASIA,
  "Australia/Oceania": Continent.AUSTRALIA_OCEANIA,
  "": Continent.EMPTY,
  "Europe": Continent.EUROPE,
  "North America": Continent.NORTH_AMERICA,
  "South America": Continent.SOUTH_AMERICA
});

class CountryInfo {
  CountryInfo({
    this.id,
    this.iso2,
    this.iso3,
    this.lat,
    this.long,
    this.flag,
  });

  int id;
  String iso2;
  String iso3;
  double lat;
  double long;
  String flag;

  factory CountryInfo.fromMap(Map<String, dynamic> json) => CountryInfo(
    id: json["_id"] == null ? null : json["_id"],
    iso2: json["iso2"] == null ? null : json["iso2"],
    iso3: json["iso3"] == null ? null : json["iso3"],
    lat: json["lat"].toDouble(),
    long: json["long"].toDouble(),
    flag: json["flag"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id == null ? null : id,
    "iso2": iso2 == null ? null : iso2,
    "iso3": iso3 == null ? null : iso3,
    "lat": lat,
    "long": long,
    "flag": flag,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
