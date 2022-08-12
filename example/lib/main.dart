import 'package:flutter/material.dart';

import 'package:libndi_bindings/libndi_bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String ndilibVersion = '';

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 25);
    const spacerSmall = SizedBox(height: 10);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Libndi Example'),
        ),
        body: Center(
          child: Column(
            children: [
              spacerSmall,
              Text(
                'NDI Version: $ndilibVersion',
                style: textStyle,
                textAlign: TextAlign.center,
              ),
              spacerSmall,
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ndilibVersion = Libndi.getVersion();
                  });
                },
                child: const Text('Get version'),
              ),
              spacerSmall,
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ndilibVersion = '';
                  });
                },
                child: const Text('Clear version'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
