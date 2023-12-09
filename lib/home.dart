import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'provider.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remainingDuration = ref.watch(remainingDurationProvider);

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
            Text(
              '$remainingDuration seconds remaining',
              style: const TextStyle(fontSize: 32.0),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: startTimer,
                  child: const Text('Start'),
                ),
                const SizedBox(width: 10.0),
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
