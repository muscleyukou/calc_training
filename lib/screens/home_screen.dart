import 'package:calctraining/screens/test_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DropdownMenuItem<int>> _numberList = List();
  int _numberOfQuestion = 0;

  @override
  void initState() {
    super.initState();
    numberlist();
    _numberOfQuestion = _numberList[0].value;
  }

  void numberlist() {
    _numberList
      ..add(DropdownMenuItem(
        value: 10,
        child: Text(10.toString()),
      ))
      ..add(DropdownMenuItem(
        value: 20,
        child: Text(20.toString()),
      ))
      ..add(DropdownMenuItem(
        value: 30,
        child: Text(30.toString()),
      ));
  }

  @override
  Widget build(BuildContext context) {
    //論理ピクセルの習得方法
    /* var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    print("横幅のピクセル:$screenHeight");
    print("縦幅のピクセル:$screenWidth");*/

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset("assets/images/image_title.png"),
              const SizedBox(
                height: 16.0,
              ),
              const Text("問題数を選択して「スタート」ボタンを押してください"),
              const SizedBox(
                height: 70.0,
              ),
              DropdownButton(
                items: _numberList,
                value: _numberOfQuestion,
                onChanged: changeDropDownItem,
              ),
              //todo プルダウン選択肢
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(bottom: 12.0),
                  child: RaisedButton.icon(
                    onPressed: () => startTestScreen(context),
                    //todo
                    label: const Text('スタート'),
                    icon: Icon(Icons.skip_next),
                    color: Colors.brown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  void changeDropDownItem(int value) {
    setState(() {
      _numberOfQuestion = value;
    });
  }

  startTestScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TestScreen(
                  numberOfQuestions: _numberOfQuestion,
                )));
  }
}
