import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../presentation/pages/animal_detail_page.dart';
import '../presentation/pages/app_shell.dart';
import '../presentation/pages/favorites_page.dart';
import '../presentation/pages/home_page.dart';
import '../presentation/pages/nearby_page.dart';
import '../presentation/pages/notifications_page.dart';
import '../presentation/pages/profile_page.dart';
import '../presentation/pages/search_page.dart';
import '../presentation/pages/shelter_detail_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: HomePage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/search',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: SearchPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/favorites',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: FavoritesPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/nearby',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: NearbyPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ProfilePage()),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NotificationsPage(),
      ),
      GoRoute(
        path: '/search/results',
        builder: (context, state) => const SearchResultsPage(),
      ),
      GoRoute(
        path: '/animal/:animalId',
        builder: (context, state) =>
            AnimalDetailPage(animalId: state.pathParameters['animalId']!),
      ),
      GoRoute(
        path: '/shelter/:shelterId',
        builder: (context, state) =>
            ShelterDetailPage(shelterId: state.pathParameters['shelterId']!),
      ),
    ],
  );
});
