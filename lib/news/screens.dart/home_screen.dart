import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:technical_dz/news/providers/user_data_notifier.dart';
import 'package:technical_dz/news/routers/router.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      routes: [
        ArticlesViewRoute(),
        FavoriteArticlesViewRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          // appBar: AppBar(
          //   actions: [
          //     IconButton(
          //       onPressed: () {
          //         AutoRouter.of(context).push(const UserProfileScreenRoute());
          //       },
          //       icon: const Icon(Icons.account_circle),
          //     ),
          //   ],
          //   leading: IconButton(
          //     onPressed: () => SideSheet.left(
          //       width: 320,
          //       body: Padding(
          //         padding: const EdgeInsets.only(left: 10.0, top: 80),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           children: [
          //             const Text(
          //               'Filter',
          //               style: TextStyle(
          //                 fontSize: 18,
          //                 fontWeight: FontWeight.w600,
          //               ),
          //             ),
          //             const SizedBox(height: 30),
          //             const Text('Search by site'),
          //             DropdownMenu(
          //               menuHeight: 500,
          //               key: dropdownKey,
          //               trailingIcon: IconButton(
          //                 onPressed: () {
          //                   siteController.text = '';
          //                 },
          //                 icon: const Icon(Icons.close),
          //               ),
          //               controller: siteController,
          //               onSelected: (String? site) =>
          //                   articlesNotifier.searchByParams(
          //                 request: ArticlesRequest(
          //                   newsSite: siteController.text,
          //                 ),
          //               ),
          //               hintText: 'Click on the site',
          //               dropdownMenuEntries: newsSites
          //                   .map(
          //                     (site) => DropdownMenuEntry(
          //                       value: site,
          //                       label: site,
          //                     ),
          //                   )
          //                   .toList(),
          //             ),
          //           ],
          //         ),
          //       ),
          //       context: context,
          //     ),
          //     icon: const Icon(Icons.filter_list),
          //   ),
          //   title: const Text(
          //     'Spaceflight News',
          //     style: TextStyle(
          //       fontSize: 18,
          //     ),
          //   ),
          //   centerTitle: true,
          // ),
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
