
import 'package:flutter/material.dart';

import 'NumberOfGroupWidget.dart';

class TextReviewText extends StatelessWidget {
  const TextReviewText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "People",
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 4),
          Text(
            "Number of people in your group",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 4),
          Row(
            children: List.generate(5, (index) {
              return NumberOfGroupWidget(index: index);
            }),
          ),
          SizedBox(height: 10),
          Text(
            "Descriptin",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            "This 134 kilometers Highway 99 trail gives you a taste of the Canada mountains, from Horseshoe Bay in the north of Vancouver to Pemberton",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
