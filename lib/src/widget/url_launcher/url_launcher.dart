import 'package:url_launcher/url_launcher.dart';

Future<void> launchInBrowser(String url) async {
  final Uri _url = Uri.parse(url);
  if (!await launchUrl(_url,mode: LaunchMode.externalApplication,webViewConfiguration: const WebViewConfiguration(enableJavaScript: false))) {
    print('Could not launch $_url');
  }
}