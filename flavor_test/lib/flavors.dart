enum Flavor {
  prod,
  dev,
}

class Config {
  static late Flavor appFlavor;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'DEV VERSION';
      case Flavor.prod:
        return 'PROD VERSION';
      default:
        return 'ERROR';
    }
  }
}
