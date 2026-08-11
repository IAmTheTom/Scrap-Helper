part of '../main.dart';

class PageShell extends StatelessWidget {
  const PageShell({
    super.key,
    required this.title,
    required this.child,
    this.actions,
    this.fab,
  });
  final String title;
  final Widget child;
  final List<Widget>? actions;
  final Widget? fab;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title), actions: actions),
    floatingActionButton: fab,
    body: SafeArea(child: child),
  );
}

void pending(BuildContext context, String message) => ScaffoldMessenger.of(
  context,
).showSnackBar(SnackBar(content: Text(message)));
Widget sectionTitle(BuildContext context, String text, {Widget? action}) =>
    Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(text, style: Theme.of(context).textTheme.titleLarge),
          ),
          ?action,
        ],
      ),
    );
Widget metricGrid(BuildContext context, List<Widget> children) =>
    GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: MediaQuery.sizeOf(context).width > 900 ? 4 : 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 1.6,
      children: children,
    );
