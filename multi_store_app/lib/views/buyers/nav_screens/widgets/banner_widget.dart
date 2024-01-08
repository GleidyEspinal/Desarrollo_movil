import 'package:flutter/material.dart';
class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.yellow.shade900,
              borderRadius: BorderRadius.circular(10)
        ),
      child: PageView(
        children: [
          Center(
            child: Text("Page 1"),
          ),
          Center(
            child: Text("Page 2"),
          ),
          Center(
            child: Text("Page 3"),
          )
        ],
      ),
      ),
    );
  }
}
