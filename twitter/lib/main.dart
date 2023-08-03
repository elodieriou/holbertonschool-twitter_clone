import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/screens/signin_screen.dart';
import 'package:twitter/providers/share_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SharedState sharedState = SharedState();
    return MultiProvider(
      providers: [
        Provider<SharedState>.value(value: sharedState),
      ],
      child: const MaterialApp(
        home: SignIn(),
      ),
    );
  }
}
