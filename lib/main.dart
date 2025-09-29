import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(){
  runApp(const MyApplication());
}


class MyApplication extends StatelessWidget{
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: HomeActivity(),
      debugShowCheckedModeBanner: false,
      );
  }
}

class HomeActivity extends StatelessWidget{
  const HomeActivity({super.key});

  myCustomMessage(message, context){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }


  customAlertDialog(context){
      return showDialog(
        context: context,
        builder: (BuildContext context){
          return Expanded(
            child: AlertDialog(
              title: Text('Alert Title'),
              content: Text('Alert Description'),
              actions: [
                TextButton(
                  onPressed: (){
                    myCustomMessage('this is custom alert dialog.', context);
                    Navigator.of(context).pop();
                  },
                  child: Text('Ok'),
                ),
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text('Cancel'))
              ],
            ),
          );
        }
      );
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      foregroundColor: Colors.white
    );

    ButtonStyle customButtonStyle = ElevatedButton.styleFrom(
      minimumSize: Size(double.infinity, 60),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World', style: TextStyle(color: Colors.white),),
        toolbarHeight: 70,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: (){myCustomMessage('This is search', context);}, icon: Icon(Icons.search, color: Colors.white,))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white,),
        onPressed: (){
          myCustomMessage('this is floating button', context);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Contact'
          ),
        ],
        onTap: (int index){
          if(index == 0){
            myCustomMessage('This is home', context);
          }else if(index == 1){
            myCustomMessage('This is contact', context);
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                accountEmail: Text('rahat1470.com@gmail.com', style: TextStyle(color: Colors.white),),
                accountName: Text('Rahat Hossain', style: TextStyle(color: Colors.white),),
                decoration: BoxDecoration(
                  color: Colors.blue
                ),
              ),
            ),
            ListTile(leading: Icon(Icons.home),title: Text('Home'),onTap: (){
              myCustomMessage('This is home menu', context);
            },)
            
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(5), child: TextField(decoration: InputDecoration(label: Text('Enter your name.'),
          border: OutlineInputBorder()
          ),)),
          Padding(padding: EdgeInsets.all(5), child: TextField(decoration: InputDecoration(label: Text('Enter Email Address.'),
          border: OutlineInputBorder()
          ),)),
          Padding(padding: EdgeInsets.all(5), child: TextField(decoration: InputDecoration(label: Text('Enter Password.'),
          border: OutlineInputBorder()
          ),)),
          Padding(padding: EdgeInsets.all(5), child: ElevatedButton(onPressed: (){myCustomMessage('Form Submited', context);}, style: customButtonStyle, child: Text('Submit'),)),

        ],
      ),
    );
  }
}




