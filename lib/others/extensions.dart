part of 'others.dart';

extension ContextExt on BuildContext {
  double get deviceHeight {
    return mediaSize.height;
  }

  double get deviceWidth {
    return mediaSize.width;
  }

  Size get mediaSize {
    return MediaQuery.of(this).size;
  }
}
