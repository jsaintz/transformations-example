import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _x = 0.0;
  double _y = 0.0;
  double _z = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfomations Example'),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [const Text('X'), Slider(value: _x, onChanged: (double value) => setState(() => _x = value))],
              ),
              Row(
                children: [const Text('Y'), Slider(value: _y, onChanged: (double value) => setState(() => _y = value))],
              ),
              Row(
                children: [const Text('Z'), Slider(value: _z, onChanged: (double value) => setState(() => _z = value))],
              ),
              Transform(
                transform: Matrix4.skewY(_y),
                child: Transform(
                  transform: Matrix4.skewX(_x),
                  child: Transform(
                    transform: Matrix4.rotationZ(_z),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('hello World'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
