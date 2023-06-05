import 'package:doginfo/presenter/pages.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  final nameVN = ValueNotifier<String>('');
  HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Olá, Fulano',
                  style: TextStyle(fontSize: 15),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    maxRadius: 40,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'assets/images/user.png',
                    ),
                  ),
                )
              ],
            ),
          ),
          ListTile(
            title: const Text('Meus Favoritos'),
            onTap: () {
              const FavoritesPage();
            },
          ),
          ListTile(
            title: const Text('Quem sou eu'),
            onTap: () {
              Navigator.pop(context);
              const FavoritesPage();
            },
          ),
          ListTile(
            title: const Text('Sair'),
            onTap: () {
              const LoginPage();
            },
          ),
        ],
      ),
    );
  }
}
