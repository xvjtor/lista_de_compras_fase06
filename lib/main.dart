import 'package:app_lista_de_compras/pages/listas_home_page.dart';
import 'package:app_lista_de_compras/store/theme_store.dart';
import 'package:app_lista_de_compras/themes/themes.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerSingleton<ThemeStore>(ThemeStore());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: GetIt.I.get<ThemeStore>().themeMode,
      builder: (_, themeMode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Lista de Compras',
          themeMode: themeMode,
          theme: lightTheme(),
          darkTheme: darkTheme(),
          home: const ListasHomepage(),
        );
      },
    );
  }
}
