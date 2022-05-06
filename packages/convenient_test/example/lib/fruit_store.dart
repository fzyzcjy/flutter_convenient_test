import 'dart:math';

class FruitStore {
  Future<List<String>> fetchFruitNamesFromBackendApi() async {
    // In e2e tests, latency to a real backend service is random. Let's simulate this in our example.
    await Future.delayed(Duration(milliseconds: Random().nextInt(2000)));
    return _kFruitNames;
  }
}

// Data comes from: https://www.fruityvice.com
const _kFruitNames = [
  'Apple',
  'Apricot',
  'Banana',
  'Blackberry',
  'Blueberry',
  'Cherry',
  'Durian',
  'Fig',
  'Gooseberry',
  'Grapes',
  'GreenApple',
  'Guava',
  'Kiwi',
  'Lemon',
  'Lime',
  'Lingonberry',
  'Lychee',
  'Mango',
  'Melon',
  'Orange',
  'Papaya',
  'Passionfruit',
  'Pear',
  'Persimmon',
  'Pineapple',
  'Plum',
  'Raspberry',
  'Strawberry',
  'Tomato',
  'Umbu',
  'Watermelon',
];
