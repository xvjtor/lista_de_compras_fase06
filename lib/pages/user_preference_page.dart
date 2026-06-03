import 'package:app_lista_de_compras/store/theme_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class UserPreference extends StatelessWidget {
  final _store = GetIt.I.get<ThemeStore>();
  UserPreference({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Preferencias do usuário",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Aparência"),

            SizedBox(
              width: 150,
              child: DropdownButton<ThemeMode>(
                value: _store.themeMode.value,
                isExpanded: true,
                underline: const SizedBox(),
                items: [
                  DropdownMenuItem(value: ThemeMode.light, child: Text("Dia")),
                  DropdownMenuItem(value: ThemeMode.dark, child: Text("Noite")),
                  DropdownMenuItem(
                    value: ThemeMode.system,
                    child: Text("Sistema"),
                  ),
                ],
                onChanged: (value) => _store.setThemeMode(value!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
