class ViewConfig {
  String viewTheme;
  String textAlign;
  int fontSize;
  double lineHeight;
  String pageFlipping;

  ViewConfig({
    this.viewTheme = "Dark",
    this.textAlign = "left",
    this.fontSize = 16,
    this.lineHeight = 1.5,
    this.pageFlipping = "Horizontal",
  });
}

class ViewConfigData {
  static int themeIndex = 2;
  static int textAlignIndex = 0;
  static int fontSizeIndex = 2;
  static int lineHeightIndex = 1;
  static int pageFlippingIndex = 1;

  static int lastReadingPage = 0;
}
