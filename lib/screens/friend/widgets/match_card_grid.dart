import 'package:flutter/material.dart';

import '../../../models/match_item.dart';
import 'match_card.dart';

class MatchCardGrid extends StatelessWidget {
  final List<MatchItem> matches;

  const MatchCardGrid({
    super.key,
    required this.matches,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(matches.length, (index) {
        final match = matches[index];
        final isLast = index == matches.length - 1;

        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: isLast ? 0 : 15,
            ),
            child: MatchCard(match: match),
          ),
        );
      }),
    );
  }
}

