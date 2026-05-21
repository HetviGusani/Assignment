
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/notes.dart';

class NotesService {
  static const _key = 'notes_list';

  Future<List<Note>> loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null) return [];
    final List decoded = jsonDecode(raw);
    return decoded.map((e) => Note.fromMap(e)).toList();
  }

  Future<void> saveNotes(List<Note> notes) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(notes.map((n) => n.toMap()).toList());
    await prefs.setString(_key, encoded);
  }

  Future<void> deleteAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}