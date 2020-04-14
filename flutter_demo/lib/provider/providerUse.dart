import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import './provider.dart';

import './changeNotifierProvider.dart';

class providerApp extends StatelessWidget {

  @override
  //  provider
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Provider<ProviderBlock>(
//      create: (context) => ProviderBlock(),
//      dispose: (context, bloc) => bloc.dispose(),
//      child: MaterialApp(
//        home: Scaffold(
//          appBar: AppBar(
//            title: Text('Provider Demo'),
//          ),
//          body: CounterLabel(),
//          floatingActionButton:CounterButton(),
//        ),
//      ),
//    );
//  }

  // changeNotifierProvider
   Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider<CounterProvider> (

      create: (context) => CounterProvider(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('ChangeNotifierProvider Demo'),
          ),
          body: CounterLabel(),
          floatingActionButton:CounterButton(),
        ),
      ),
    );
  }

}

class CounterButton extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
//      onPressed: Provider.of<ProviderBlock>(context).increment,  // provider
      child: const Icon(Icons.add),
      onPressed: Provider.of<CounterProvider>(context).increment,  // changeNotifierProvider
    );
  }
}

class CounterLabel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(

      // provider
//      child: StreamBuilder<int>(
//          builder: (context, snapshot) {
//            return Text('you have push ${snapshot.data} times');
//          },
//        initialData: 0,
//        stream: Provider.of<ProviderBlock>(context).stream,
//      ),


    // changeNotifierProvider
      child: Consumer<CounterProvider>(
          builder: (BuildContext context, CounterProvider counter, Widget child) {
           return Text('you hava push ${counter.count} times');
          }
      ),
    );
  }
}