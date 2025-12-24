import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voice_vault/theme.dart';
import 'package:voice_vault/components/folder_item.dart';
import 'package:voice_vault/components/note_item.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: AppSpacing.paddingMd,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Library',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  TextField(
                    controller: _searchController,
                    onChanged: (value) => setState(() => _searchQuery = value),
                    decoration: InputDecoration(
                      hintText: 'Search by title, tags, or content',
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      suffixIcon: _searchQuery.isNotEmpty
                          ? IconButton(
                              icon: Icon(
                                Icons.clear_rounded,
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                              onPressed: () {
                                _searchController.clear();
                                setState(() => _searchQuery = '');
                              },
                            )
                          : null,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _buildLibraryContent(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.create_new_folder_rounded),
        label: const Text('New Folder'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }

  Widget _buildLibraryContent() {
    return ListView(
      padding: AppSpacing.paddingMd,
      children: [
        FolderItem(
          folderName: 'Work Notes',
          noteCount: 24,
          icon: Icons.work_outline_rounded,
          onTap: () => context.push('/folder/work?name=Work Notes'),
        ),
        const SizedBox(height: AppSpacing.sm),
        FolderItem(
          folderName: 'Personal',
          noteCount: 15,
          icon: Icons.person_outline_rounded,
          onTap: () {},
        ),
        const SizedBox(height: AppSpacing.sm),
        FolderItem(
          folderName: 'Ideas',
          noteCount: 42,
          icon: Icons.lightbulb_outline_rounded,
          onTap: () {},
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          'Recent Notes',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        NoteItem(
          title: 'Meeting with Design Team',
          date: 'Today, 2:30 PM',
          preview: 'Discussed new UI concepts for the mobile app. Team agreed on minimalist approach with focus on...',
          tags: ['work', 'design'],
          onTap: () => context.push('/note/1'),
        ),
        const SizedBox(height: AppSpacing.sm),
        NoteItem(
          title: 'Book Ideas',
          date: 'Yesterday, 5:45 PM',
          preview: 'Started thinking about a story concept involving time travel and parallel universes. Main character could be...',
          tags: ['personal', 'creative'],
          onTap: () => context.push('/note/2'),
        ),
        const SizedBox(height: AppSpacing.sm),
        NoteItem(
          title: 'Grocery Shopping List',
          date: 'Dec 15, 10:20 AM',
          preview: 'Milk, eggs, bread, chicken, vegetables, fruits, coffee beans, pasta, tomato sauce...',
          tags: ['personal'],
          onTap: () => context.push('/note/3'),
        ),
        const SizedBox(height: AppSpacing.sm),
        NoteItem(
          title: 'Project Kickoff Notes',
          date: 'Dec 14, 3:15 PM',
          preview: 'New client project starting next week. Requirements include mobile app with offline capabilities...',
          tags: ['work', 'project'],
          onTap: () => context.push('/note/4'),
        ),
      ],
    );
  }
}
