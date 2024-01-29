import 'package:flutter/material.dart';

class NoteEditorView extends StatelessWidget {
  const NoteEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
      ),
      body: const Center(
        child: Text('Edit Note'),
      ),
    );
  }
}
