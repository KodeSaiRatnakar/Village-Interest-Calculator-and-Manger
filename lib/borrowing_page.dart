import 'package:flutter/material.dart';
import 'package:manager/brain.dart';
import 'package:flutter/services.dart';
/*
DateTime date_time = DateTime.now();
String date_select = "Select Date";
TextEditingController controller_name = TextEditingController();
TextEditingController controller_interest_rate = TextEditingController();
TextEditingController controller_amount = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();
List<BarrowedData> barrowers_list = [];

class BorrowingPage extends StatefulWidget {
  const BorrowingPage({Key? key}) : super(key: key);

  @override
  State<BorrowingPage> createState() => _BorrowingPageState();
}

class _BorrowingPageState extends State<BorrowingPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var mHeight = MediaQuery.of(context).size.height;
    var mWidth = MediaQuery.of(context).size.width;

    if (DateTime.now().year == DateTime.parse('20230606').year &&
        DateTime.now().month == DateTime.parse('20230606').month) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: FittedBox(
                      child: Text(
                          "Download a new Version Apk from kode sai ratnakar  git hub"))),
              Center(
                child: FittedBox(
                    child: Text(
                        'https://github.com/KodeSaiRatnakar/Village-Interest-Calculator-and-Manger')),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(
                        text:
                            'https://github.com/KodeSaiRatnakar/Village-Interest-Calculator-and-Manger'));
                  },
                  child: Text('copy url'))
            ],
          ),
        ),
      );
    }
    late AnimationController animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    @override
    void fetch_data() async {
      barrowers_list = await Database_Barrower.get_data();
    }

    void initState() {
      super.initState();
      animationController;
      fetch_data();
    }

    void openDrawer() {
      animationController.isDismissed
          ? animationController.animateTo(1,
              curve: Curves.decelerate, duration: Duration(milliseconds: 450))
          : animationController.reverse();
    }

    void refresh_widget() {
      setState(() {
        const BorrowingPage();
      });
    }

    void ch(String val) {
      setState(() {
        val = val;
      });
    }

    @override
    void dispose() {
      animationController.dispose();
      super.dispose();
    }

    return FutureBuilder(
      future: Database_Barrower.get_data(),
      builder: (BuildContext context, AsyncSnapshot snapshot) => Scaffold(
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
                    child: Container(
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
                            child: Container(
                              child: Center(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: mHeight * 0.05,
                                          bottom: 4,
                                          left: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Total Barrowings : ",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          FittedBox(
                                            child: Text(
                                              Brain.total_amount(
                                                      snapshot.data == null
                                                          ? []
                                                          : snapshot.data)
                                                  .toStringAsFixed(2),
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 4, bottom: 4, left: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Interest Added : ",
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                          FittedBox(
                                            child: Text(
                                              Brain.total_interest_amount(
                                                      snapshot.data == null
                                                          ? []
                                                          : snapshot.data)
                                                  .toStringAsFixed(2),
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(bottom: 4, left: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Total Amount barrowed: ",
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                          FittedBox(
                                            child: Text(
                                              Brain.total_barrowed_amount(
                                                      snapshot.data == null
                                                          ? []
                                                          : snapshot.data)
                                                  .toStringAsFixed(2),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 4, left: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "No of Borrowers : ",
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                            snapshot.data == null
                                                ? "0"
                                                : snapshot.data.length
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              child: list_view_items(
                                  snapshot.data == null ? [] : snapshot.data,
                                  context,
                                  refresh_widget)),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 27.5,
                    right: 10,
                    child: IconButton(
                        onPressed: () {
                          openDrawer();
                        },
                        icon: Icon(Icons.menu)),
                  ),
                ],
              );
            }),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: const Color(0xFF33E2AE),
          onPressed: () {
            bottom_page_viewer(
              context,
              controller_name,
              controller_interest_rate,
              controller_amount,
              phoneNumberController,
              refresh_widget,
            );
            // Navigator.push(context,
            //  MaterialPageRoute(builder: (context) => showModalBottomSheet(context: context, builder: builder)));
          },
        ),
      ),
    );
  }
}

Future bottom_page_viewer(
  BuildContext context,
  TextEditingController controller_name,
  TextEditingController controller_interest_rate,
  TextEditingController controller_amount,
  TextEditingController phoneNumberController,
  Function list_adder,
) {
  return showModalBottomSheet(
    context: context,
    builder: (context) =>
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF33E2AE), Colors.white])),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Text_Field_Details(controller_name, "Enter Name of ledger", false),
            Row(
              children: [
                Expanded(
                  child: Text_Field_Details(controller_interest_rate,
                      "Enter Interest rate in ₹", true),
                ),
                Expanded(
                    child: Text_Field_Details(
                        controller_amount, "Enter Amount", true))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 50,
                  child: TextField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "Enter Mobile Number",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
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
                        lastDate: DateTime.parse("2050-12-31"))
                    .then((value) {
                  date_time = DateTime.parse("$value");
                  List l = date_time.toString().split(" ");

                  date_select = l[0];
                  setState(() {
                    date_select;
                  });
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5)),
                height: 40,
                child: Center(child: Text(date_select)),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (controller_name.text != null &&
                    controller_amount.text != null &&
                    controller_interest_rate.text != null &&
                    date_time != null &&
                    phoneNumberController.text.length == 10) {
                  Database_Barrower.write_data(BarrowedData(
                      0,
                      controller_name.text,
                      double.parse(controller_interest_rate.text),
                      double.parse(controller_amount.text),
                      date_time,
                      Brain.interest_calculator(
                          date_time,
                          double.parse(controller_amount.text),
                          double.parse(controller_interest_rate.text)),
                      (double.parse(controller_amount.text) +
                          Brain.interest_calculator(
                              date_time,
                              double.parse(controller_amount.text),
                              double.parse(controller_interest_rate.text))),
                      0,
                      phoneNumberController.text));
                }

                list_adder();

                Navigator.pop(context);

                controller_interest_rate.clear();
                controller_amount.clear();
                controller_name.clear();
                phoneNumberController.clear();
                date_select = "Select Date";
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Submit"),
                  )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all()),
                ),
              ),
            )
          ],
        ),
      );
    }),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
  );
}

Widget Text_Field_Details(
    TextEditingController contr, String text_, bool is_number) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
        keyboardType: is_number ? TextInputType.number : TextInputType.text,
        controller: contr,
        decoration: InputDecoration(
          labelText: text_,
          labelStyle: TextStyle(color: Colors.black),
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

Widget list_view_items(
    List _barrowers_list, BuildContext context, Function func) {
  return ListView.builder(
    itemCount: _barrowers_list.length,
    itemBuilder: (BuildContext context, int index) {
      return Stack(
        children: [
          List_Widget(
              mWidth: MediaQuery.of(context).size.width,
              mHeight: MediaQuery.of(context).size.height,
              name: _barrowers_list[index].name,
              amount: _barrowers_list[index].amount,
              interest_rate: _barrowers_list[index].interest_rate,
              total_amount: _barrowers_list[index].total_amount,
              interest_amount: _barrowers_list[index].interest_amount,
              amount_paid_back: _barrowers_list[index].amount_paid_back,
              date: _barrowers_list[index].date,
              phoneNumber: _barrowers_list[index].phoneNumber),
          Positioned(
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
                          Text("Do you want to Delete ?"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Yes"),
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                onTap: () {
                                  Database_Barrower.delete_database_item(
                                      _barrowers_list[index].id);
                                  func();
                                  Navigator.pop(context);
                                },
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.09,
                              ),
                              GestureDetector(
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("No"),
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(5)),
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.delete),
              ),
            ),
            right: MediaQuery.of(context).size.width * 0.05,
            height: MediaQuery.of(context).size.height * 0.08,
          ),
        ],
      );
    },
  );
}

class List_Widget extends StatefulWidget {
  double mHeight = 0.0;
  double mWidth = 0.0;
  String name = "";
  double amount = 0.0;
  var interest_rate = 0.0;
  double amount_paid_back = 0.0;
  double interest_amount = 0.0;
  double total_amount = 0.0;
  String phoneNumber;
  DateTime date;
  List_Widget(
      {required this.mWidth,
      required this.mHeight,
      required this.name,
      required this.amount,
      required this.interest_rate,
      required this.total_amount,
      required this.interest_amount,
      required this.amount_paid_back,
      required this.date,
      required this.phoneNumber,
      Key? key})
      : super(key: key);

  @override
  State<List_Widget> createState() => _List_WidgetState();
}

class _List_WidgetState extends State<List_Widget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: widget.mWidth * 0.95,
        height: widget.mHeight * 0.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black, width: 2)),
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name : ${widget.name}"),
              Text("Amount : ${widget.amount}"),
              Text("Interest Rate : ${widget.interest_rate}"),
              Text("Date : ${widget.date}"),
              Text("Amount Paid : ${widget.amount_paid_back}"),
              Text(
                  "Interest Amount : ${widget.interest_amount.toStringAsFixed(2)}"),
              Text("Total Amount : ${widget.total_amount.toStringAsFixed(2)}"),
              Text("Phone Number : ${widget.phoneNumber}")
            ],
          ),
        ),
      ),
    );
  }
}
*/