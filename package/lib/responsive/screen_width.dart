class ScreenWidth {
  final double widthValue;
  const ScreenWidth(this.widthValue);

  double get value {
    return widthValue;
  }

  double percent(double percent) {
    return widthValue * (percent / 100);
  }
}
