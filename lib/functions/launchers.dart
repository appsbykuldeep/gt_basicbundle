import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

Future<bool> gtOpenUrlfn(String url) async {
  return await launchUrl(
    Uri.parse(url),
    mode: LaunchMode.externalApplication,
  );
}

Future<bool> gtDialNumberfn(String mobile) async {
  mobile = mobile.removeAllWhitespace;
  if (mobile.isEmpty) return false;
  return await launchUrl(
    Uri.parse("tel:$mobile"),
    mode: LaunchMode.externalApplication,
  );
}

Future<bool> gtSendMailWithSub(
  String mailid, {
  String subject = "",
}) async {
  mailid = mailid.removeAllWhitespace;
  if (!mailid.isEmail) return false;
  String url = "mailto:$mailid?subject=$subject";
  return await launchUrl(
    Uri.parse(url),
    mode: LaunchMode.externalApplication,
  );
}
