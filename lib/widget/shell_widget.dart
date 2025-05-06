import 'dart:js_interop';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundementals_homework/core/router/route_provider.dart';
import 'package:fundementals_homework/core/settings/settings_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:web/web.dart' as html;

part 'shell_widget.g.dart';

@riverpod
class ShellExpansion extends _$ShellExpansion {
  @override
  bool build() {
    return true;
  }

  void toggleExpand() {
    state = !state;
  }
}

class ShellWidget extends ConsumerStatefulWidget {
  final Widget child;
  const ShellWidget({super.key, required this.child});

  @override
  ConsumerState<ShellWidget> createState() => _ShellWidgetState();
}

class _AboutDialog extends StatelessWidget {
  const _AboutDialog();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: AlertDialog(
        title: Text("About This Project", textAlign: TextAlign.center),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "This project was a homework for our course (CCS 3221 - Computing Fundamentals) under supervisions of Prof. Naif Albahooth,\nThe homework was about making a UML diagram for a system, and we decided to make a mockup of said system.\nIf would like to see how I made this project and the source code, please checkout my github repo.",
            ),
            Text("""
    Team Members:
    - Moath Altamimi
    - Yazan Albeetar
    """),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PrimaryButton(
                  leading: Icon(BootstrapIcons.github),
                  child: Text("Source Code"),
                  onPressed: () {
                    html.HTMLAnchorElement()
                      ..href =
                          "https://github.com/MoathCodes/fundementals_homework"
                      ..target = "_blank"
                      ..click();
                  },
                ),
                PrimaryButton(
                  leading: Icon(BootstrapIcons.download),
                  child: Text("Download Full UML"),
                  onPressed: () async {
                    final ByteData bytes = await rootBundle.load(r'UML.svg');
                    final list = bytes.buffer.asUint8List().buffer.toJS;
                    final blob = html.Blob([list].toJS);
                    final url = html.URL.createObjectURL(blob);
                    html.HTMLAnchorElement()
                      ..href = url
                      ..setAttribute('download', 'HeartFlowUML.svg')
                      ..click();
                    html.URL.revokeObjectURL(url);
                  },
                ),

                PrimaryButton(
                  leading: Icon(BootstrapIcons.paperclip),
                  child: Text("PDF homework"),
                  onPressed: () async {
                    final ByteData bytes = await rootBundle.load(r'HW.pdf');
                    final list = bytes.buffer.asUint8List().buffer.toJS;
                    final blob = html.Blob(
                      [list].toJS,
                      html.BlobPropertyBag(type: 'application/pdf'),
                    );
                    final url = html.URL.createObjectURL(blob);
                    html.HTMLAnchorElement()
                      ..href = url
                      ..setAttribute('download', 'HW_Moath_Yazan.pdf')
                      ..click();
                    html.URL.revokeObjectURL(url);
                  },
                ),
                PrimaryButton(
                  leading: Icon(BootstrapIcons.github),
                  child: Text("Yazan's Github"),
                  onPressed: () {
                    html.HTMLAnchorElement()
                      ..href = "https://github.com/Vormods"
                      ..target = "_blank"
                      ..click();
                  },
                ),
              ],
            ),
          ],
        ),
        actions: [
          DestructiveButton(
            child: Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

class _ShellWidgetState extends ConsumerState<ShellWidget> {
  final panelController = AbsoluteResizablePaneController(220);
  @override
  Widget build(BuildContext context) {
    final isExpanded = ref.watch(shellExpansionProvider);
    final routes = ref.read(routesProvider);
    final settings = ref.watch(settingsNotifierProvider);
    final settingsEditor = ref.read(settingsNotifierProvider.notifier);
    return Scaffold(
      child: ResizablePanel.horizontal(
        children: [
          ResizablePane.controlled(
            minSize: 150,
            maxSize: 250,
            controller: panelController,
            child: OutlinedContainer(
              borderRadius: BorderRadius.circular(0),
              child: NavigationSidebar(
                backgroundColor: Theme.of(context).colorScheme.card,
                labelPosition: NavigationLabelPosition.end,
                // alignment: NavigationRailAlignment.start,
                expanded: isExpanded,
                labelType: NavigationLabelType.expanded,
                index: routes.indexWhere(
                  (element) =>
                      element.path == GoRouter.of(context).state.fullPath,
                ),
                onSelected: (value) => context.go(routes[value].path),
                spacing: 4,
                children: [
                  NavigationLabel(child: Text("♥️ HeartFlow").h3),

                  NavigationButton(
                    label: Text("Set UML Mode"),
                    child: Switch(
                      value: settings.isUMLMode,
                      onChanged: (value) {
                        settingsEditor.setUMLMode(value);
                      },
                    ),
                  ),
                  NavigationDivider(),
                  ...routes.map(
                    (e) => NavigationItem(
                      alignment: Alignment.centerLeft,
                      selectedStyle: const ButtonStyle.primaryIcon(),
                      label: Text(e.label),
                      child: Icon(e.icon),
                    ),
                  ),
                  NavigationButton(
                    label: Text("About"),
                    child: Icon(BootstrapIcons.info),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return _AboutDialog();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          ResizablePane.flex(
            initialFlex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    panelController.dispose();
    super.dispose();
  }
}
