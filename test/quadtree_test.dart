import 'package:test/test.dart';
import 'package:quadtree/quadtree.dart';

void main() {
  group('Quadtree', () {
    test('insert and query points', () {
      final quadtree = Quadtree(Rectangle(0, 0, 100, 100));
      final points = [
        Point(10, 10, 'ten and ten'),
        Point(20, 20, 'twenty and twenty'),
        Point(30, 30, 'thirty and thirty'),
        Point(40, 40, 'forty and forty'),
        Point(50, 50, 'fifty and fifty'),
      ];

      for (var point in points) {
        expect(quadtree.insert(point), isTrue);
      }

      final found = quadtree.query(Rectangle(0, 0, 50, 50));
      expect(found.length, equals(5));
    });

    test('query with range', () {
      final quadtree = Quadtree(Rectangle(0, 0, 100, 100));
      final points = [
        Point(10, 10, 'ten and ten'),
        Point(20, 20, 'twenty and twenty'),
        Point(30, 30, 'thirty and thirty'),
        Point(80, 80, 'eighty and forty'),
        Point(90, 90, 'ninty and ninty'),
      ];

      for (var point in points) {
        quadtree.insert(point);
      }

      final found = quadtree.query(Rectangle(0, 0, 50, 50));
      expect(found.length, equals(3));
    });

    test('insert beyond capacity', () {
      final quadtree = Quadtree(Rectangle(0, 0, 100, 100), 2);
      final points = [
        Point(10, 10, 'ten and ten'),
        Point(20, 20, 'twenty and twenty'),
        Point(30, 30, 'thirty and thirty'),
        Point(40, 40, 'forty and forty'),
      ];

      for (var point in points) {
        expect(quadtree.insert(point), isTrue);
      }

      expect(quadtree.children, isNotNull);
      expect(quadtree.children!.length, equals(4));
    });

    test('insert outside boundary', () {
      final quadtree = Quadtree(Rectangle(0, 0, 100, 100));
      final point = Point(150, 150, 'one fifty and one fifty');

      expect(quadtree.insert(point), isFalse);
    });
  });
}
