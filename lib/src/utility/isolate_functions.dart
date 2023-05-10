import 'dart:async';
import 'dart:isolate';

@pragma('vm:entry-point')
void runIsolateTaskA(SendPort port) {
  Timer.periodic(Duration(seconds: 1), (timer) {
    port.send(timer.tick);
  });
}

@pragma('vm:entry-point')
void runIsolateTaskB(SendPort port) {
  Timer.periodic(Duration(seconds: 5), (timer) {
    port.send(timer.tick);
  });
}
