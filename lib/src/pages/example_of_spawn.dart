import 'dart:developer';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_isolate/flutter_isolate.dart';

import '../utility/isolate_functions.dart';

class ExampleOfSpawn extends StatefulWidget {
  ExampleOfSpawn({super.key});

  @override
  State<ExampleOfSpawn> createState() => _ExampleOfSpawnState();
}

class _ExampleOfSpawnState extends State<ExampleOfSpawn> {
  late FlutterIsolate flutterIsolateA;
  late FlutterIsolate flutterIsolateB;

  final portA = ReceivePort();
  final portB = ReceivePort();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    portA.listen(
      (data) {
        log("Received data from the isolate A $data");
      },
    );

    portB.listen(
      (data) {
        log("Received data from the isolate B $data");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spawn'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(
                child: Text('Start spawn method A'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontStyle: FontStyle.normal),
                ),
                onPressed: () async {
                  flutterIsolateA = await FlutterIsolate.spawn(
                    runIsolateTaskA,
                    portA.sendPort,
                  );
                },
              ),
              ElevatedButton(
                child: Text('Stop spawn method A'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontStyle: FontStyle.normal),
                ),
                onPressed: () async {
                  flutterIsolateA.kill(priority: Isolate.immediate);
                },
              ),
              ElevatedButton(
                child: Text('Start spawn method B'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontStyle: FontStyle.normal),
                ),
                onPressed: () async {
                  flutterIsolateB = await FlutterIsolate.spawn(
                    runIsolateTaskB,
                    portB.sendPort,
                  );
                },
              ),
              ElevatedButton(
                child: Text('Stop spawn method B'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontStyle: FontStyle.normal),
                ),
                onPressed: () async {
                  flutterIsolateB.kill(priority: Isolate.immediate);
                },
              ),
              ElevatedButton(
                child: Text('Stop all spawn method'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontStyle: FontStyle.normal),
                ),
                onPressed: () async {
                  await FlutterIsolate.killAll();
                },
              ),
            ]),
      ),
    );
  }
}
