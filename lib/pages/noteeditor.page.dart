import 'package:flutter/material.dart';
import 'package:simplenoteapp/widgets/appbars.widgets.dart';

class NoteEditorPage extends StatefulWidget {
  @override
  State<NoteEditorPage> createState() => _NoteEditorPageState();
}

class _NoteEditorPageState extends State<NoteEditorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: noteEditorAppBar(context));
  }
}
