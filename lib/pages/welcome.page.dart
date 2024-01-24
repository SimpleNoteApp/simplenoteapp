import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplenoteapp/app.state.dart';
import 'package:simplenoteapp/widgets/notesview.widgets.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return (appState.notates.isNotEmpty)
        ? NotationView(notates: appState.notates)
        : Center(child: Text("No notations found"));
  }
}
