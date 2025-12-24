import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voice_vault/screens/main_scaffold.dart';
import 'package:voice_vault/screens/note_detail_screen.dart';
import 'package:voice_vault/screens/folder_detail_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        pageBuilder: (context, state) => NoTransitionPage(
          child: const MainScaffold(),
        ),
      ),
      GoRoute(
        path: '/note/:id',
        name: 'note',
        pageBuilder: (context, state) {
          final noteId = state.pathParameters['id']!;
          return MaterialPage(
            child: NoteDetailScreen(noteId: noteId),
          );
        },
      ),
      GoRoute(
        path: '/folder/:id',
        name: 'folder',
        pageBuilder: (context, state) {
          final folderId = state.pathParameters['id']!;
          final folderName = state.uri.queryParameters['name'] ?? 'Folder';
          return MaterialPage(
            child: FolderDetailScreen(
              folderId: folderId,
              folderName: folderName,
            ),
          );
        },
      ),
    ],
  );
}

class AppRoutes {
  static const String home = '/';
}
