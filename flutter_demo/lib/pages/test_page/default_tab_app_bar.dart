import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/test_page/choice.dart';

class TabbedAppBarSample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      home: DefaultTabController(
          length: choices.length,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Tabbed AppBar'),
//              bottom: PreferredSize(
//                child: Theme(
//                    data: Theme.of(context).copyWith(
//                        accentColor: Colors.white
//                    ),
//                    child: Container(
//                      height: 48.0,
//                      alignment: Alignment.center,
//                      child: TabPageSelector(),
//                    )
//                ),
//                preferredSize: Size.fromHeight(48.0),
//              ),
              bottom: TabBar(
                  tabs: choices.map((Choice choice){
                    return Tab(
                      text: choice.title,
                      icon: Icon(choice.icon),
                    );
                  }).toList(),
              ),
            ),
            body: TabBarView(
                children: choices.map((Choice choice) {
                  return Padding(
                    padding: EdgeInsets.all(16.0),
                    child: ChoiceCard(choice: choice,),
                  );
                }).toList(),
            ),
          ),
      ),
    );
  }
}