class ScreenWidth {
  final double _widthValue;
  const ScreenWidth(this._widthValue);

  double get value {
    return _widthValue;
  }

  double percent(double percent) {
    return _widthValue * (percent / 100);
  }
}
