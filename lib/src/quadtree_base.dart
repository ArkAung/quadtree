/// A simple class to represent a point in 2D space with additional data
class Point {
  final double x;
  final double y;
  final dynamic data;

  Point(this.x, this.y, this.data);
}

/// A simple class to represent a rectangle in 2D space
class Rectangle {
  final double x;
  final double y;
  final double width;
  final double height;

  Rectangle(this.x, this.y, this.width, this.height);

  /// Check if a point is inside the rectangle
  bool contains(Point point) {
    return (point.x >= x &&
        point.x <= x + width &&
        point.y >= y &&
        point.y <= y + height);
  }

  /// Check if two rectangles intersect
  bool intersects(Rectangle other) {
    return !(other.x > x + width ||
        other.x + other.width < x ||
        other.y > y + height ||
        other.y + other.height < y);
  }
}

/// A simple implementation of a Quadtree
class Quadtree {
  static const int DEFAULT_CAPACITY = 4;

  final Rectangle boundary;
  final int capacity;
  List<Point> points = [];
  List<Quadtree>? children;

  Quadtree(this.boundary, [this.capacity = DEFAULT_CAPACITY]);

  /// Insert a point into the quadtree
  bool insert(Point point) {
    if (!boundary.contains(point)) {
      return false;
    }

    if (points.length < capacity && children == null) {
      points.add(point);
      return true;
    }

    if (children == null) {
      subdivide();
    }

    for (var child in children!) {
      if (child.insert(point)) {
        return true;
      }
    }

    return false;
  }

  /// Subdivide the quadtree into four quadrants
  void subdivide() {
    double x = boundary.x;
    double y = boundary.y;
    double w = boundary.width / 2;
    double h = boundary.height / 2;

    children = [
      Quadtree(Rectangle(x + w, y, w, h), capacity),
      Quadtree(Rectangle(x, y, w, h), capacity),
      Quadtree(Rectangle(x, y + h, w, h), capacity),
      Quadtree(Rectangle(x + w, y + h, w, h), capacity),
    ];

    for (var point in points) {
      for (var child in children!) {
        if (child.insert(point)) {
          break;
        }
      }
    }

    points.clear();
  }

  /// Returns all points that lie within the given range
  List<Point> query(Rectangle range, [List<Point>? found]) {
    found ??= [];

    if (!boundary.intersects(range)) {
      return found;
    }

    for (var point in points) {
      if (range.contains(point)) {
        found.add(point);
      }
    }

    if (children != null) {
      for (var child in children!) {
        child.query(range, found);
      }
    }

    return found;
  }
}
