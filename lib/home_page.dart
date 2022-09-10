import 'package:flutter/material.dart';

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

  void _calculate(tipPercentage) {
    setState(() {
      _totTip = double.parse(_billController.text) * tipPercentage;
      _tot = double.parse(_billController.text) + _totTip;
      _tipPerPerson = double.parse(_numPeopleController.text) != 0
          ? _totTip / double.parse(_numPeopleController.text)
          : _totTip;
      _totPerPerson = double.parse(_numPeopleController.text) != 0 ? double.parse(_billController.text) /
              double.parse(_numPeopleController.text) +
          _tipPerPerson : _tot;
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Card(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Bill amount',
                    icon: Icon(Icons.attach_money),
                  ),
                  controller: _billController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Number of people to split the bill',
                    icon: Icon(Icons.people),
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
                              _calculate(0.10);
                            },
                            child: const Text('10%')),
                        ElevatedButton(
                            onPressed: () {
                              _calculate(0.15);
                            },
                            child: const Text('15%')),
                        ElevatedButton(
                            onPressed: () {
                              _calculate(0.18);
                            },
                            child: const Text('18%')),
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
                              _calculate(0.20);
                            },
                            child: const Text('20%')),
                        ElevatedButton(
                            onPressed: () {
                              _calculate(0.22);
                            },
                            child: const Text('22%')),
                        ElevatedButton(
                            onPressed: () {
                              _calculate(0.25);
                            },
                            child: const Text('25%'))
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Card(
                  color: Colors.blue,
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total tip',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  _totTip.toStringAsFixed(2),
                                  style: TextStyle(
                                      color: Colors.blue.shade50,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Total',
                                    style: TextStyle(color: Colors.white)),
                                Text(
                                  _tot.toStringAsFixed(2),
                                  style: TextStyle(
                                      color: Colors.blue.shade50,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Tip per person',
                                    style: TextStyle(color: Colors.white)),
                                Text(
                                  _tipPerPerson.toStringAsFixed(2),
                                  style: TextStyle(
                                      color: Colors.blue.shade50,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Total per person',
                                    style: TextStyle(color: Colors.white)),
                                Text(
                                  _totPerPerson.toStringAsFixed(2),
                                  style: TextStyle(
                                      color: Colors.blue.shade50,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _billController.clear();
                        _numPeopleController.clear();
                        _totTip = 0.00;
                        _tot = 0.00;
                        _tipPerPerson = 0.00;
                        _totPerPerson = 0.00;
                      });
                    },
                    child: const Text('Reset')),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
