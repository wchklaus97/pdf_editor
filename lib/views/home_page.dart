import 'package:flutter/material.dart';
import 'package:pdf_editor/widgets/hover_btn.dart';

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(title,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HoverBtn(
                  text: "Open",
                  onTap: () {},
                  iconData: Icons.file_open,
                  paddinBetTextnIcon: 8,
                  fontSize: 20,
                  iconSize: 40,
                  padding: const EdgeInsets.symmetric(
                      vertical: 28.0, horizontal: 36.0),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
