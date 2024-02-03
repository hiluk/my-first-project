import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:technical_dz/news/providers/news_sites_provider.dart';
import 'package:technical_dz/news/providers/user_data_notifier.dart';
import 'package:technical_dz/news/routers/router.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsSites = ref.watch(newsSitesProvider).valueOrNull;
    ref.watch(userDataProvider).valueOrNull;
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user == null) {
          print('User is currently signed out!');
        } else {
          print('User is signed in!');
        }
      },
    );
    return AutoTabsRouter(
      routes: const [
        ArticlesViewRoute(),
        FavoriteArticlesViewRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  AutoRouter.of(context).push(const UserProfileScreenRoute());
                },
                icon: const Icon(Icons.account_circle),
              ),
            ],
            leading: IconButton(
              onPressed: () => SideSheet.left(
                body: Text('filter'),
                context: context,
              ),
              icon: const Icon(Icons.filter_list),
            ),
            title: const Text(
              'Spaceflight News',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            centerTitle: true,
          ),
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => _openPage(index, tabsRouter),
            selectedItemColor: Colors.black,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.article),
                label: 'Articles',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: 'Favorites',
              ),
            ],
          ),
        );
      },
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
