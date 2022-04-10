library path_animator;

import 'dart:ui';

class PathAnimator {
  const PathAnimator();

  static Path build({
    required Path path,
    required double animationPercent,
  }) {
    // Total length of the path
    final totalLength =
        path.computeMetrics().fold(0.0, (double prev, PathMetric metric) {
      return prev + metric.length;
    });

    final currentLength = totalLength * animationPercent;

    return _extractPathUntilLength(path, currentLength);
  }

  static Path _extractPathUntilLength(
    Path originalPath,
    double length,
  ) {
    var currentLength = 0.0;

    final path = Path();

    var metricsIterator = originalPath.computeMetrics().iterator;

    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);
        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        // Extract Path
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }
}
