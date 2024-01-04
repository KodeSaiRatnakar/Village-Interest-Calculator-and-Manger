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

  double get appBarHeight {
    return deviceHeight * 0.08;
  }

  TextTheme get textTheme {
    return Theme.of(this).textTheme;
  }

  ThemeData get themeData {
    return Theme.of(this);
  }
}
