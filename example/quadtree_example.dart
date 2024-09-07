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
