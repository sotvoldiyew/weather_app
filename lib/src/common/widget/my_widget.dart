import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
    required this.time,
    required this.temp,
    required this.image,
  });

  final String time;
  final String temp;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Text(time, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.white, fontSize: 18),),
          ),
          SizedBox(
              width: 50,
              child: Image(image: AssetImage(image))),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text("$temp°", style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.white, fontSize: 18),),
          ),
        ],
        ),
      ),
    );
  }
}
