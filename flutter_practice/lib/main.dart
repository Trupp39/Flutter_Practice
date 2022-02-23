import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Ski Mountain Rater'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class SkiMountain {
  SkiMountain({this.name = "", this.description = "", this.rating = 0.0});

  String name;
  String description;
  double rating;
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<SkiMountain> skiMountains = <SkiMountain>[
    SkiMountain(
        name: "Smugglers Notch",
        description:
            "Located in Cambridge Vermont, this locally owned mountain promises to provide challenge for all abilities. With just over 1000 of skiiable acres, there is more than enough to ski and never get bored.",
        rating: 9.5),
    SkiMountain(
        name: "Jay Peak",
        description:
            "Located in Jay Vermont, this mountain gets the most snow in the east. The average snowfall is 359 inches thanks to the iconic Jay Cloud. If you like tree runs, this is where you go.",
        rating: 8.75),
    SkiMountain(
        name: "Bolton Valley",
        description:
            "Located in Richmond Vermont, this locals skier mountain is a hidden gem. Smaller on paper but much bigger in heart, this mountain always punches above the belt.",
        rating: 8.5),
  ];

  Widget _skiDialogBuilder(BuildContext context, SkiMountain mountain) {
    return SimpleDialog(children: [
      Container(
        width: 80,
        height: 300,
        child: Text(mountain.rating.toString()),
      ),
    ]);
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: skiMountains.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => showDialog(
                context: context,
                builder: (context) =>
                    _skiDialogBuilder(context, skiMountains[index])),
            child: Container(
              height: 50,
              color: Colors.indigoAccent.shade100,
              child: Center(
                  child: Text(
                skiMountains[index].name,
                style: const TextStyle(fontSize: 20.0),
              )),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Colors.white,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
