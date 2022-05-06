import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

int selectedIndex = 99;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int WidgetIndex = 0;
  Tween ls = Tween(begin: Size(20, 39), end: Size(30, 49));

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
                margin: EdgeInsets.only(top: height * 0.05),
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                height: height * .9,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Searching_bar(height: height, width: width),
                      SizedBox(height: height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SelectedWdiget(
                              width: width,
                              widgetIndex: 3,
                              fn: () {
                                setState(() {});
                              }),
                          SelectedWdiget(
                              width: width,
                              widgetIndex: 4,
                              fn: () {
                                setState(() {});
                              }),
                          SelectedWdiget(
                              width: width,
                              widgetIndex: 1,
                              fn: () {
                                setState(() {});
                              }),
                        ],
                      ),
                      widgetList(selectedIndex),
                      SizedBox(
                        height: height * .02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SelectedWdiget(
                              width: width, widgetIndex: 7, fn: () {}),
                          SelectedWdiget(
                              width: width, widgetIndex: 2, fn: () {}),
                          SelectedWdiget(
                              width: width, widgetIndex: 1, fn: () {}),
                        ],
                      ),
                    ],
                  ),
                )),
            Positioned(
              bottom: 0,
              child: Container(
                height: height * .12,
                width: width,
                padding: EdgeInsets.symmetric(horizontal: width * 0.09),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 3.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Tags_selector(
                        height: height,
                        title: "Orders",
                      ),
                      Tags_selector(
                        height: height,
                        title: "Buy Again",
                      ),
                      Tags_selector(
                        height: height,
                        title: "Account",
                      ),
                      Tags_selector(
                        height: height,
                        title: "Lists",
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        
          currentIndex: 3,
          selectedItemColor: Colors.blue.shade400,
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 29,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                size: 29,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 29,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
                size: 29,
              ),
              label: '',
            ),
          ]),
    );
  }
}

class Tags_selector extends StatelessWidget {
  const Tags_selector({
    Key? key,
    required this.height,
    required this.title,
  }) : super(key: key);

  final double height;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: .9,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          child: Text(
            title,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

class Searching_bar extends StatelessWidget {
  const Searching_bar({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.07,
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 9),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: const Offset(0.0, 1.0),
            blurRadius: 2.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ],
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Row(
        children: [
          Icon(Icons.search_sharp),
          SizedBox(width: width * 0.02),
          Text(
            'Search',
            style: TextStyle(
              color: Colors.grey,
              fontSize: width * 0.05,
            ),
          ),
          Spacer(),
          Icon(
            Icons.camera_alt,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

Widget widgetList(int index) {
  List<String> ls = List<String>.generate(index, (i) => "item $i");
  if (index == 99) {
    return Container();
  } else {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1.5),
      ),
      child: Column(
        children: ls
            .map((e) => Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: ListTile(
                      leading: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.account_balance,
                            color: Colors.white,
                          )),
                      title: Text(e)),
                ))
            .toList(),
      ),
    );
  }
}

class SelectedWdiget extends StatelessWidget {
  const SelectedWdiget({
    Key? key,
    required this.width,
    required this.widgetIndex,
    required this.fn,
  }) : super(key: key);

  final double width;
  final int widgetIndex;
  final VoidCallback fn;

  @override
  Widget build(BuildContext context) {
    print("selectedIndex = $selectedIndex  WidgetIndex = $widgetIndex");
    return InkWell(
      onTap: () {
        print(selectedIndex);
        if (selectedIndex == widgetIndex) {
          selectedIndex = 99;
        } else {
          selectedIndex = widgetIndex;
        }
        fn();
      },
      child: Container(
        margin: EdgeInsets.only(top: (selectedIndex == widgetIndex) ? 16 : 0),
        width: width * .3,
        height: width * .4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(
                color: (widgetIndex == selectedIndex)
                    ? Colors.blue.shade900
                    : Colors.black,
                width: (widgetIndex == selectedIndex) ? 3 : 1)),
        child: Stack(
          children: [
            Positioned(
                top: 13,
                left: 5,
                child: Text(
                  "Prime",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                )),
            Positioned(
              bottom: -20,
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(55),
                topRight: Radius.circular(55)),
                child: SizedBox(
                  height: width*.3,
                  child: Image(image: AssetImage("assets/hd.jpg"),
                   fit: BoxFit.contain),
                ),
              ),),
          ],
        ),
      ),
    );
  }
}
