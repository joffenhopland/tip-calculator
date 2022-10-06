import 'package:flutter/material.dart';
import 'package:tip_calculator/config.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _billController;
  late TextEditingController _numPeopleController;

  double _totTip = 0.00;
  double _tot = 0.00;
  double _tipPerPerson = 0.00;
  double _totPerPerson = 0.00;

  bool _selectedButton10 = false;
  bool _selectedButton15 = false;
  bool _selectedButton18 = false;
  bool _selectedButton20 = false;
  bool _selectedButton22 = false;
  bool _selectedButton25 = false;

  void _calculate(tipPercentage) {
    setState(() {
      _totTip = double.parse(_billController.text) * tipPercentage;
      _tot = double.parse(_billController.text) + _totTip;
      _tipPerPerson = double.parse(_numPeopleController.text) != 0
          ? _totTip / double.parse(_numPeopleController.text)
          : _totTip;
      _totPerPerson = double.parse(_numPeopleController.text) != 0
          ? double.parse(_billController.text) /
                  double.parse(_numPeopleController.text) +
              _tipPerPerson
          : _tot;
    });
  }

  @override
  void initState() {
    super.initState();
    _billController = TextEditingController();
    _numPeopleController = TextEditingController();
  }

  @override
  void dispose() {
    _billController.dispose();
    _numPeopleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: themeColor3,
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(maxWidth: 500),
            child: Card(
              elevation: 5,
              color: themeColor3,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: TextStyle(color: themeColor5),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: themeColor2,
                          hintText: 'Enter bill amount',
                          hintStyle:
                              TextStyle(color: themeColor5.withOpacity(0.7)),
                          prefixIcon: const Icon(
                            Icons.attach_money,
                            color: themeColor5,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        controller: _billController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: TextStyle(color: themeColor5),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: themeColor2,
                          hintText: 'Number of people to split the bill',
                          hintStyle:
                              TextStyle(color: themeColor5.withOpacity(0.7)),
                          prefixIcon: Icon(
                            Icons.people,
                            color: themeColor5,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        controller: _numPeopleController,
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    _selectedButton10 = !_selectedButton10;
                                    _selectedButton10
                                        ? _calculate(0.10)
                                        : _calculate(0);
                                    _selectedButton15 = false;
                                    _selectedButton18 = false;
                                    _selectedButton20 = false;
                                    _selectedButton22 = false;
                                    _selectedButton25 = false;
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: _selectedButton10
                                          ? themeColor2
                                          : themeColor1),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Text('10%', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                  )),
                              ElevatedButton(
                                  onPressed: () {
                                    _selectedButton15 = !_selectedButton15;
                                    _selectedButton15
                                        ? _calculate(0.15)
                                        : _calculate(0);
                                    _selectedButton10 = false;
                                    _selectedButton18 = false;
                                    _selectedButton20 = false;
                                    _selectedButton22 = false;
                                    _selectedButton25 = false;
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: _selectedButton15
                                          ? themeColor2
                                          : themeColor1),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Text('15%', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                  )),
                              ElevatedButton(
                                  onPressed: () {
                                    _selectedButton18 = !_selectedButton18;
                                    _selectedButton18
                                        ? _calculate(0.18)
                                        : _calculate(0);
                                    _selectedButton15 = false;
                                    _selectedButton10 = false;
                                    _selectedButton20 = false;
                                    _selectedButton22 = false;
                                    _selectedButton25 = false;
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: _selectedButton18
                                          ? themeColor2
                                          : themeColor1),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Text('18%', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    _selectedButton20 = !_selectedButton20;
                                    _selectedButton20
                                        ? _calculate(0.20)
                                        : _calculate(0);
                                    _selectedButton15 = false;
                                    _selectedButton18 = false;
                                    _selectedButton10 = false;
                                    _selectedButton22 = false;
                                    _selectedButton25 = false;
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: _selectedButton20
                                          ? themeColor2
                                          : themeColor1),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Text('20%', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                  )),
                              ElevatedButton(
                                  onPressed: () {
                                    _selectedButton22 = !_selectedButton22;
                                    _selectedButton22
                                        ? _calculate(0.22)
                                        : _calculate(0);
                                    _selectedButton15 = false;
                                    _selectedButton18 = false;
                                    _selectedButton20 = false;
                                    _selectedButton10 = false;
                                    _selectedButton25 = false;
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: _selectedButton22
                                          ? themeColor2
                                          : themeColor1),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Text('22%', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                  )),
                              ElevatedButton(
                                  onPressed: () {
                                    _selectedButton25 = !_selectedButton25;
                                    _selectedButton25
                                        ? _calculate(0.25)
                                        : _calculate(0);
                                    _selectedButton15 = false;
                                    _selectedButton18 = false;
                                    _selectedButton20 = false;
                                    _selectedButton22 = false;
                                    _selectedButton10 = false;
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: _selectedButton25
                                          ? themeColor2
                                          : themeColor1),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Text('25%', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Card(
                        color: themeColor2,
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Tip per person',
                                          style:
                                              TextStyle(color: Colors.white)),
                                      Text(
                                        _tipPerPerson.toStringAsFixed(2),
                                        style: TextStyle(
                                            color: Colors.blue.shade50,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Total per person',
                                          style:
                                              TextStyle(color: Colors.white)),
                                      Text(
                                        _totPerPerson.toStringAsFixed(2),
                                        style: TextStyle(
                                            color: Colors.blue.shade50,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Colors.white38,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Total tip',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        _totTip.toStringAsFixed(2),
                                        style: TextStyle(
                                            color: Colors.blue.shade50,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Total bill',
                                          style:
                                              TextStyle(color: Colors.white)),
                                      Text(
                                        _tot.toStringAsFixed(2),
                                        style: TextStyle(
                                            color: Colors.blue.shade50,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: themeColor1,
                          ),
                          onPressed: () {
                            setState(() {
                              _billController.clear();
                              _numPeopleController.clear();
                              _totTip = 0.00;
                              _tot = 0.00;
                              _tipPerPerson = 0.00;
                              _totPerPerson = 0.00;
                              _selectedButton10 = false;
                              _selectedButton15 = false;
                              _selectedButton18 = false;
                              _selectedButton20 = false;
                              _selectedButton22 = false;
                              _selectedButton25 = false;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16),
                            child: const Text('Reset', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
