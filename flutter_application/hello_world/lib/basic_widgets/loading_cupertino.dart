import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyCupertinoLoading extends StatelessWidget {
  const MyCupertinoLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          CupertinoButton(
            child: const Text("Contoh button"),
            onPressed: () {},
          ),
          const CupertinoActivityIndicator(),
        ],
      ),
    );
  }
}