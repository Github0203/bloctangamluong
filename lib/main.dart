import 'package:btbloc/remote_bloc.dart';
import 'package:btbloc/remote_event.dart';
import 'package:btbloc/remote_state.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // MyHomePage({Key? key} : super(key: key));
  const MyHomePage({Key? key}) : super(key: key) ;

  // final String title;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final bloc = RemoteBloc(); // khởi tạo bloc  <=== new

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<RemoteState>( // sử dụng StreamBuilder để lắng nghe Stream <=== new
          stream: bloc.stateController.stream, // truyền stream của stateController vào để lắng nghe <=== new
          initialData: bloc.state, // giá trị khởi tạo chính là volume 70 hiện tại <=== new
          builder: (BuildContext context, AsyncSnapshot<RemoteState> snapshot) {
            return Text('Âm lượng hiện tại: ${snapshot.data?.volume}'); // update UI <=== new
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => bloc.eventController.sink.add(IncrementEvent(5)), // add event <=== new
            child: Icon(Icons.volume_up),
          ),
          FloatingActionButton(
            onPressed: () => bloc.eventController.sink.add(DecrementEvent(10)), // add event <=== new
            child: Icon(Icons.volume_down),
          ),
          FloatingActionButton(
            onPressed: () => bloc.eventController.sink.add(MuteEvent()), // add event <=== new
            child: Icon(Icons.volume_mute),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose(); // dispose bloc <=== new
  }
}
