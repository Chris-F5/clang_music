import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _endpoint = TextEditingController();
  final _bucket = TextEditingController();
  final _region = TextEditingController();
  final _accessKeyId = TextEditingController();
  final _secretAccessKey = TextEditingController();
  bool _showSecret = false;
  bool _hasUnsavedChanges = false;

  @override
  void dispose() {
    _endpoint.dispose();
    _bucket.dispose();
    _region.dispose();
    _accessKeyId.dispose();
    _secretAccessKey.dispose();
    super.dispose();
  }

  void _markChanged() => setState(() => _hasUnsavedChanges = true);

  void _loadTestSettings() {
    setState(() {
      _bucket.text = 'music-test-7b22';
      _region.text = 'eu-central-003';
      _endpoint.text = 's3.eu-central-003.backblazeb2.com';
      _accessKeyId.text = '0038a8d5945ebb5000000000d';
      _secretAccessKey.text = 'K003/JysvhgF0AqOgOVnztwDy39SrIU';
      _hasUnsavedChanges = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Remote bucket', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          TextField(
            controller: _endpoint,
            decoration: const InputDecoration(labelText: 'Endpoint URL'),
            onChanged: (_) => _markChanged(),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _bucket,
            decoration: const InputDecoration(labelText: 'Bucket name'),
            onChanged: (_) => _markChanged(),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _region,
            decoration: const InputDecoration(labelText: 'Region'),
            onChanged: (_) => _markChanged(),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _accessKeyId,
            decoration: const InputDecoration(labelText: 'Access key ID'),
            onChanged: (_) => _markChanged(),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _secretAccessKey,
            obscureText: !_showSecret,
            decoration: InputDecoration(
              labelText: 'Secret access key',
              prefixIcon: IconButton(
                tooltip: _showSecret ? 'Hide secret' : 'Show secret',
                icon: Icon(
                  _showSecret
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: () => setState(() => _showSecret = !_showSecret),
              ),
            ),
            onChanged: (_) => _markChanged(),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: _hasUnsavedChanges
                ? () => setState(() => _hasUnsavedChanges = false)
                : null,
            child: Text(
              _hasUnsavedChanges ? 'Save settings' : 'Settings saved',
            ),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: _loadTestSettings,
            child: const Text('Load test settings'),
          ),
          const Divider(height: 32),
          Text('Sync', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          const Text(
            'Sync implementation is next: list remote objects, diff identities, download changed audio, extract metadata/artwork, then commit SQLite rows transactionally.',
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.sync_rounded),
            label: const Text('Sync now'),
          ),
        ],
      ),
    );
  }
}
