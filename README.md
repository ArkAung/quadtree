# Quadtree

[![Pub Version](https://img.shields.io/pub/v/quadtree.svg)](https://pub.dev/packages/quadtree)
[![Dart SDK Version](https://badgen.net/pub/sdk-version/quadtree)](https://pub.dev/packages/quadtree)
[![codecov](https://codecov.io/gh/arkaung/quadtree/branch/main/graph/badge.svg)](https://codecov.io/gh/arkaung/quadtree)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Pub Points](https://img.shields.io/pub/points/quadtree)](https://pub.dev/packages/quadtree/score)

A fast and efficient quadtree implementation in Dart for spatial partitioning and range queries.

## Features

- Efficient spatial partitioning for 2D space
- Fast point insertion and range queries

## Installation

Add `quadtree` to your `pubspec.yaml` file:

```yaml
dependencies:
  quadtree: ^1.0.0
```

Then run:

```
dart pub get
```

## Usage

Here's a quick example of how to use the Quadtree package:

```dart
import 'package:quadtree/quadtree.dart';

void main() {
  // Create a quadtree with a boundary of 100x100
  final quadtree = Quadtree(Rectangle(0, 0, 100, 100));

  // Insert some points
  quadtree.insert(Point(10, 20, 'data 1'));
  quadtree.insert(Point(50, 50, 'data 2'));
  quadtree.insert(Point(80, 15, 'data 3'));

  // Query points within a range
  final pointsInRange = quadtree.query(Rectangle(0, 0, 60, 60));
  print('Points in range: ${pointsInRange.length}');

  // You can also associate data with points
  quadtree.insert(Point(25, 35, 'Some data'));

  // Retrieve points with their associated data
  final pointsWithData = quadtree.query(Rectangle(20, 30, 10, 10));
  for (var point in pointsWithData) {
    print('Point at (${point.x}, ${point.y}) with data: ${point.data}');
  }
}
```

## API Reference

### `Quadtree`

The main class for the quadtree data structure.

#### Constructor

- `Quadtree(Rectangle boundary, [int capacity = 4])` : Creates a new quadtree with the given boundary and capacity.

#### Methods

- `bool insert(Point point)` : Inserts a point into the quadtree.
- `List<Point> query(Rectangle range)` : Returns all points within the given range.

### `Point`

Represents a point in 2D space.

#### Constructor

- `Point(double x, double y, [dynamic data])` : Creates a new point with optional associated data.

### `Rectangle`

Represents a rectangular boundary.

#### Constructor

- `Rectangle(double x, double y, double width, double height)` : Creates a new rectangle.


## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.