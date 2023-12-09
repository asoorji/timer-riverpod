import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final durationProvider = Provider((ref) => 0);
final remainingDurationProvider = StateProvider((ref) => 0);
final isRunningProvider = StateProvider<bool>((ref) => false);
final heightProvider = StateProvider<double>((ref) => 20);

final startTimerProvider = Provider((ref) => () {
      final duration = ref.read(durationProvider);

      ref.read(remainingDurationProvider.notifier).state = duration;
      ref.read(isRunningProvider.notifier).state = true;

      Timer.periodic(const Duration(milliseconds: 100), (timer) {
        ref.read(remainingDurationProvider.notifier).state++;
        ref.read(heightProvider.notifier).state++;

        if (ref.read(remainingDurationProvider.notifier).state == 50) {
          ref.read(isRunningProvider.notifier).state = false;
          timer.cancel();
        }
      });
    });

final stopTimerProvider = Provider((ref) => () {
      final isRunning = ref.read(isRunningProvider.notifier);
      isRunning.state = false;
    });
