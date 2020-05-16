import '../class/mytile.dart';

import 'package:flutter/material.dart';

class TileApp extends StatelessWidget {
  //final Patient newPatient;
  final List<MyTile> inputList;
  TileApp({@required this.inputList});

  @override
  Widget build(BuildContext context) {
    List<MyTile> tempList = inputList;
    return new Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: Text('Patient Information'),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return new StuffInTiles(tempList[index]);
              },
              itemCount: tempList.length,
            ),
          ),
//          BottomButton(
//            onTap: () {
//              print(newPatient.toJson());
//            },
//            title: 'Finalize',
//          ),
        ],
      ),
    );
  }
}

class StuffInTiles extends StatelessWidget {
  final MyTile myTile;
  StuffInTiles(this.myTile);

  @override
  Widget build(BuildContext context) {
    return _buildTiles(myTile);
  }

  Widget _buildTiles(MyTile t) {
    if (t.children.isEmpty)
      return ListTileTheme(
        child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 4.0, horizontal: 35.0),
            dense: true,
            enabled: true,
            isThreeLine: false,
            onLongPress: () => print("long press"),
            onTap: () => print("tap"),
            //subtitle: new Text("Subtitle"),
            //leading: new Text("Leading"),
            selected: true,
            //trailing: new Text("trailing"),
            title: new Text(t.title)),
      );

    return new ExpansionTile(
      //backgroundColor: kActiveCardColour,
      key: new PageStorageKey<int>(3),
      title: new Text(
        t.title,
      ),
      children: t.children.map(_buildTiles).toList(),
    );
  }
}
