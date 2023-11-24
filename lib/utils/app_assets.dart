class AppAssets {
  AppAssets._();

  /// Common path for json
  static String jsonPath(String fileName) {
    return "assets/json/$fileName.json";
  }

  /// common path with png image
  static String imagePathWithPng(String fileName) {
    return "assets/images/$fileName.png";
  }

  /// common path with jpg image
  static String imagePathWithJpg(String fileName) {
    return "assets/images/$fileName.jpg";
  }

  /// common path with jpeg image
  static String imagePathWithJpeg(String fileName) {
    return "assets/images/$fileName.jpeg";
  }

  /// All json file
  static String get splashJson => jsonPath("splash");
}
