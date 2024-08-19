import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/domain/service/navigate_service.dart';
import 'package:bst_staff_mobile/main.dart';
import 'package:bst_staff_mobile/presentation/home/home-screen.dart';
import 'package:bst_staff_mobile/presentation/layout/layout-screen.dart';
import 'package:bst_staff_mobile/presentation/login/login-screen.dart';
import 'package:bst_staff_mobile/theme/dark-theme.dart';
import 'package:bst_staff_mobile/theme/light-theme.dart';
import 'package:bst_staff_mobile/util/l10n/app-localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final InitialData data;

  const App({required this.data});

  //NavigateService(navigatorKey : navigatorKey);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: data.providers,
      child: Consumer<AppService>(
        builder: (context, service, child) => MaterialApp(
          navigatorKey: getIt<NavigationService>().navigatorKey,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: service.themeMode,
          supportedLocales: const [
            Locale('en', ''),
            Locale('es', ''),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          // home: LayoutScreen(),
          // home: BaseBottomNavigationBar(),
          home: const HomeScreen(),

          initialRoute: '/',
          routes: {
            '/login': (context) => LoginScreen(),
          },
        ),
      ),
    );
  }
}
