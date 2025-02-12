import 'package:url_launcher/url_launcher.dart';

Future<void> launchCaller(String tel) async {
  final Uri url = Uri(scheme: 'tel', path: tel);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> launchWeb(String path) async {
  final Uri uri = Uri.parse(path);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $uri';
  }
}

// Future<void> launchMap(String lat, String long) async {
//   final path = Constant.googleMap
//       .replaceAll('@latitude', lat)
//       .replaceAll('@longitude', long);
//   final Uri uri = Uri.parse(path);
//   if (await canLaunchUrl(uri)) {
//     await launchUrl(uri);
//   } else {
//     throw 'Could not launch $uri';
//   }
// }
