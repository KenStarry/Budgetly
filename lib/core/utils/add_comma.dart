String addComma({required double number}) {
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String formatted = number
      .toStringAsFixed(2)
      .replaceAllMapped(reg, (match) => '${match[1]},');

  return formatted;
}
