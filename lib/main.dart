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
                child: const Center(
                  child: Text(
                    "Portfolio",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(width: 2, color: Colors.black),
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
                        m_width: mWidth, m_height: mHeight, data: "Borrowing"),
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
                        m_width: mWidth, m_height: mHeight, data: "Lendings"),
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

class BoxButtons extends StatefulWidget {
  final double m_height;
  final double m_width;
  String data = "";
  BoxButtons(
      {required this.m_width,
      required this.m_height,
      required this.data,
      Key? key})
      : super(key: key);

  @override
  State<BoxButtons> createState() => _BoxButtonsState();
}

class _BoxButtonsState extends State<BoxButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          widget.data,
          style: const TextStyle(
              color: Color(
                0xFF0C093C,
              ),
              fontWeight: FontWeight.bold),
        ),
      ),
      height: widget.m_height * 0.1,
      width: widget.m_width * 0.4,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
    );
  }
}
