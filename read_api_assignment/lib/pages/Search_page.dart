import 'package:flutter/material.dart';
import 'package:read_api_assignment/models/corona_virus.dart';

class Search extends SearchDelegate {
  final List countryList;
  Search(this.countryList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query = '';
    })];
  }
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {
      Navigator.pop(context);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty? countryList: countryList.where((country) => country.startsWith(query)).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
        itemBuilder: (context, index){
      return _buildItem(suggestionList[index]);
    });
  }

  _buildItem (CoronaVirus suggestionList) {
    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Card(
        child: ListTile(
          leading: Image.network("${suggestionList.countryInfo.flag}", height: 50,width: 50,),
          title: Text("${suggestionList.country}",style: TextStyle(fontWeight: FontWeight.bold),),
          //subtitle: Text("TodayCases: ${suggestionList.todayCases}",style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
        ),
        /*Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text("${item.country}"),
                Image.network("${item.countryInfo.flag}", height: 50,width: 50,),
              ],
            ),
          ],
        ),*/
      ),
    );
  }

}