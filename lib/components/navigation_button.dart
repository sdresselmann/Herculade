import 'package:flutter/material.dart';

/// Build a a simple button that navigates towards a new page.
///
/// The Button uses the current [context] and when clicked executes [_navigateToRoute] with the given [routeName].
/// The label shown on the button is also used as name for the route that is used for navigation.
/// This way a simple button can be created by simply calling this function, making the code more readable.
///
/// Example:
/// ```dart
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
///           targetPage,
///         )
///     ),
///   );
/// }
///
/// ```

/// Change the currently shown app page.
///
/// Uses the current [context] and navigates the app towards the page declared
/// by the [routeName].
void _navigateToRoute(BuildContext context, String routeName) {
  Navigator.pushNamed(context, routeName);
}

class NavigationButton extends StatelessWidget {
  final String routeName;

  const NavigationButton(this.routeName);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _navigateToRoute(context, routeName),
      child: Text(routeName),
    );
  }
}
