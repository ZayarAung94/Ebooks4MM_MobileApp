import 'package:flutter/material.dart';

class AppLoading {
  static Widget fullPageLoading() {
    return Container(
      color: Colors.black,
      child: Center(
        child: Container(
          height: 100,
          width: 150,
          color: Colors.black,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(),
                ),
                SizedBox(height: 10),
                Text("Rendering..."),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
