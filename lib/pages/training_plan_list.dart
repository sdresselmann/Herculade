import 'package:flutter/material.dart';

class TrainingPlanListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Training Plan 1"),
          Table(
            border: TableBorder.all(),
            children: const [
              TableRow(
                children: [
                  Text("Exercise"),
                  Text("Weight"),
                  Text("Repeats"),
                  Text("Comments"),
                  Text(""),
                ],
              ),
              TableRow(
                children: [
                  Text("Bench press"),
                  Text("20 KG"),
                  Text("3x15"),
                  Text("More Weight next time."),
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Text("Deadlift"),
                  Text("30/40 KG"),
                  Text("3x15/3x5"),
                  Text("More Weight next time, slow down execution, ..."),
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Text("Overhead Press"),
                  Text("10 KG"),
                  Text("3x5"),
                  Text(""),
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
            ],
          ),
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.create),
          ),
        ],
      ),
    );
  }
}
