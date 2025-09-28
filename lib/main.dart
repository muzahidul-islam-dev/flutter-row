import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeActivity(),
      title: 'Rahat Hossain',
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});
  myCustomButton(message, context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rahat Hossain', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        toolbarHeight: 70,
        actions: [
          IconButton(
            onPressed: () {
              myCustomButton('This is Search', context);
            },
            icon: Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Contact'),
        ],
        backgroundColor: Colors.blue,
        fixedColor: Colors.white,
        onTap: (int index) {
          if (index == 0) {
            myCustomButton('This is home button', context);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          myCustomButton('This is floating button', context);
        },
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                accountEmail: Text('rahat1470.com@gmail.com'),
                accountName: Text('Rahat Hossain'),
                decoration: BoxDecoration(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.blue
            ),
            margin: EdgeInsets.fromLTRB(0,10,0,0),
            child: Text('Rahat HOssain'),
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.blue
            ),
            margin: EdgeInsets.fromLTRB(0,10,0,0),
            child: Text('Rahat HOssain'),
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.blue
            ),
            margin: EdgeInsets.fromLTRB(0,10,0,0),
            child: Text('Rahat HOssain'),
          ),
        ],
        spacing: 30,
      )
    );
  }
}
