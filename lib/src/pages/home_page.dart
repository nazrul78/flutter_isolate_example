import 'package:flutter/material.dart';
import 'package:flutter_isolate_example/src/pages/example_of_compute.dart';
import 'package:flutter_isolate_example/src/pages/example_of_spawn.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Isolate Example'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Example Of Compute'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontStyle: FontStyle.normal),
              ),
              onPressed: () => Get.to(() => ExampleOfCompute()),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Example Of Spawn'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontStyle: FontStyle.normal),
              ),
              onPressed: () => Get.to(() => ExampleOfSpawn()),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
