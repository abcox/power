import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

const MaterialColor theme = MaterialColor(
    0xFFF0000, const <int, Color>{50: const Color(0xFFFF0000)}); // #BC197B

const primaryColorRgb = {'r': 188, 'g': 125, 'b': 123};

Map<int, Color> color = {
  50: Color.fromRGBO(
      primaryColorRgb['r'], primaryColorRgb['g'], primaryColorRgb['b'], .1),
  100: Color.fromRGBO(
      primaryColorRgb['r'], primaryColorRgb['g'], primaryColorRgb['b'], .2),
  200: Color.fromRGBO(
      primaryColorRgb['r'], primaryColorRgb['g'], primaryColorRgb['b'], .3),
  300: Color.fromRGBO(
      primaryColorRgb['r'], primaryColorRgb['g'], primaryColorRgb['b'], .4),
  400: Color.fromRGBO(
      primaryColorRgb['r'], primaryColorRgb['g'], primaryColorRgb['b'], .5),
  500: Color.fromRGBO(
      primaryColorRgb['r'], primaryColorRgb['g'], primaryColorRgb['b'], .6),
  600: Color.fromRGBO(
      primaryColorRgb['r'], primaryColorRgb['g'], primaryColorRgb['b'], .7),
  700: Color.fromRGBO(
      primaryColorRgb['r'], primaryColorRgb['g'], primaryColorRgb['b'], .8),
  800: Color.fromRGBO(
      primaryColorRgb['r'], primaryColorRgb['g'], primaryColorRgb['b'], .9),
  900: Color.fromRGBO(
      primaryColorRgb['r'], primaryColorRgb['g'], primaryColorRgb['b'], 1),
};

MaterialColor colorCustom = MaterialColor(0xFFFF0000, color);

ThemeData themeData() {
  return ThemeData(
    // This is the theme of your application.
    //
    // Try running your application with "flutter run". You'll see the
    // application has a blue toolbar. Then, without quitting the app, try
    // changing the primarySwatch below to Colors.green and then invoke
    // "hot reload" (press "r" in the console where you ran "flutter run",
    // or simply save your changes to "hot reload" in a Flutter IDE).
    // Notice that the counter didn't reset back to zero; the application
    // is not restarted.
    primaryColor: Color(0xFFBC197B),
    //accentColor: Color(0xFFFFCA52),
    accentColor: Color(0xFFBC197B),
    //primarySwatch: colorCustom, // Colors.purple,
    // This makes the visual density adapt to the platform that you run
    // the app on. For desktop platforms, the controls will be smaller and
    // closer together (more dense) than on mobile platforms.
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Power App',
      theme: themeData(),
      home: MyHomePage(title: 'Powerful Life'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

bodyContent2(int counter) {
  return Center(
    // Center is a layout widget. It takes a single child and positions it
    // in the middle of the parent.
    child: Column(
      // Column is also a layout widget. It takes a list of children and
      // arranges them vertically. By default, it sizes itself to fit its
      // children horizontally, and tries to be as tall as its parent.
      //
      // Invoke "debug painting" (press "p" in the console, choose the
      // "Toggle Debug Paint" action from the Flutter Inspector in Android
      // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
      // to see the wireframe for each widget.
      //
      // Column has various properties to control how it sizes itself and
      // how it positions its children. Here we use mainAxisAlignment to
      // center the children vertically; the main axis here is the vertical
      // axis because Columns are vertical (the cross axis would be
      // horizontal).
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'You have pushed the button this many times:',
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        ),
        Text(
          '$counter',
          //style: Theme.of(context).textTheme.subtitle1,
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 50),
        ),
      ],
    ),
  );
}

const getRandomImage =
    NetworkImage("https://picsum.photos/seed/picsum/200/300");

IconData getIconDataFromName(String name) {
  switch (name) {
    case 'video':
      {
        return Icons.ondemand_video_rounded;
      }
      break;
    case 'audio':
      {
        return Icons.headset_rounded;
      }
      break;
    default:
      {
        return null;
      }
  }
}

getItemContent(Course course) {
  return Container(
      padding: const EdgeInsets.only(bottom: 8),
      child: Card(
          elevation: 6,
          margin: EdgeInsets.all(1),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Stack(children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.transparent, Colors.black87])
                          .createShader(bounds);
                    },
                    blendMode: BlendMode.darken,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                            //fit: BoxFit.fill,
                            fit: BoxFit.cover,
                            image: NetworkImage(course.imageUrl.toString())
                            // AssetImage(
                            //   'images/bg.jpg',
                            // ),
                            // colorFilter: ColorFilter.mode(
                            //     Colors.black.withOpacity(0.2),
                            //     BlendMode.colorBurn)
                            ),
                      ),
                      height: 250.0,
                    ),
                    // Container(
                    //     height: 250.0,
                    //     decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         gradient: LinearGradient(
                    //             begin: FractionalOffset.topCenter,
                    //             end: FractionalOffset.bottomCenter,
                    //             colors: [
                    //               Colors.grey.withOpacity(0.0),
                    //               Colors.black,
                    //             ],
                    //             stops: [
                    //               0.0,
                    //               1.0
                    //             ])),)
                  )),
              Container(
                  height: 150.0,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(12),
                  child: Text(course.title.toString(),
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70))),
              Container(
                  height: 250.0,
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only(bottom: 100, left: 12),
                  child: Text(course.subtitle.toString(),
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70))),
              Container(
                  height: 250.0,
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only(bottom: 20, left: 12),
                  child: Text(course.category.toString(),
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70))),
              //TODO: make this a container of listview horizontal...
              Container(
                  height: 250.0,
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.only(bottom: 20, right: 22),
                  child: Icon(
                      getIconDataFromName(course.contentType.toString()),
                      color: Colors.grey))
            ]),
          )));
}

bodyContent(Map<int, Course> courses) {
  return ListView.builder(
      itemCount: courses.length, // the length
      itemBuilder: (context, index) {
        return getItemContent(courses[index]);
      });
}

class Course {
  Course(
      //this.title, this.subtitle, this.category, this.imageUrl, iconList): this.iconList = iconList ?? [];
      {this.title,
      this.subtitle,
      this.category,
      this.imageUrl,
      this.contentType}); // headphones_rounded
  String title;
  String subtitle;
  String category;
  String imageUrl;
  String contentType;
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Map<int, Course> courses = {
    0: Course(
        title: 'ULTIMATE RELATIONSHIP PROGRAM',
        subtitle: '10 Days to Creating Lasting & Impactful Changes',
        category: 'Love & Relationships',
        imageUrl:
            'https://i.picsum.photos/id/829/600/600.jpg?hmac=amy-si8BWgYIH9_5bDlpD5qZJX4J8zS8zEVVQf8UIdk',
        contentType: 'video'),
    1: Course(
        title: 'PERSONAL POWER',
        subtitle: '30-Day Program for Unlimited Success',
        category: 'Peak Performance',
        imageUrl:
            'https://i.picsum.photos/id/741/600/600.jpg?hmac=FYRuIvSQgBxp5ufoHYijqwyq-GRGjdQSv77hUCDzr7A',
        contentType: 'audio'),
    2: Course(
        title: 'MASTERING INFLUENCE',
        subtitle: '10 Steps to Master the Art of Enrolment',
        category: 'Career & Business',
        imageUrl:
            'https://i.picsum.photos/id/198/600/600.jpg?hmac=uAmvWstEh6h79N_qIv9RJfvw0ambrwpA7B8HrnEX9nY',
        contentType: 'audio'),
    3: Course(
        title: 'CREATING LASTING CHANGE',
        subtitle: 'Learn the Strategies to...',
        category: 'Leadership',
        imageUrl:
            'https://i.picsum.photos/id/865/600/600.jpg?hmac=w9KyvU7YzV3DZKeLsR5s3SssJnJQa-DGsFvHR3ZIBfs',
        contentType: 'audio'),
    4: Course(
        title: 'ULTIMATE EDGE',
        subtitle: '10 Days to Creating Lasting & Impactful Changes',
        category: 'Relationships',
        imageUrl: 'https://i.picsum.photos/600',
        contentType: 'video'),
  };

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
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: ActionChip(
                    // avatar: CircleAvatar(
                    //   backgroundColor: Colors.grey.shade800,
                    //   child: const Text('AB'),
                    // ),
                    backgroundColor: themeData().accentColor,
                    label: const Text('Sign In'),
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                    onPressed: () {
                      print(
                          'If you stand for nothing, Burr, what\'ll you fall for?');
                    })),
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.refresh),
                )),
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.settings),
                )),
          ],
          backgroundColor: Colors.black87),
      body: bodyContent(courses),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
      backgroundColor: Colors.black87,
    );
  }
}
