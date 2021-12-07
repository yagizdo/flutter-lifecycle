import 'package:flutter/material.dart';
import 'package:life_cycle/PageA.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  @override
  //* TR - Uygulamayı ilk çalıştırdığımızda initState ve Build metodu çalışır.
  //* EN - When we run the application for the first time, the initState and Build method work.
  void initState() {
    super.initState();
    print('initState() is running');
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    /*  TR - Uygulamayı '<' ile kapattığımızda aşağıda ki 3 metod çalışır. Bu tuş ile uygulamayı kapattığımızda uygulama sanki ilk kez açılıyormuş gibi
    initState ve Build metodları çalışır */
    /*  EN - When we close the application with '<', the following 3 methods work. When we close the application with this button,
    the initState and Build methods run as if the application was opened for the first time. */

    //* TR - Uygulamayı 'o' tuşu ile kapattığımızda inactive ve paused metodları çalışır. Bu tuş ile kapattığımız uygulamayı geri açarsak resumed metodu çalışır.
    //* EN - When we close the application with the 'o' key, the inactive and paused methods work. If we open the application that we closed with this button, the resumed method works.

    //* TR - Uygulamayı 'Kare' tuşu ile kapattığımızda inactive ve paused metodları çalışır. Bu tuş ile kapattığımız uygulamayı geri açarsak resumed metodu çalışır.
    //* EN - When we close the application with the 'Square' key, the inactive and paused methods work. If we open the application that we closed with this button, the resumed method works.
    if (state == AppLifecycleState.inactive) {
      print('inactive() is running');
    }
    if (state == AppLifecycleState.paused) {
      print('paused() is running');
    }
    if (state == AppLifecycleState.resumed) {
      print('resumed() is running');
    }
    if (state == AppLifecycleState.detached) {
      print('detached() is running');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Build() method is running');
    return Scaffold(
      appBar: AppBar(
        title: Text('Life Cycle - Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello World'),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PageA()));
                },
                child: Text('Go Page A'))
          ],
        ),
      ),
    );
  }
}
