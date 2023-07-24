import 'package:shopfusion/imports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataManager.instance.initSelf();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopfusion',
      theme: Themes.getTheme(context),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: Constants.getRoutes(context),
    );
  }
}

