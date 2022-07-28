import 'package:flutter/material.dart';

/// Build a a simple button that navigates towards a new page.
///
/// The Button uses the current [context] and when clicked executes the [navigationFunction].
/// The label shown on the button is given via [buttonText].
/// This way a simple button can be created by simply calling this function, making the code more readable.
///
/// Example:
/// ```dart
///void navigateToX(BuildContext context)
///{
///   Navigator.push(
///    context,
///    MaterialPageRoute(
///      builder: (context) => const StatisticsPage(_statisticsText),
///    ),
///  );
///}
///
///const String text = "Text";
///
///@override
/// Widget build(BuildContext context) {
///   return Scaffold(
///     appBar: AppBar(title: text),
///     body:
///         buildNavigationButton(
///           context,
///           navigateToX
///           text,
///         )
///     ),
///   );
/// }
///
/// ```
ElevatedButton getNavigationButton(
  BuildContext context,
  Function(BuildContext context) navigationFunction,
  String buttonText,
) {
  final ElevatedButton elevatedButton = ElevatedButton(
    onPressed: () => navigationFunction(context),
    child: Text(buttonText),
  );
  return elevatedButton;
}
