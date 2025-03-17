import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'message': 'What is your name ?',
          'name': 'Mahbub',
          'internet_exception': "We're sorry, but we can't \nreach the server right now. \nPlease check your internet \nconnection and try again.",
          'general_exception': "We're unable to process your \nrequest at this moment. \nPlease try again later.",
          'welcome_back': 'Welcome\nBack',
          'login': 'Login',
          'register': 'Register',
          'email_hint': 'Email',
          'enter_email': 'Enter Email',
          'password_hint': 'Password',
          'enter_password': 'Enter Password',
        },
        'bl_BD': {
          'message': 'আপনার নাম কি ?',
          'name': 'মাহবুব  ',
        },
      };
}
