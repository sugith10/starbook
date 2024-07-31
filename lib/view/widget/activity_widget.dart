// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';

import 'package:star_book/view/color/app_color.dart';

import '../../data/activity_data.dart';
import '../../model/activity_model.dart';

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({
    super.key,
    required this.activity,
  });

  final ActivityModel activity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showPopover(
            context: context,
            bodyBuilder: (context) => const ListItems(),
            onPop: () => print('Popover was popped!'),
            direction: PopoverDirection.bottom,
            width: 200,
            arrowHeight: 15,
            backgroundColor: AppColor.bg);
      },
      child: Container(
        decoration: BoxDecoration(
            color: activity.color, borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Row(
            children: [
              Text(
                activity.emoji,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(width: 15),
              Text(
                activity.text,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(),
              Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset:
                            const Offset(.5, 2) // changes position of shadow
                        ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: const Icon(
                  Icons.done,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 15),
            ],
          ),
        ),
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: PopOverWidget(
              color: AppColor.primary.withOpacity(0.6),
              text: ActivityData.ruleList[0],
            ),
          ),
          const Divider(),
          PopOverWidget(
            color: AppColor.primary.withOpacity(0.5),
            text: ActivityData.ruleList[1],
          ),
          const Divider(),
          PopOverWidget(
            color: AppColor.primary.withOpacity(0.4),
            text: ActivityData.ruleList[2],
          ),
        ],
      ),
    );
  }
}

class PopOverWidget extends StatelessWidget {
  final Color color;
  final String text;
  const PopOverWidget({
    super.key,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
                    text,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
          ),
        ],
      ),
    );
  }
}
