import 'package:flutter/material.dart';

class PageA extends StatefulWidget {
  const PageA({Key? key}) : super(key: key);

  @override
  _PageAState createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  //* TR - Önce ki sayfaya geri döndüğümüzde dispose ve deactive metodları çalışır.
  //* EN - When we go back to the previous page, the dispose and deactivate methods work.
  @override
  void deactivate() {
    super.deactivate();
    print('Page A : deactive() running');
  }

  @override
  void dispose() {
    super.dispose();
    print('Page A : dispose() running');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Life Cycle - Page A'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Page A')],
        ),
      ),
    );
  }
}
