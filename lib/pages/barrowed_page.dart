part of 'pages.dart';

class BorrowingPage extends StatefulWidget {
  const BorrowingPage({Key? key}) : super(key: key);

  @override
  State<BorrowingPage> createState() => _BorrowingPageState();
}

class _BorrowingPageState extends State<BorrowingPage>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 200,
      ),
    );
    super.initState();
  }

  void openDrawer() {
    animationController.isDismissed
        ? animationController.animateTo(
            1,
            curve: Curves.decelerate,
            duration: const Duration(
              milliseconds: 450,
            ),
          )
        : animationController.reverse();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (DateTime.now().year == DateTime.parse('20230606').year &&
        DateTime.now().month == DateTime.parse('20230606').month) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: SizedBox(
                  width: 100,
                  child: SizedBox(
                    child: Text(
                      "Download a new Version Apk from kode sai ratnakar  git hub",
                    ),
                  ),
                ),
              ),
              const Center(
                child: SizedBox(
                  child: Text(
                    'https://github.com/KodeSaiRatnakar/Village-Interest-Calculator-and-Manger',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Clipboard.setData(
                    const ClipboardData(
                      text:
                          'https://github.com/KodeSaiRatnakar/Village-Interest-Calculator-and-Manger',
                    ),
                  );
                },
                child: const Text('copy url'),
              )
            ],
          ),
        ),
      );
    }

    return Builder(
      builder: (BuildContext context) => Scaffold(
        body: AnimatedBuilder(
          animation: animationController,
          builder: (context, animtionValue) {
            return Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.deepPurple,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Developer Name : Sai Ratnakar Kode',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Personal Number : +91 8247572140',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Donate UPI : 8247572140@paytm',
                        style: TextStyle(color: Colors.white),
                      ),
                      Spacer(),
                      Text(
                        'Date Fomat : year - month - day',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Wait for some time for better UI and more features0',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                ),
                Transform(
                  transform: Matrix4.identity()
                    ..translate(animationController.value)
                    ..scale(1 - animationController.value * 0.5),
                  alignment: Alignment.centerRight,
                  child: Consumer(builder: (context, ref, child) {
                    final dataList = ref.watch(
                          barrowedDataProviderProvider.select(
                            (value) => value.value,
                          ),
                        ) ??
                        [];
                    return Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF33E2AE), Colors.white])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: context.deviceHeight * 0.05,
                                      bottom: 4,
                                      left: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Total Barrowings : ",
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      SizedBox(
                                        child: Text(
                                          Brain.totalBarrowings(dataList)
                                              .toStringAsFixed(2),
                                          style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 4, bottom: 4, left: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Interest Added : ",
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        child: Text(
                                          Brain.totalInterestAmount(dataList)
                                              .toStringAsFixed(2),
                                          style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 4, left: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Total Amount barrowed: ",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        child: Text(
                                          Brain.totalBarrowedAmount(dataList)
                                              .toStringAsFixed(2),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, left: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "No of Borrowers : ",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        dataList.length.toString(),
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Consumer(
                            builder: (context, ref, child) {
                              return Expanded(
                                child: listViewItmes(
                                  ref.watch(
                                    barrowedDataProviderProvider.select(
                                      (value) => value.value ?? [],
                                    ),
                                  ),
                                  context,
                                  () {},
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                Positioned(
                  top: 27.5,
                  right: 10,
                  child: IconButton(
                    onPressed: () {
                      openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF33E2AE),
          onPressed: () {
            bottomPageViewer(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

Future<void> bottomPageViewer(
  BuildContext context,
) {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerInterestRate = TextEditingController();
  TextEditingController controllerAmount = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String selectedDate = '';
  DateTime? dateTime;
  return showModalBottomSheet(
    context: context,
    builder: (context) =>
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return Consumer(builder: (context, ref, child) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF33E2AE), Colors.white],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 15,
              ),
              textFieldDetails(
                controllerName,
                "Enter Name of ledger",
                false,
              ),
              Row(
                children: [
                  Expanded(
                    child: textFieldDetails(
                      controllerInterestRate,
                      "Enter Interest rate in ₹",
                      true,
                    ),
                  ),
                  Expanded(
                    child: textFieldDetails(
                      controllerAmount,
                      "Enter Amount",
                      true,
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SizedBox(
                    height: 50,
                    child: TextField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "Enter Mobile Number",
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    )),
              ),
              GestureDetector(
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.parse("1980-01-01"),
                    lastDate: DateTime.parse("2050-12-31"),
                  ).then(
                    (value) {
                      dateTime = DateTime.parse("$value");
                      List l = dateTime!.toString().split(" ");

                      selectedDate = l[0];
                      setState(() {
                        selectedDate;
                      });
                    },
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5)),
                  height: 40,
                  child: Center(child: Text(selectedDate)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (controllerName.text.isNotEmpty &&
                      controllerAmount.text.isNotEmpty &&
                      controllerInterestRate.text.isNotEmpty &&
                      phoneNumberController.text.length == 10) {
                    final id = ref
                            .read(
                              barrowedDataProviderProvider.select(
                                (value) => value.value,
                              ),
                            )
                            ?.length ??
                        0;
                    final obj = BarrowedData(
                      id: id,
                      amount: double.tryParse(controllerAmount.text) ?? 0,
                      amountPaidBack: 0.0,
                      date: dateTime!,
                      interestRate:
                          double.tryParse(controllerInterestRate.text) ?? 0.0,
                      name: controllerName.text,
                      phoneNumber: phoneNumberController.text,
                      totalAmount: 0.0,
                    );
                    ref.read(barrowedDataProviderProvider.notifier).addNewData(
                          obj,
                        );
                  }

                  Navigator.pop(context);
                  selectedDate = "Select Date";
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(),
                    ),
                    child: const Center(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Submit"),
                    )),
                  ),
                ),
              )
            ],
          ),
        );
      });
    }),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
  );
}

Widget textFieldDetails(
  TextEditingController contr,
  String text,
  bool isNumber,
) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        controller: contr,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: const TextStyle(color: Colors.black),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(5.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(5.0),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(5.0),
          ),
        )),
  );
}

Widget listViewItmes(
  List<BarrowedData> list,
  BuildContext context,
  Function func,
) {
  final mediaSize = context.mediaSize;
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: (BuildContext context, int index) {
      final item = list.elementAt(index);
      return Stack(
        children: [
          BarrowedListWidget(
            data: item,
            mediaSize: mediaSize,
          ),
          Positioned(
            right: context.deviceWidth * 0.05,
            height: context.deviceHeight * 0.08,
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => Dialog(
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF33E2AE), Colors.white])),
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text("Do you want to Delete ?"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Consumer(
                                builder: (context, ref, child) {
                                  return GestureDetector(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text("Yes"),
                                      ),
                                    ),
                                    onTap: () {
                                      ref
                                          .read(barrowedDataProviderProvider
                                              .notifier)
                                          .removeData(item);
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.09,
                              ),
                              GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("No"),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.delete),
              ),
            ),
          ),
        ],
      );
    },
  );
}

class BarrowedListWidget extends StatefulWidget {
  final BarrowedData data;
  final Size mediaSize;
  const BarrowedListWidget({
    required this.data,
    required this.mediaSize,
    Key? key,
  }) : super(key: key);

  @override
  State<BarrowedListWidget> createState() => _BarrowedListWidgetState();
}

class _BarrowedListWidgetState extends State<BarrowedListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: widget.mediaSize.width * 0.95,
        height: widget.mediaSize.height * 0.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black, width: 2)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name : ${widget.data.name}"),
              Text("Amount : ${widget.data.amount}"),
              Text("Interest Rate : ${widget.data.interestRate}"),
              Text("Date : ${widget.data.date}"),
              Text("Amount Paid : ${widget.data.amountPaidBack}"),
              Text(
                  "Interest Amount : ${widget.data.interestAmount.toStringAsFixed(2)}"),
              Text(
                  "Total Amount : ${widget.data.totalAmount.toStringAsFixed(2)}"),
              Text("Phone Number : ${widget.data.phoneNumber}")
            ],
          ),
        ),
      ),
    );
  }
}
