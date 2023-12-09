import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'provider.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remainingDuration = ref.watch(remainingDurationProvider);
    final height = ref.watch(heightProvider);
    final startTimer = ref.read(startTimerProvider);
    final stopTimer = ref.read(stopTimerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Timer with Riverpod'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.yellow,
              width: 50,
              height: height,
            ),
            const Gap(10),
            Text(
              '$remainingDuration seconds remaining',
              style: const TextStyle(fontSize: 32.0),
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: startTimer,
                  child: const Text('Start'),
                ),
                const Gap(10),
                ElevatedButton(
                  onPressed: stopTimer,
                  child: const Text('Stop'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
