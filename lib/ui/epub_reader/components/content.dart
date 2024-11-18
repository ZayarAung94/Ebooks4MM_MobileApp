import 'package:flutter/material.dart';

class TableOfContents extends StatelessWidget {
  final List<String> table;
  const TableOfContents({super.key, required this.table});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView.builder(
          itemCount: table.length,
          itemBuilder: (context, index) {
            return Text(table[index]);
          },
        ),
      ),
    );
  }
}
