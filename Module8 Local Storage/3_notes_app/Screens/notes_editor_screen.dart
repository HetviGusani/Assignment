import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/notes_provider.dart';

class NoteEditorScreen extends StatefulWidget {
  final String noteId;

  const NoteEditorScreen({super.key, required this.noteId});

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  late TextEditingController _titleController;
  late TextEditingController _bodyController;
  Timer? _debounce;
  bool _initialized = false;
  int _wordCount = 0;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _bodyController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      final note = context.read<NotesProvider>().getNoteById(widget.noteId);
      if (note != null) {
        _titleController.text = note.title;
        _bodyController.text = note.body;
        _wordCount = _countWords(note.body);
      }
      _initialized = true;
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  int _countWords(String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return 0;
    return trimmed.split(RegExp(r'\s+')).length;
  }

  void _onChanged() {
    setState(() {
      _wordCount = _countWords(_bodyController.text);
    });
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 600), () {
      context.read<NotesProvider>().updateNote(
        widget.noteId,
        title: _titleController.text,
        body: _bodyController.text,
      );
    });
  }

  Future<void> _saveNow() async {
    _debounce?.cancel();
    await context.read<NotesProvider>().updateNote(
      widget.noteId,
      title: _titleController.text,
      body: _bodyController.text,
    );
  }

  Future<void> _deleteNote() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete note'),
        content: const Text('This note will be permanently deleted.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      await context.read<NotesProvider>().deleteNote(widget.noteId);
      if (mounted) Navigator.pop(context);
    }
  }

  void _showMoreOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 12),
            ListTile(
              leading: const Icon(Icons.delete_outline, color: Colors.red),
              title: const Text('Delete note',
                  style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(ctx);
                _deleteNote();
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: Text(
                  'Words: $_wordCount  ·  Characters: ${_bodyController.text.length}'),
              subtitle: Consumer<NotesProvider>(
                builder: (context, provider, _) {
                  final note = provider.getNoteById(widget.noteId);
                  return Text(note != null
                      ? 'Created ${note.createdAt.toLocal().toString().substring(0, 16)}'
                      : '');
                },
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PopScope(
      onPopInvoked: (_) => _saveNow(),
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        appBar: AppBar(
          backgroundColor: theme.colorScheme.surface,
          elevation: 0,
          scrolledUnderElevation: 1,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, size: 20),
            onPressed: () async {
              await _saveNow();
              if (mounted) Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: _showMoreOptions,
              tooltip: 'More options',
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _titleController,
                      onChanged: (_) => _onChanged(),
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Title',
                        hintStyle: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.onSurface.withOpacity(0.3),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: null,
                    ),
                    const SizedBox(height: 4),
                    Divider(
                      color: theme.colorScheme.onSurface.withOpacity(0.1),
                    ),
                    const SizedBox(height: 4),
                    TextField(
                      controller: _bodyController,
                      onChanged: (_) => _onChanged(),
                      style: theme.textTheme.bodyLarge?.copyWith(
                        height: 1.7,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Start writing…',
                        hintStyle: theme.textTheme.bodyLarge?.copyWith(
                          color: theme.colorScheme.onSurface.withOpacity(0.3),
                          height: 1.7,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: null,
                      autofocus: _bodyController.text.isEmpty &&
                          _titleController.text.isEmpty,
                    ),
                  ],
                ),
              ),
            ),
            // Bottom status bar
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: theme.colorScheme.onSurface.withOpacity(0.08),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$_wordCount word${_wordCount != 1 ? 's' : ''}',
                    style: TextStyle(
                      fontSize: 12,
                      color: theme.colorScheme.onSurface.withOpacity(0.4),
                    ),
                  ),
                  Text(
                    '${_bodyController.text.length} characters',
                    style: TextStyle(
                      fontSize: 12,
                      color: theme.colorScheme.onSurface.withOpacity(0.4),
                    ),
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