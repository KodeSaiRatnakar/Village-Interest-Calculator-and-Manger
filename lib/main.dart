// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:manager/pages/pages.dart';

import 'imports.dart';

void main() async {
  await initAppData();
  return runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Village Interest Manager',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var mHeight = MediaQuery.of(context).size.height;
    var mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF33E2AE), Colors.white],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: mWidth * 0.35,
                height: mHeight * 0.1,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: const Center(
                  child: Text(
                    "Portfolio",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(mWidth * 0.07),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: BoxButtons(
                        deviceWidth: mWidth,
                        deviceHeight: mHeight,
                        data: "Borrowing"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BorrowingPage(),
                        ),
                      );
                    },
                  ),
                  GestureDetector(
                    child: BoxButtons(
                        deviceWidth: mWidth,
                        deviceHeight: mHeight,
                        data: "Lendings"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LendingPage(),
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BoxButtons extends StatelessWidget {
  final double deviceHeight;
  final double deviceWidth;
  final String data;
  const BoxButtons({
    Key? key,
    required this.deviceHeight,
    required this.deviceWidth,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceHeight * 0.1,
      width: deviceWidth * 0.4,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          data,
          style: const TextStyle(
              color: Color(
                0xFF0C093C,
              ),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
