import 'package:flutter/material.dart';

class MainInfo extends StatelessWidget {
  final String temperature;
  final String date;
  final String status;

  const MainInfo({
    super.key,
    required this.temperature,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            temperature,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 55),
          ),
        ),
        Center(
          child: Text(
            status,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
        Center(
          child: Text(
            date,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
