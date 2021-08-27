import 'package:farha_app/user_interface/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Localization/AppLocal.dart';
import 'helper/TextSizes.dart';
import 'helper/data_store.dart';
import 'helper/enums.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dataStore.getLang().then((val) {
    runApp(new MyApp());
  }
  );
}

class MyApp extends StatefulWidget {
  static void changeLang(BuildContext context) {
    context.findAncestorStateOfType<_MyAppState>().changeLang();
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void changeLang() {
    setState(() {});
  }

  ScreenSizes screenSizes = ScreenSizes.medium;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Grandstander',
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('ar'), // Arabic
      ],
      locale: Locale(dataStore.lang),
      home: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 480) {
            screenSizes = ScreenSizes.extraLarge;
          } else if (constraints.maxWidth >= 414) {
            screenSizes = ScreenSizes.large;
          } else if (constraints.maxWidth >= 375) {
            screenSizes = ScreenSizes.medium;
          } else if (constraints.maxWidth >= 360) {
            screenSizes = ScreenSizes.small;
          } else if (constraints.maxWidth >= 320) {
            screenSizes = ScreenSizes.extraSmall;
          } else {
            screenSizes = ScreenSizes.twoExtraSmall;
          }
          TextSizes.init(screenSizes);
          return SplashScreen();
        },
      ),
    );
  }
}
