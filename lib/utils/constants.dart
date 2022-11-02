import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Constants {
  static const String DB_NAME = "app.db";
  static const String APP_NAME = "AptCoder";
  static const String AUTHORIZATION = "Authorization";

  static const TEMP_NETWORK_URL =
      "https://images.unsplash.com/photo-1604426633861-11b2faead63c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1900&q=80";

  static const ERROR_INTERNET = "Your internet is not working it seems";
  static const String ERROR_NO_INTERNET = "No internet available";
  static const String ERROR_UNKNOWN = "Unknown error occurred";
  static const String ERROR_TYPE_SERVER = "Server Error";
  static const String ERROR_TYPE_TIMEOUT = "Time Out";

  static const String REMOTE_HELP_URL = "help_url";
  static const String REMOTE_HELP_APPBAR_COLOR = "help_appbar_color";
  static const String REMOTE_HELP_APPBAR_FONT_COLOR = "help_appbar_font_color";
  static const String DEBUG_IOS_BUILD = "debug_ios_build";
  static const String LIVE_IOS_BUILD = "live_ios_build";
  static const String LIVE_ANDROID_BUILD = "live_android_build";
  static const String DEBUG_ANDROID_BUILD = "debug_android_build";
  static const String REMOTE_INTRO_MESSAGE_DURATION = "intro_message_duration";
  static const String REMOTE_DEBUG_ACTIVITY_ID = "debug_plus_event";
  static const String REMOTE_LIVE_ACTIVITY_ID = "live_plus_event";
  static const String REMOTE_REDEEM_URL = "reedem_link";
  static const String PLATFORM_ANDROID = "android";
  static const String PLATFORM_IOS = "ios";

  static const String BASE_URL = "http://13.233.152.108:8080";

  static const String FILE_TYPE_VIDEO = "video";
  static const String FILE_TYPE_IMAGE = "image";

  static Uri? LAST_STORED_URI;
  static bool INITIAL_URI_HANDLED = false;

  static const String loginWithMobile = "MOBILE";
  static const String loginWithGoogle = "GOOGLE";

  static const String loginUserTypeStudent = "STUDENT";

  static const String endPointLoginUser = "/login";
  static const String endPointVerifyOTP = "/login/validateOtp";
  static const String endPointStudentOnBoard = "/student/onboard";
}

class DBConstants {
  static const String TABLE_USER = "user_table";

  static const String FIELD_ID = "id";
  static const String FIELD_USER_NAME = "username";
  static const String FIELD_NAME = "name";
  static const String FIELD_ROLE = "role";
  static const String FIELD_EMAIL = "email";
  static const String FIELD_MOBILE_NUMBER = "mobile_number";
  static const String FIELD_MOBILE_CODE = "mobile_code";
  static const String FIELD_BIO = "bio";
  static const String FIELD_COUNTRY_CODE = "country_code";
  static const String FIELD_COUNTRY_NAME = "country_name";
  static const String FIELD_GENDER = "gender";
  static const String FIELD_CITY = "city";
  static const String FIELD_STATE = "state";
  static const String FIELD_DOB = "dob";
  static const String FIELD_STATUS = "status";
  static const String FIELD_FOLLOWER_COUNT = "follower_count";
  static const String FIELD_FOLLOWING_COUNT = "following_count";
  static const String FIELD_TOKEN = "token";
  static const String FIELD_ACCOUNT_STATUS = "accountStatus";
}

class AppColors {
  static const Color textColor4B = Color(0xff00234B);
  static const Color textColor = Color(0xff252525);
  static const Color textColor2 = Color(0xff000000);
  static const Color whiteFF = Color(0xffFFFFFF);
  static const Color ButtonEF = Color(0xffEFEFEF);
  static const Color backgroundColorF5 = Color(0xffF5F5F5);
  static const Color backgroundE5 = Color(0xffE5E5E5);
  static const Color circleColor1 = Color(0xfff88a00);
  static const Color circleColor0C = Color(0xfffc940c);
  static const Color circleColor2 = Color(0x66fc940c);
  static const Color indicatorColor5D = Color(0xffFF5D5D);
  static const Color otp = Color(0xffFF0000);
  static const Color textColor25 = Color(0xff252525);
  static const Color textColor4C = Color(0xff4C4C4C);
  static const Color transparent = Colors.transparent;
  static const Color blackColor = Color(0xff000000);
  static const Color progressColor = Color(0xfffc940c);
  static const Color progressLeftColor = Color(0xffc4c4c4);
  static const Color textDesignColor = Color(0xfff4f4f4);
  static const Color gradientColorF3 = Color(0xFFDFE9F3);
  static const Color topicColor0C = Color(0xffFC940C);
}

class ImageConstants {
  static const String introImg1 = "assets/images/intro_img_1.svg";
  static const String introImg2 = "assets/images/intro_img_2.svg";
  static const String introImg3 = "assets/images/intro_img_3.svg";
  static const String icRectLeft = "assets/images/ic_rect_left.svg";
  static const String icButton = "assets/images/ic_button.svg";
  static const String icCircle = "assets/images/circle.png";
  static const String icFlag = "assets/images/flag.png";
  static const String icRight = "assets/images/ic_right.svg";
  static const String icIns = "assets/images/in.svg";
  static const String icLine = "assets/images/line.svg";
  static const String icApple = "assets/images/apple.svg";
  static const String icGoogle = "assets/images/google.svg";
  static const String icBack = "assets/images/back.svg";
  static const String icDropDown = "assets/images/ic_drop_down.svg";
  static const String icDropUp = "assets/images/dropUp.svg";

  static const String icHome = "assets/images/ic_home.svg";
  static const String icCompetition = "assets/images/comp.svg";
  static const String icMenu = "assets/images/menu.svg";
  static const String icLogo = "assets/images/logo.png";
  static const String icProfile = "assets/images/ic_profile.svg";
  static const String icAppBarLogo = "assets/images/ic_appbar_logo.svg";
  static const String icCoin = "assets/images/coin.svg";
  static const String icFilter = "assets/images/filter.svg";
  static const String icImage = "assets/images/computer.png";
  static const String icQuizBig = "assets/images/quizBig.png";
  static const String icDegree = "assets/images/degree.svg";
  static const String icBookmark = "assets/images/bookmark.svg";
  static const String icBookhide = "assets/images/bookhide.svg";
  static const String icHtml = "assets/images/html.svg";
  static const String icNode = "assets/images/nodejs.svg";
  static const String icReact = "assets/images/react.svg";
  static const String icPython = "assets/images/python.svg";
  static const String icGoal = "assets/images/ic_goal.svg";
  static const String icGroup = "assets/images/group.png";
  static const String icLineCross = "assets/images/linecross.svg";
  static const String icLocation = "assets/images/location.svg";
  static const String icTick = "assets/images/tick.svg";
  static const String icProf = "assets/images/profile.png";
  static const String icQuiz = "assets/images/Quiz 4.svg";
  static const String icBack2 = "assets/images/back2.svg";
  static const String icDate = "assets/images/ic_date.svg";
  static const String icProcess = "assets/images/ic_process.svg";
  static const String icLock = "assets/images/lock.svg";
  static const String icPdf = "assets/images/pdf.svg";
  static const String icPlay = "assets/images/play.svg";
  static const String icImg1 = "assets/images/img1.png";
  static const String icImg2 = "assets/images/img2.png";
  static const String icImg3 = "assets/images/img3.png";
  static const String icImg4 = "assets/images/img4.png";
  static const String icImg5 = "assets/images/img5.png";
  static const String icImg6 = "assets/images/img6.png";
  static const String icImg7 = "assets/images/img7.png";
  static const String icCup = "assets/images/cup.png";
  static const String icContest = "assets/images/ic_contest.png";
  static const String icQuizls = "assets/images/ic_quiz.png";
  static const String icQuizchall = "assets/images/quizchall.png";
  static const String icPro = "assets/images/pro2.png";
  static const String icCert = "assets/images/cert_logo.svg";

  static const String icAppLogo = "assets/images/logo-svg.svg";
  static const String icSearchIcon = "assets/images/ic_search.svg";
  static const String icDownload = "assets/images/ic_download.svg";
  static const String icShare = "assets/images/ic_share.svg";
}

class CustomGradient {
  static LinearGradient decorationGradient({
    final List<Color> colors = const [
      AppColors.circleColor0C,
      AppColors.circleColor0C,
    ],
    final FractionalOffset begin = FractionalOffset.topCenter,
    final FractionalOffset end = FractionalOffset.bottomCenter,
    final TileMode tileMode = TileMode.repeated,
    final List<double>? stops,
  }) {
    return LinearGradient(
      colors: colors,
      begin: begin,
      end: end,
      stops: stops,
      tileMode: TileMode.repeated,
    );
  }
}

class CustomDateAndTime {
  static String getFormatDate(
      {required final String format, required final String date}) {
    final finalFormat = format.replaceAll("kk", "hh");
    final formatDateAndTime =
        DateFormat(finalFormat).format(DateTime.parse(date).toLocal());
    return formatDateAndTime;
  }
}
