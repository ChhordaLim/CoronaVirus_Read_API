import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:read_api_assignment/models/corona_virus.dart';

class CountryPage extends StatefulWidget {

  final CoronaVirus item;
  CountryPage ({this.item});
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  get _buildAppBar {
    return AppBar(
      title: Text("Country"),
      centerTitle: true,
    );
  }

  get _buildBody {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildDetailPage,
          ],
        ),
      ),
    );
  }

  get _buildDetailPage {
    return Container(
      height: 500,
      child: Row(
        children: <Widget>[
          Container(
            height: 150,
            width: 100,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey[300], blurRadius: 10, offset: Offset(0,10)),
              ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("${widget.item.country}", style: TextStyle(fontWeight: FontWeight.bold),),
                Image.network("${widget.item.countryInfo.flag}", height: 80,width: 80,),
              ],
            ),
          ),
          Expanded(child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Comfirm:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black),),
                Text("${widget.item.cases}", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.red),),
                Text("Active:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black),),
                Text("${widget.item.active}", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.blue),),
                Text("Recovered:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black),),
                Text("${widget.item.recovered}", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.green),),
                Text("Death:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black),),
                Text("${widget.item.deaths}", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.grey[600]),),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
