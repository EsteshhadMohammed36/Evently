import 'package:event_planning/auth/screens/login_screen.dart';
import 'package:event_planning/auth/screens/register_screen.dart';
import 'package:event_planning/create_event.dart';
import 'package:event_planning/home_screen.dart';
import 'package:event_planning/providers/events_provider.dart';
import 'package:event_planning/providers/l10n_provider.dart';
import 'package:event_planning/providers/theming_provider.dart';
import 'package:event_planning/providers/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => EventsProvider()..getEvents()),
    ChangeNotifierProvider(create: (_) => UserProvider()),
    ChangeNotifierProvider(
      create: (context) => ThemingProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => L10nProvider(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  late ThemingProvider themingProvider;
  late L10nProvider l10nProvider;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    themingProvider = Provider.of<ThemingProvider>(context);
    l10nProvider = Provider.of<L10nProvider>(context);
    initSharedPrefs();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        CreateEvent.routeName: (context) => CreateEvent(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: LoginScreen.routeName,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themingProvider.theme,
      locale: Locale(l10nProvider.languageCode),
    );
  }

  Future<void> initSharedPrefs() async {
    //1- create sharedPrefs Object
    final prefs = await SharedPreferences.getInstance();
    //2- get values (which is set in providers) in variables
    //language
    String? language = prefs.getString("language");
    //3- apply chose language in app by provider
    if (language != null) l10nProvider.changeLanguage(language);
    //theme mode
    bool? isDark = prefs.getBool("isDark");
    //3- apply chosen theme in app by provider
    if (isDark == true)
      themingProvider.changeTheme(ThemeMode.dark);
    else if (isDark == false) themingProvider.changeTheme(ThemeMode.light);
  }
}
