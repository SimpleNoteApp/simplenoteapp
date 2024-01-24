import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simplenoteapp/widgets/dialogs.widgets.dart';

AppBar defaultAppBar(BuildContext context) {
  return AppBar(
    title: ElevatedButton.icon(
        onPressed: () {
          context.go("/note/new");
        },
        icon: Icon(Icons.create),
        label: Text("Add new")),
    actions: [
      IconButton(
          onPressed: () {
            context.go("/settings");
          },
          icon: const Icon(Icons.settings))
    ],
  );
}

AppBar settingsOpenedAppBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
        onPressed: () {
          context.go("/");
        },
        icon: const Icon(Icons.arrow_back)),
  );
}

AppBar noteEditorAppBar(BuildContext context) {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: ElevatedButton.icon(
            onPressed: () {}, icon: Icon(Icons.save), label: Text("Save note")),
      ),
      ElevatedButton.icon(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AboutExitFromEditor();
                });
          },
          icon: Icon(Icons.cancel),
          label: Text("Cancel")),
    ],
  );
}
