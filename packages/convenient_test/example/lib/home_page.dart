import 'package:convenient_test_example/fruit_store.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var fetching = false;
  List<String>? fruitNames;

  // TODO remove
  // var count = 0;
  // var starredIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomePage')),
      body: fetching
          ? const Center(
              child: Text('Fetching now... (Imagine some network latency here)'),
            )
          : fruitNames == null
              ? Center(
                  child: TextButton(
                    onPressed: _fetchFruits,
                    child: const Text('Tap to fetch fruits'),
                  ),
                )
              : ListView.builder(
                  itemCount: fruitNames!.length,
                  itemBuilder: (_, i) => ListTile(
                    title: Text(fruitNames![i]),
                  ),
                ),
      // TODO remove
      // body: Center(
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       const Text('I am home page.', style: TextStyle(fontSize: 18)),
      //       const SizedBox(height: 4),
      //       Text(
      //         '' + (count == 0 ? 'No tap' : (count == 1 ? '1 tap' : '$count taps')),
      //         style: const TextStyle(fontSize: 18),
      //       ),
      //       for (var i = 0; i < 3; ++i)
      //         Mark(
      //           name: HomePageMark.row,
      //           child: ListTile(
      //             title: Text('Row ${i + 1}' + (starredIndex == i ? ' [Starred]' : '')),
      //             trailing: IconButton(
      //               onPressed: () => setState(() => starredIndex = i),
      //               icon: Mark(
      //                 name: HomePageMark.star,
      //                 child: Icon(starredIndex == i ? Icons.star : Icons.star_border),
      //               ),
      //             ),
      //           ),
      //         ),
      //     ],
      //   ),
      // ),
      // floatingActionButton: Mark(
      //   name: HomePageMark.button,
      //   child: FloatingActionButton(
      //     onPressed: () => setState(() => count++),
      //     child: const Icon(Icons.add),
      //   ),
      // ),
    );
  }

  void _fetchFruits() {
    setState(() {
      fetching = true;
    });
    FruitStore().fetchFruitNamesFromBackendApi().then((fruits) {
      setState(() {
        fruitNames = fruits;
        fetching = false;
      });
    });
  }
}

enum HomePageMark {
  button,
  row,
  star,
}
