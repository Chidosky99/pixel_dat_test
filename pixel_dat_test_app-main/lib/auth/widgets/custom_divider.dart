import 'package:flutter/material.dart';
import 'package:pixel_dat_test_app/utils/config/colour_config.dart';
import 'package:pixel_dat_test_app/utils/config/text_config.dart';
import 'package:pixel_dat_test_app/utils/const.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: ColourConfig.midGreyColour)),
        SizedBox(width: paddingSize),
        Text(
          "OR",
          style: TextConfig.textStyle.copyWith(
            fontWeight: FontWeight.w700,
            color: ColourConfig.defaultAppColour,
          ),
        ),
        SizedBox(width: paddingSize),
        Flexible(child: Divider(color: ColourConfig.midGreyColour)),
      ],
    );
  }
}
