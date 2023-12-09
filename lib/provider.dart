import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final durationProvider = Provider((ref) => 0);
final remainingDurationProvider = StateProvider((ref) => 0);
final isRunningProvider = StateProvider<bool>((ref) => false);

final startTimerProvider = Provider((ref) => () {
      final duration = ref.read(durationProvider);
      final remainingDuration = ref.read(remainingDurationProvider.notifier);
      final isRunning = ref.read(isRunningProvider.notifier);

      remainingDuration.state = duration;
      isRunning.state = true;

      Timer.periodic(const Duration(milliseconds: 100), (timer) {
        remainingDuration.state++;
        if (remainingDuration.state == 5) {
          isRunning.state = false;
          timer.cancel();
        }
      });
    });

final stopTimerProvider = Provider((ref) => () {
      final isRunning = ref.read(isRunningProvider.notifier);
      isRunning.state = false;
    });
