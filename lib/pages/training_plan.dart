import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/components/navigation_button.dart';
import 'package:lifting_progress_tracker/constants/localization.dart';

const String _title = "Training Schedule";

class TrainingPlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: Column(
        children: [
          const NavigationButton(exerciseRouteLabel),
          Table(
            border: TableBorder.all(),
            children: const <TableRow>[
              TableRow(
                children: <TableCell>[
                  TableCell(
                    child: Text('Exercise'),
                  ),
                  TableCell(
                    child: Text('Weight'),
                  ),
                  TableCell(
                    child: Text('Repeats'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
