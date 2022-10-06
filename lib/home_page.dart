import 'package:flutter/material.dart';
import 'package:tip_calculator/config.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _billController;
  late TextEditingController _numPeopleController;
  late TextEditingController _customTipController;

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
  bool _selectedCustomTip = false;

  bool _activeResetButton = false;

  void _calculate(tipPercentage) {
    if (_billController.text == "" || _numPeopleController.text == "") {
      setState(() {
        _totTip = 0.00;
        _tot = 0.00;
        _tipPerPerson = 0.00;
        _totPerPerson = 0.00;
      });
    } else {
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
  }

  @override
  void initState() {
    super.initState();
    _billController = TextEditingController();
    _numPeopleController = TextEditingController();
    _customTipController = TextEditingController();
    _numPeopleController.text = "1";
  }

  @override
  void dispose() {
    _billController.dispose();
    _numPeopleController.dispose();
    _customTipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: themeColor5,
        title: Center(
            child: Text(
          widget.title,
          style: const TextStyle(color: themeTextColor),
        )),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Card(
              elevation: 5,
              color: themeColor5.withOpacity(0.9),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: const TextStyle(color: themeTextColor),
                        controller: _billController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: themeColor5,
                          hintText: 'Enter bill amount',
                          hintStyle:
                              TextStyle(color: themeTextColor.withOpacity(0.7)),
                          prefixIcon: const Icon(
                            Icons.attach_money,
                            color: themeTextColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: themeColor3,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: themeColor4.withOpacity(0.3),
                            ),
                          ),
                        ),
                        onChanged: (string) {
                          if (_selectedCustomTip) {
                            _calculate(
                                double.parse(_customTipController.text) / 100);
                          } else if (_selectedButton10) {
                            _calculate(0.10);
                          } else if (_selectedButton15) {
                            _calculate(0.15);
                          } else if (_selectedButton18) {
                            _calculate(0.18);
                          } else if (_selectedButton20) {
                            _calculate(0.20);
                          } else if (_selectedButton22) {
                            _calculate(0.22);
                          } else if (_selectedButton25) {
                            _calculate(0.25);
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NumberInputWithIncrementDecrement(
                        onIncrement: (num) {
                          setState(() {
                            if (_selectedButton10) _calculate(0.10);
                            if (_selectedButton15) _calculate(0.15);
                            if (_selectedButton18) _calculate(0.18);
                            if (_selectedButton20) _calculate(0.20);
                            if (_selectedButton22) _calculate(0.22);
                            if (_selectedButton25) _calculate(0.25);
                            if (_selectedCustomTip) {
                              _calculate(
                                  double.parse(_customTipController.text) /
                                      100);
                            }
                          });
                        },
                        onDecrement: (num) {
                          setState(() {
                            if (_selectedButton10) _calculate(0.10);
                            if (_selectedButton15) _calculate(0.15);
                            if (_selectedButton18) _calculate(0.18);
                            if (_selectedButton20) _calculate(0.20);
                            if (_selectedButton22) _calculate(0.22);
                            if (_selectedButton25) _calculate(0.25);
                            if (_selectedCustomTip) {
                              _calculate(
                                  double.parse(_customTipController.text) /
                                      100);
                            }
                          });
                        },
                        min: 1,
                        style: const TextStyle(color: themeTextColor),
                        textAlign: TextAlign.start,
                        controller: _numPeopleController,
                        incDecBgColor: themeColor1,
                        buttonArrangement: ButtonArrangement.rightEnd,
                        initialValue: 1,
                        numberFieldDecoration: InputDecoration(
                          filled: true,
                          fillColor: themeColor5,
                          hintText: 'Number of people to split the bill',
                          hintStyle:
                              TextStyle(color: themeTextColor.withOpacity(0.7)),
                          prefixIcon: const Icon(
                            Icons.people,
                            color: themeTextColor,
                          ),
                          border: InputBorder.none,
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: themeColor3,
                            ),
                          ),
                        ),
                        widgetContainerDecoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                            color: themeColor4.withOpacity(0.5),
                          ),
                        ),
                        incIconDecoration: const BoxDecoration(
                          color: themeColor1,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                          ),
                        ),
                        decIconDecoration: const BoxDecoration(
                          color: themeColor1,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                        separateIcons: true,
                        incIconSize: 22,
                        decIconSize: 22,
                      ),
                    ),
                    /*Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: TextStyle(color: themeTextColor),
                        controller: _numPeopleController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: themeColor5,
                          hintText: 'Number of people to split the bill',
                          hintStyle:
                              TextStyle(color: themeTextColor.withOpacity(0.7)),
                          prefixIcon: Icon(
                            Icons.people,
                            color: themeTextColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: themeColor3,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: themeColor4.withOpacity(0.3),
                            ),
                          ),
                        ),
                      ),
                    ),*/
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    if (_billController.text.isNotEmpty) {
                                      _activeResetButton = true;
                                      _selectedButton10 = !_selectedButton10;
                                      _selectedButton10
                                          ? _calculate(0.10)
                                          : _calculate(0);
                                      _selectedButton15 = false;
                                      _selectedButton18 = false;
                                      _selectedButton20 = false;
                                      _selectedButton22 = false;
                                      _selectedButton25 = false;
                                      _selectedCustomTip = false;
                                      _customTipController.clear();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: _selectedButton10
                                          ? themeColor3
                                          : themeColor1),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('10%',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: themeColor5)),
                                  )),
                              ElevatedButton(
                                  onPressed: () {
                                    if (_billController.text.isNotEmpty) {
                                      _activeResetButton = true;
                                      _selectedButton15 = !_selectedButton15;
                                      _selectedButton15
                                          ? _calculate(0.15)
                                          : _calculate(0);
                                      _selectedButton10 = false;
                                      _selectedButton18 = false;
                                      _selectedButton20 = false;
                                      _selectedButton22 = false;
                                      _selectedButton25 = false;
                                      _selectedCustomTip = false;
                                      _customTipController.clear();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: _selectedButton15
                                          ? themeColor3
                                          : themeColor1),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('15%',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: themeColor5)),
                                  )),
                              ElevatedButton(
                                  onPressed: () {
                                    if (_billController.text.isNotEmpty) {
                                      _activeResetButton = true;
                                      _selectedButton18 = !_selectedButton18;
                                      _selectedButton18
                                          ? _calculate(0.18)
                                          : _calculate(0);
                                      _selectedButton15 = false;
                                      _selectedButton10 = false;
                                      _selectedButton20 = false;
                                      _selectedButton22 = false;
                                      _selectedButton25 = false;
                                      _selectedCustomTip = false;
                                      _customTipController.clear();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: _selectedButton18
                                          ? themeColor3
                                          : themeColor1),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('18%',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: themeColor5)),
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
                                    if (_billController.text.isNotEmpty) {
                                      _activeResetButton = true;
                                      _selectedButton20 = !_selectedButton20;
                                      _selectedButton20
                                          ? _calculate(0.20)
                                          : _calculate(0);
                                      _selectedButton15 = false;
                                      _selectedButton18 = false;
                                      _selectedButton10 = false;
                                      _selectedButton22 = false;
                                      _selectedButton25 = false;
                                      _selectedCustomTip = false;
                                      _customTipController.clear();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: _selectedButton20
                                          ? themeColor3
                                          : themeColor1),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('20%',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: themeColor5)),
                                  )),
                              ElevatedButton(
                                  onPressed: () {
                                    if (_billController.text.isNotEmpty) {
                                      _activeResetButton = true;
                                      _selectedButton22 = !_selectedButton22;
                                      _selectedButton22
                                          ? _calculate(0.22)
                                          : _calculate(0);
                                      _selectedButton15 = false;
                                      _selectedButton18 = false;
                                      _selectedButton20 = false;
                                      _selectedButton10 = false;
                                      _selectedButton25 = false;
                                      _selectedCustomTip = false;
                                      _customTipController.clear();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: _selectedButton22
                                          ? themeColor3
                                          : themeColor1),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('22%',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: themeColor5)),
                                  )),
                              ElevatedButton(
                                  onPressed: () {
                                    if (_billController.text.isNotEmpty) {
                                      _activeResetButton = true;
                                      _selectedButton25 = !_selectedButton25;
                                      _selectedButton25
                                          ? _calculate(0.25)
                                          : _calculate(0);
                                      _selectedButton15 = false;
                                      _selectedButton18 = false;
                                      _selectedButton20 = false;
                                      _selectedButton22 = false;
                                      _selectedButton10 = false;
                                      _selectedCustomTip = false;
                                      _customTipController.clear();
                                    }
                                    print(
                                        "_billController: ${_billController.value}");
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: _selectedButton25
                                          ? themeColor3
                                          : themeColor1),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      '25%',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: themeColor5),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: const TextStyle(
                                color: themeColor5,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            controller: _customTipController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: _selectedCustomTip
                                  ? themeColor3
                                  : themeColor1,
                              hintText: 'Custom tip',
                              hintStyle: TextStyle(
                                  color: themeColor5.withOpacity(0.8),
                                  fontWeight: FontWeight.normal),
                              prefixIcon: const Icon(
                                Icons.percent_sharp,
                                color: themeColor5,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: themeColor3,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: themeColor4.withOpacity(0.3),
                                ),
                              ),
                            ),
                            onChanged: (string) {
                              if (_customTipController.text.isNotEmpty) {
                                setState(() {
                                  _calculate(double.parse(string) / 100);
                                  _activeResetButton = true;
                                  _selectedCustomTip = true;
                                  _selectedButton10 = false;
                                  _selectedButton15 = false;
                                  _selectedButton18 = false;
                                  _selectedButton20 = false;
                                  _selectedButton22 = false;
                                  _selectedButton25 = false;
                                });
                              } else {
                                setState(() {
                                  _activeResetButton = false;
                                  _selectedCustomTip = false;
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Card(
                        color: themeColor5,
                        elevation: 5,
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
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
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 16)),
                                      Text(
                                        _tipPerPerson.toStringAsFixed(2),
                                        style: const TextStyle(
                                            color: themeTextColor,
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
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 16)),
                                      Text(
                                        _totPerPerson.toStringAsFixed(2),
                                        style: const TextStyle(
                                            color: themeTextColor,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  color: Colors.white38,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Total tip',
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 16)),
                                      Text(
                                        _totTip.toStringAsFixed(2),
                                        style: const TextStyle(
                                            color: themeTextColor,
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
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 16)),
                                      Text(
                                        _tot.toStringAsFixed(2),
                                        style: const TextStyle(
                                            color: themeTextColor,
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
                            backgroundColor:
                                _activeResetButton ? themeColor3 : themeColor1,
                          ),
                          onPressed: () {
                            setState(() {
                              _billController.clear();
                              _numPeopleController.clear();
                              _customTipController.clear();
                              _numPeopleController.text = "1";
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
                              _selectedCustomTip = false;
                              _activeResetButton = false;
                            });
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16),
                            child: Text('Reset',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: themeColor5)),
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
