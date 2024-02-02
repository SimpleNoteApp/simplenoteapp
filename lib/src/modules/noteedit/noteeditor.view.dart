import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simplenoteapp/src/modules/noteedit/noteeditor.controller.dart';
import 'package:simplenoteapp/src/modules/noteedit/noteeditor.state.dart';
import 'package:simplenoteapp/src/widgets/appbars.widgets.dart';
import 'package:simplenoteapp/src/widgets/dialogs.widgets.dart';

class NoteEditorView extends StatefulWidget {
  final NoteEditController controller;
  const NoteEditorView({super.key, required this.controller});

  @override
  State<NoteEditorView> createState() => _NoteEditorViewState();
}

class _NoteEditorViewState extends State<NoteEditorView> {
  NoteEditController get controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.note.title.isNotEmpty &&
          controller.note.content.isNotEmpty) {
        controller.setNote(context, controller.note);
      }
    });

    return LayoutBuilder(
      builder: (context, constraints) {
        return PopScope(
          canPop: false,
          onPopInvoked: (canPop) async {
            aboutExitFromEditorDialog(context);
          },
          child: Scaffold(
            appBar: noteEditorAppBar(context, controller),
            body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  NoteTitleTextField(
                    constraints: constraints,
                    controller: controller,
                  ),
                  SizedBox(height: constraints.maxHeight * 0.02),
                  NoteContentTextField(
                    constraints: constraints,
                    controller: controller,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class NoteTitleTextField extends StatelessWidget {
  final BoxConstraints constraints;
  final NoteEditController controller;

  const NoteTitleTextField({
    super.key,
    required this.constraints,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    NoteEditorState state = context.watch<NoteEditorState>();

    return SizedBox(
      width: constraints.maxWidth * 0.8,
      child: TextField(
        controller: state.titleController,
        onChanged: (value) => controller.setTitle(context, value),
        style: const TextStyle(fontSize: 20),
        decoration: const InputDecoration(
          hintText: 'Title',
        ),
      ),
    );
  }
}

class NoteContentTextField extends StatelessWidget {
  final BoxConstraints constraints;
  final NoteEditController controller;

  const NoteContentTextField({
    super.key,
    required this.constraints,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    NoteEditorState state = context.watch<NoteEditorState>();
    return SizedBox(
      width: constraints.maxWidth * 0.8,
      child: TextField(
        controller: state.contentController,
        onChanged: (String content) => controller.setContent(context, content),
        maxLines: null,
        decoration: const InputDecoration(
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          hintText: 'Content',
        ),
      ),
    );
  }
}
