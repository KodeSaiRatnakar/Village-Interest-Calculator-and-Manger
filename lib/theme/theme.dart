import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../imports.dart';

part 'const.dart';
part 'theme.g.dart';

const darkBlue = Color(0xff011082);
const primaryBlue = Color(0xff344afb);
const lightBlue = Color.fromARGB(255, 64, 142, 243);

@Riverpod(keepAlive: true)
({ThemeData theme, bool isDarkMode}) themeDataManager(ThemeDataManagerRef ref) {
  return (theme: lightTheme, isDarkMode: true);
}

final lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: primaryBlue,
    secondary: lightBlue,
  ),
  scaffoldBackgroundColor: Colors.white,
  buttonTheme: const ButtonThemeData(
    buttonColor: primaryBlue,
    textTheme: ButtonTextTheme.primary,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: primaryBlue),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),
  textTheme: const TextTheme(
    bodySmall: TextStyle(fontSize: 12),
    bodyMedium: TextStyle(fontSize: 14),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    labelLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w800,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: primaryBlue, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: primaryBlue, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: primaryBlue, width: 1.5),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: primaryBlue, width: 1.5),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: primaryBlue,
  scaffoldBackgroundColor: Colors.black,
  buttonTheme: const ButtonThemeData(
    buttonColor: primaryBlue,
    textTheme: ButtonTextTheme.primary,
  ),
);
