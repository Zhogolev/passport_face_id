import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data_pages/defaults.dart';

class UserProfileStatistic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return ListView(
      padding: bodyPadding,
      children: [
        SizedBox(
          height: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Здесь могла бы быть ваша статистика',
                style: GoogleFonts.roboto(fontSize: 16, height: 1.5),
              )
            ],
          ),
        )
      ],
    );
  }
}
