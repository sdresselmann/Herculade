import 'package:flutter/material.dart';

/// Build a a simple button that navigates towards a new page.
///
/// The Button uses the current [context] and when clicked executes the [navigationFunction].
/// The label shown on the button is given via [buttonText] which is also used as name for the route that is used for navigation.
/// This way a simple button can be created by simply calling this function, making the code more readable.
///
/// Example:
/// ```dart
/// void _navigateToRoute(BuildContext context, String routeName) {
///   Navigator.pushNamed(context, routeName);
/// }
///
///const String targetPage = 'Seite 2';
///
///@override
/// Widget build(BuildContext context) {
///   return Scaffold(
///     appBar: AppBar(title: 'Seite 1'),
///     body:
///         buildNavigationButton(
///           context,
///           _navigateToRoute
///           targetPage,
///         )
///     ),
///   );
/// }
///
/// ```
ElevatedButton getNavigationButton(
  BuildContext context,
  Function(BuildContext context, String routeName) navigationFunction,
  String buttonText,
) {
  final ElevatedButton elevatedButton = ElevatedButton(
    onPressed: () => navigationFunction(context, buttonText),
    child: Text(buttonText),
  );
  return elevatedButton;
}
