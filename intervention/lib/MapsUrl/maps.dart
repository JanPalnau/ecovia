import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();
  String? throwMessage;
  static Future<void> openMap(double latitude, double longitude) async {
    //print(latitude.toString());
    Uri googleUrl = Uri(
        scheme: 'https',
        host: 'google.com',
        path:
            '/maps/search/?api=1&ll=$latitude,$longitude&query=vegan+restaurant');
    if (await canLaunchUrl(googleUrl)) {
      await launchUrl(googleUrl);
    } else {
      'Maps konnte nicht geöffnet werden.';
    }
  }
}
