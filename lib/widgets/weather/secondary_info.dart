import 'package:flutter/material.dart';

class SecondaryInfo extends StatelessWidget {
  final String text;
  final String value;
  final String assetSource;

  const SecondaryInfo({
    super.key,
    required this.text,
    required this.value,
    required this.assetSource,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          assetSource,
          scale: 8,
        ),
        const SizedBox(
          width: 5,
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
