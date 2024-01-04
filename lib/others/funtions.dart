part of 'others.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BarrowedDataAdapter());
}

Future<void> initAppData() async {
  await initHive();
}
