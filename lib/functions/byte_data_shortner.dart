import 'dart:math' as math;

String gtByteDataShortner({required int bytes, int decimals = 2}) {
  if (bytes == 0) {
    return '0 B';
  }

  const k = 1024;
  final dm = decimals < 0 ? 0 : decimals;
  const sizes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];

  int i = math.log(bytes) ~/ math.log(k);
  final pow = math.pow(k, i);
  return '${(bytes / pow).toStringAsFixed(dm)} ${sizes[i]}';
}
