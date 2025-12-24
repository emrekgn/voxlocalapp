import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voice_vault/theme.dart';
import 'package:voice_vault/components/note_item.dart';
import 'package:voice_vault/components/folder_item.dart';

class FolderDetailScreen extends StatefulWidget {
  final String folderId;
  final String folderName;

  const FolderDetailScreen({
    super.key,
    required this.folderId,
    required this.folderName,
  });

  @override
  State<FolderDetailScreen> createState() => _FolderDetailScreenState();
}

class _FolderDetailScreenState extends State<FolderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: AppSpacing.paddingMd,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_rounded),
                    onPressed: () => context.pop(),
                  ),
                  Expanded(
                    child: Text(
                      widget.folderName,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert_rounded),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: AppSpacing.paddingMd,
                children: [
                  FolderItem(
                    folderName: 'Q1 Projects',
                    noteCount: 8,
                    icon: Icons.folder_outlined,
                    onTap: () {},
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  FolderItem(
                    folderName: 'Meetings',
                    noteCount: 12,
                    icon: Icons.folder_outlined,
                    onTap: () {},
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    'Notes in this folder',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  NoteItem(
                    title: 'Sprint Planning Notes',
                    date: 'Today, 9:00 AM',
                    preview: 'Discussed upcoming sprint goals and assigned tasks to team members. Focus areas include...',
                    tags: ['work', 'planning'],
                    onTap: () => context.push('/note/5'),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  NoteItem(
                    title: 'Client Feedback Session',
                    date: 'Yesterday, 3:00 PM',
                    preview: 'Client provided valuable feedback on the latest prototype. Main points include...',
                    tags: ['work', 'feedback'],
                    onTap: () => context.push('/note/6'),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  NoteItem(
                    title: 'Team Standup',
                    date: 'Dec 14, 10:00 AM',
                    preview: 'Quick sync with the team on progress and blockers. Everyone is on track...',
                    tags: ['work', 'standup'],
                    onTap: () => context.push('/note/7'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
