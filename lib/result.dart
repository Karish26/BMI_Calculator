import 'package:flutter/material.dart';


class ResultPage extends StatefulWidget {
  const ResultPage({Key? key, required this.result, required this.msg, required this.color}) : super(key: key);
  final String result;
  final String msg;
  final Color color;

  @override
  State<ResultPage> createState() => _ResultPageState();
}


class _ResultPageState extends State<ResultPage> {
  //double result1 = double.parse('result');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text('RESULT',
            style:
            TextStyle(fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.blue),
            ),
            const SizedBox(height: 20),
            Text(widget.result, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.orange)
            ),

            const SizedBox(height: 20),
            Text(widget.msg, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold,color: widget.color)

            ),

          ],
        ),

      ),


    );
  }
}

