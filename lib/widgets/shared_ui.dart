part of '../main.dart';

class Fields extends StatelessWidget {
  const Fields({super.key, required this.controllers});
  final List<(TextEditingController, String)> controllers;
  @override
  Widget build(BuildContext context) => Column(
    children: [
      for (final field in controllers) ...[
        TextField(
          controller: field.$1,
          decoration: InputDecoration(labelText: field.$2),
        ),
        const SizedBox(height: 10),
      ],
    ],
  );
}
