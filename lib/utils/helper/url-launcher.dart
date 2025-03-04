
import 'package:url_launcher/url_launcher.dart';





class UrlLauncher {

  // Whatsapp Launcher

  static Future<void> whatsapp(String whatsapp) async{

    await launchUrl (Uri.parse('https://wa.me/$whatsapp'));

  }



  // Phone Call Launcher

  static Future<void> phoneCall (String phoneNumber) async {

    final Uri launchUri = Uri(

        scheme: 'tel',

        path: phoneNumber

    );

    await launchUrl(launchUri);

  }



  // Email Launcher

  static Future<void> email(String email)async{
    final Uri launchUri = Uri(
        scheme:  "mailto",
        path: email
    );
    await launchUrl(launchUri);
  }



  // website Url

  static Future<void> websiteUrl (String website) async {
    await launchUrl(Uri.parse(website));

  }



}