import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_1/color_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider(
        create: (context) => ColorBloc(),
        child: MyHomePage(),
      ),
      );
  }
}

class MyHomePage extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
      ColorBloc _bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
          appBar: AppBar(
            title: Text('BLoC with flutter_bloc'),
            centerTitle: true,
          ),
      body: Center(
            child: BlocBuilder<ColorBloc, Color>(
              builder: (context, currentColor) =>
            AnimatedContainer(   //анимированный контейнер
        height: 100,          //размеры
        width: 100,
        color: currentColor,
        duration: Duration(milliseconds: 500),     //длительность анимации
      ),),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget> [
          FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: (){
              _bloc.add(ColorEvent.event_red);
              }),
          SizedBox(width: 10,),
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: (){
              _bloc.add(ColorEvent.event_green);
            },
          )
        ],
      ),
    );
  }
}

