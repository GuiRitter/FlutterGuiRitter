import 'dart:io'
    show HttpClient, HttpOverrides, SecurityContext, X509Certificate;

/// https://stackoverflow.com/a/61312927/1781376
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(
    SecurityContext? context,
  ) {
    return super.createHttpClient(
      context,
    )..badCertificateCallback = (
        X509Certificate cert,
        String host,
        int port,
      ) =>
          true;
  }
}
