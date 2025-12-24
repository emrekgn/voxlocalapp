import 'package:flutter/material.dart';
import 'package:voice_vault/theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _outputLanguage = 'English';
  String _rewriteLevel = 'Medium';
  final TextEditingController _writingStyleController = TextEditingController(
    text: 'Write in clear, concise paragraphs',
  );
  final TextEditingController _maxCharactersController = TextEditingController(
    text: '5000',
  );
  final TextEditingController _specialWordsController = TextEditingController(
    text: 'Flutter, Dart, Firebase',
  );
  bool _isPremium = false;

  @override
  void dispose() {
    _writingStyleController.dispose();
    _maxCharactersController.dispose();
    _specialWordsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppSpacing.paddingMd,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Settings',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                _buildAccountSection(),
                const SizedBox(height: AppSpacing.xl),
                _buildAIPreferencesSection(),
                const SizedBox(height: AppSpacing.xl),
                _buildAppSettingsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAccountSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Account',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _isPremium ? Icons.workspace_premium_rounded : Icons.person_rounded,
                        color: Theme.of(context).colorScheme.primary,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                _isPremium ? 'Premium User' : 'Free Plan',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              if (_isPremium) ...[
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.tertiary,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    'PRO',
                                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                      color: Theme.of(context).colorScheme.onTertiary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _isPremium
                                ? '1 hour transcription limit'
                                : '5 minutes transcription limit',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (!_isPremium) ...[
                  const SizedBox(height: AppSpacing.md),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => setState(() => _isPremium = true),
                      child: const Text('Upgrade to Premium'),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.storage_rounded,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Storage Used',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '2.4 GB / 10 GB',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: 0.24,
                    minHeight: 8,
                    backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAIPreferencesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'AI Preferences',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Output Language',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                DropdownButtonFormField<String>(
                  value: _outputLanguage,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  items: ['English', 'Spanish', 'French', 'German', 'Chinese', 'Japanese']
                      .map((lang) => DropdownMenuItem(value: lang, child: Text(lang)))
                      .toList(),
                  onChanged: (value) => setState(() => _outputLanguage = value!),
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  'Rewrite Level',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                SegmentedButton<String>(
                  segments: const [
                    ButtonSegment(value: 'Low', label: Text('Low')),
                    ButtonSegment(value: 'Medium', label: Text('Medium')),
                    ButtonSegment(value: 'High', label: Text('High')),
                  ],
                  selected: {_rewriteLevel},
                  onSelectionChanged: (Set<String> value) {
                    setState(() => _rewriteLevel = value.first);
                  },
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  'Writing Style',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                TextField(
                  controller: _writingStyleController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    hintText: 'e.g., Write like Morgan Housel, use bullet points...',
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  'Output Length (max characters)',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                TextField(
                  controller: _maxCharactersController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Enter maximum character count',
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  'Special Words',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Comma-separated list of terms to spell correctly',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                TextField(
                  controller: _specialWordsController,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    hintText: 'e.g., Flutter, Firebase, React Native',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAppSettingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'App Settings',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.dark_mode_rounded,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                title: const Text('Theme'),
                subtitle: const Text('System default'),
                trailing: Icon(
                  Icons.chevron_right_rounded,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                onTap: () {},
              ),
              Divider(
                height: 1,
                indent: 56,
                color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
              ),
              ListTile(
                leading: Icon(
                  Icons.notifications_rounded,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                title: const Text('Notifications'),
                trailing: Icon(
                  Icons.chevron_right_rounded,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                onTap: () {},
              ),
              Divider(
                height: 1,
                indent: 56,
                color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
              ),
              ListTile(
                leading: Icon(
                  Icons.help_outline_rounded,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                title: const Text('Help & Support'),
                trailing: Icon(
                  Icons.chevron_right_rounded,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                onTap: () {},
              ),
              Divider(
                height: 1,
                indent: 56,
                color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
              ),
              ListTile(
                leading: Icon(
                  Icons.info_outline_rounded,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                title: const Text('About'),
                subtitle: const Text('Version 1.0.0'),
                trailing: Icon(
                  Icons.chevron_right_rounded,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
