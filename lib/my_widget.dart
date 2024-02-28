import 'dart:math';

import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final ValueNotifier<Color> _animatedUpdator = ValueNotifier<Color>(Colors.red);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 400,
          height: 400,
          color: Colors.amber,
          child: Center(
            child: AnimatedBuilder(
              animation: _animatedUpdator,
              builder: (BuildContext context, Widget? child) {
                return Container(
                  width: 200,
                  height: 200,
                  color: _animatedUpdator.value,
                );
              },
            ),
          ),
        ),
        Row(
          children: <Widget>[
            ElevatedButton(
              child: const Text('@@@@@'),
              onPressed: () {
                _animatedUpdator.value = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
              },
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              child: const Text('@@@@@'),
              onPressed: () async {
                // _animatedUpdator.value = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
                showDialog(
                  context: context,
                  builder: (BuildContext context) => Dialog(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'This is a typical dialog.',
                            style: TextStyle(
                              color: _animatedUpdator.value,
                            ),
                          ),
                          const SizedBox(height: 15),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
