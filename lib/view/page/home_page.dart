import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:star_book/data/activity_data.dart';

import '../widget/activity_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    DateFormat('d MMM yy').format(DateTime.now()),
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: ActivityData.list.length,
                  itemBuilder: (context, index) {
                    final activity = ActivityData.list[index];
                    return ActivityWidget(activity: activity);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
