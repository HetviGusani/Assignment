// lib/providers/notes_provider.dart

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../Services/notes_service.dart';
import '../models/notes.dart';

class NotesProvider extends ChangeNotifier {
  final NotesService _service = NotesService();
  final _uuid = const Uuid();

  List<Note> _notes = [];
  String _searchQuery = '';
  bool _isLoading = true;

  List<Note> get notes {
    final query = _searchQuery.toLowerCase().trim();
    if (query.isEmpty) return List.from(_notes);
    return _notes
        .where((n) =>
    n.title.toLowerCase().contains(query) ||
        n.body.toLowerCase().contains(query))
        .toList();
  }

  bool get isLoading => _isLoading;
  String get searchQuery => _searchQuery;

  Future<void> loadNotes() async {
    _notes = await _service.loadNotes();
    _isLoading = false;
    notifyListeners();
  }

  Future<Note> createNote() async {
    final now = DateTime.now();
    final note = Note(
      id: _uuid.v4(),
      title: '',
      body: '',
      createdAt: now,
      updatedAt: now,
    );
    _notes.insert(0, note);
    await _save();
    return note;
  }

  Future<void> updateNote(String id, {String? title, String? body}) async {
    final idx = _notes.indexWhere((n) => n.id == id);
    if (idx == -1) return;
    final note = _notes[idx];
    _notes[idx] = note.copyWith(
      title: title ?? note.title,
      body: body ?? note.body,
      updatedAt: DateTime.now(),
    );
    // Re-sort: most recently updated first
    _notes.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    await _save();
    notifyListeners();
  }

  Future<void> deleteNote(String id) async {
    _notes.removeWhere((n) => n.id == id);
    await _save();
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  Note? getNoteById(String id) {
    try {
      return _notes.firstWhere((n) => n.id == id);
    } catch (_) {
      return null;
    }
  }

  Future<void> _save() async {
    await _service.saveNotes(_notes);
  }
}