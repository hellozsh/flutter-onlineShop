import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/test_page/choice.dart';

class TestAppBarPage extends StatefulWidget {

  _TestAppBarPageState createState() => _TestAppBarPageState();
}

class _TestAppBarPageState extends State<TestAppBarPage> with SingleTickerProviderStateMixin {

  TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: choices.length);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  void _nextPage(int delta) {
    final int newIndex = _tabController.index + delta;
    if(newIndex < 0 || newIndex >= _tabController.length)
      return;
    _tabController.animateTo(newIndex);
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AppBar Bottom Widget'),
          leading: IconButton(
              tooltip: 'Previous choice',
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                _nextPage(-1);
              }
          ),
          actions: <Widget>[

            IconButton(
                icon: Icon(Icons.arrow_forward),
                tooltip: 'Next choice',
                onPressed: (){_nextPage(1);}
            ),
          ],
          bottom: PreferredSize(
              child: Theme(
                  data: Theme.of(context).copyWith(
                    accentColor: Colors.white
                  ),
                  child: Container(
                    height: 48.0,
                    alignment: Alignment.center,
                    child: TabPageSelector(controller: _tabController,),
                  )
              ),
              preferredSize: Size.fromHeight(48.0),
          ),
        ),
        body: TabBarView(
            controller: _tabController,
            children: choices.map((Choice choice) {
             return Padding(
                  padding: EdgeInsets.all(16.0),
                child: ChoiceCard(choice: choice,),
              );
            }).toList(),
        ),
      ),
    );
  }
}