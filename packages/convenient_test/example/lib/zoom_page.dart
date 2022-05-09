import 'package:flutter/material.dart';

class ZoomPage extends StatelessWidget {
  const ZoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ZoomPage')),
      body: Center(
        child: SizedBox(
          width: 275,
          height: 375,
          child: InteractiveViewer(
            constrained: false,
            child: Column(
              children: [
                for (var colorIndex = 0; colorIndex < Colors.primaries.length; ++colorIndex)
                  Row(
                    children: [
                      for (final shade in [50, 100, 200, 300, 400, 500, 600, 700, 800, 900])
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.primaries[colorIndex][shade],
                          child: Center(
                            child: Text('$colorIndex#${shade ~/ 100}'),
                          ),
                        )
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
