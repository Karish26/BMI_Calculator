import 'dart:html';
import 'result.dart';
import 'package:flutter/material.dart';

void main() //from here our app will start
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData.dark(),
      home: const LandingPage(),
    );
  }
}
enum Gender {male,female,other}
class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  double _height = 100;
  int _weight = 30;
  int _age = 4;
  Gender gender = Gender.other;
  double bmi=0;


  void incrementA() {
    setState(() {
      _weight = _weight + 1;
    });
  }

  String msg=" ";
  Color color=Colors.white;


  void decrementA() {
    setState(() {
      _weight = _weight - 1;
    });
  }

  void incrementB() {
    setState(() {
      _age = _age + 1;
    });
  }

  void decrementB() {
    setState(() {
      _age = _age - 1;
    });
  }

  void calculateBMI()
  {

    setState(() {
      double heightM =_height/100;
      bmi = _weight/(heightM * heightM);
      print('BMI Value: $bmi');
      if(bmi>25)
        {
          msg="You are overweight !";
          color=Colors.red;
        }
      else
        if(bmi>=17.5 && bmi<=25)
          {
            msg="Good Job!, You are normal !";
            color=Colors.green;
          }
      else
        {
          msg="You are underweight !";
          color=Colors.yellow;
        }

    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Center(
          child: Column(children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: InkWell(
                  onTap: (){setState(() {
                    gender = Gender.male;
                  });},
                  child: Container(
                      height: 100,
                      width: 150,
                      child: Card(
                        color: gender == Gender.male ? Colors.blue : Colors.green,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.male,
                                size: 28,
                              ),
                              Text('Male'),
                            ]),
                      )),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: (){setState(() {
                    gender = Gender.female;
                  });},
                  child: Container(
                      height: 100,
                      width: 150,
                      child: Card(
                        color: gender == Gender.female ? Colors.blue : Colors.pink,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                          Icon(Icons.female),
                          Text('Female'),
                        ]),
                      )),
                ),
              ),
            ]),
        Expanded(
          child: Container(
              height: 50,
              child: Card(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                const Text('Height'),
                Text('${_height.toStringAsFixed(0)} cm'),
                Slider(
                  value: _height,
                  onChanged: (value) {
                    setState(() {
                      _height = value;
                    });
                  },
                  min: 50,
                  max: 300,
                )
              ]))),
        ),

        Row(children: [
          Expanded(
            child: Container(
                height: 200,
                width: 150,
                child: Card(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                  const Text('Weight'),
                  Text('$_weight'),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    ElevatedButton(
                      onPressed: incrementA,
                      style:
                          ElevatedButton.styleFrom(shape: const CircleBorder()),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.add),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: decrementA,
                      style:
                          ElevatedButton.styleFrom(shape: const CircleBorder()),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.remove),
                      ),
                    ),
                  ]),
                ]))),
          ),
          Expanded(
            child: Container(
                height: 200,
                width: 150,
                child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Age'),
                    Text('$_age'),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      ElevatedButton(
                        onPressed: incrementB,
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder()),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.add),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: decrementB,
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder()),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.remove),
                        ),
                      ),
                    ])
                  ],
                ))),
          ),
        ]),
        const Spacer(),
        ElevatedButton(
          onPressed: () {calculateBMI();

            Navigator.push(context, MaterialPageRoute(
               builder: (context)=>  ResultPage(result: bmi.toStringAsFixed(0),msg: msg,color: color),

             )
            );
            },
          child:
              SizedBox(width: double.infinity, child: Center(child: const Text('CALCULATE'))),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16),
            textStyle: const TextStyle(fontSize: 22),
            backgroundColor: Colors.yellow,
          ),
        )
      ])),
    );
  }
}
// const Text('Age'),
//                           const Text('18 yrs'),
//                           Row(
//                               children:[
//                                 ElevatedButton(
//                                   onPressed: incrementA,
//                                   child: Icon(Icons.add),
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: decrementA ,
//                                   child: Icon(Icons.remove),
//                                 ),
//                               ]
//                           )
//const Spacer(),
// ElevatedButton(onPressed: (){},
// child: const Text('CALCULATE'),
// style:ElevatedButton.styleFrom(
// padding: const EdgeInsets.all(16),
// textStyle: const TextStyle(fontSize: 22),
// backgroundColor: Colors.yellow,
// )
// )
