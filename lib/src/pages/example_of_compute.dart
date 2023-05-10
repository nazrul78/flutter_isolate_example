import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExampleOfCompute extends StatelessWidget {
  const ExampleOfCompute({super.key});

  @override
  Widget build(BuildContext context) {
    /// Computationally expensive task
    int expensiveTask(int value) {
      var sum = 0;
      for (var i = 0; i <= value; i++) {
        sum += i;
      }
      log('finished ======>>');
      return sum;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Example of Compute'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 30),
              ElevatedButton(
                  child: Text('Start Expensive Task'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontStyle: FontStyle.normal),
                  ),
                  onPressed: () async {
                    ///======= The function Call without Compute. =======
                    // final sum = computationallyExpensiveTask(1000000000);

                    ///======= The function Call with Compute. =======
                    final sum = await compute(expensiveTask, 1000000000);
                    log('$sum' '======>>');
                  }),
            ]),
      ),
    );
  }
}
