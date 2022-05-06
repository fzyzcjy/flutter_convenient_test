import 'package:convenient_test/convenient_test.dart';
import 'package:convenient_test_example/fruit_store.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var fetching = false;
  List<String>? fruits;
  final chosenFruits = <String>[];

  // TODO remove
  // var count = 0;
  // var starredIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomePage')),
      body: _buildBody(),
      floatingActionButton: Mark(
        name: HomePageMark.fab,
        child: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/second', arguments: chosenFruits),
          child: const Icon(Icons.done),
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
    );
  }

  Widget _buildBody() {
    if (fetching) {
      return const Center(
        child: Text('Fetching now... (Imagine some network latency here)'),
      );
    }

    if (fruits == null) {
      return Center(
        child: Mark(
          name: HomePageMark.fetchFruits,
          child: TextButton(
            onPressed: _fetchFruits,
            child: const Text('Tap to fetch fruits'),
          ),
        ),
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 4, left: 16, right: 16),
          child: Text(
            chosenFruits.isEmpty ? 'You chose nothing' : 'You chose: ${chosenFruits.join(', ')}',
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: fruits!.length,
            itemBuilder: (_, i) {
              final fruit = fruits![i];
              return ListTile(
                onTap: () => setState(() => chosenFruits.toggle(fruit)),
                title: Text(fruit),
                trailing: chosenFruits.contains(fruit) ? const Icon(Icons.star, color: Colors.blue) : null,
              );
            },
          ),
        ),
      ],
    );
  }

  void _fetchFruits() {
    setState(() {
      fetching = true;
    });
    FruitStore().fetchFruitNamesFromBackendApi().then((fetchedFruits) {
      setState(() {
        fruits = fetchedFruits;
        fetching = false;
      });
    });
  }
}

enum HomePageMark {
  fetchFruits,
  fab,
}

extension<T> on List<T> {
  void toggle(T value) {
    if (contains(value)) {
      remove(value);
    } else {
      add(value);
    }
  }
}
