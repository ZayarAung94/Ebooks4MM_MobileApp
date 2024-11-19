import 'package:flutter/material.dart';

class TableOfContents extends StatelessWidget {
  final List<String> table;
  const TableOfContents({super.key, required this.table});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: table.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
                    child: Text(table[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
