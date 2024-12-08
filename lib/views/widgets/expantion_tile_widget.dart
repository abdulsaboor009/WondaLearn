import 'package:flutter/material.dart';
import 'package:quiz/views/widgets/sizedbox_extention.dart';

import '../../utils/constants/appcolors.dart';
import '../../utils/constants/appfontsize.dart';
import 'custom_text.dart';
import 'responsive_size.dart';

// ignore: must_be_immutable
class ExpantionTileWidget extends StatefulWidget {
  final List list;
  String selectText;
  ExpantionTileWidget({
    super.key,
    required this.list,
    required this.selectText,
  });

  @override
  State<ExpantionTileWidget> createState() => _ExpantionTileWidgetState();
}

class _ExpantionTileWidgetState extends State<ExpantionTileWidget> {
  bool isExpanded = true;
  late double buttonWidth;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        buttonWidth = constraints.maxWidth;
        return InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            setState(() {
              isExpanded = false;
            });
          },
          child: AnimatedContainer(
            height: isExpanded ? ResponsiveSize.h * 59 : ResponsiveSize.h * 150,
            width: buttonWidth,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: const Duration(milliseconds: 1200),
            decoration: BoxDecoration(
                color: AppColors.textFieldFillColor,
                borderRadius: BorderRadius.circular(12)),
            child: SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveSize.w * 16,
                ),
                child: Column(
                  children: [
                    19.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SemiBoldTextWidget(
                          color: AppColors.title,
                          fontSize: AppFontSize.textFieldtextSize,
                          text: widget.selectText,
                        ),
                        InkWell(
                          onTap: () {
                            setState(
                              () {
                                isExpanded = !isExpanded;
                              },
                            );
                          },
                          child: Icon(
                            isExpanded
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_up,
                            color: AppColors.title,
                            size: ResponsiveSize.h * 18,
                          ),
                        ),
                      ],
                    ),
                    10.height,
                    Expanded(
                      child: SizedBox(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              // isExpanded ? const SizedBox() : 15.height,
                              AnimatedCrossFade(
                                firstChild: const Text(
                                  '',
                                  style: TextStyle(
                                    fontSize: 0,
                                  ),
                                ),
                                secondChild: Column(
                                  children: [
                                    ...List.generate(
                                      widget.list.length,
                                      (index) => Padding(
                                        padding: EdgeInsets.only(
                                            top: index == 0
                                                ? 0
                                                : ResponsiveSize.h * 5),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              widget.selectText =
                                                  widget.list[index].toString();
                                              isExpanded = !isExpanded;
                                            });
                                          },
                                          child: SizedBox(
                                            height: ResponsiveSize.h * 30,
                                            width: double.infinity,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SemiBoldTextWidget(
                                                  color: AppColors.title,
                                                  fontSize: AppFontSize
                                                      .textFieldtextSize,
                                                  text: widget.list[index]
                                                      .toString(),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    15.height,
                                  ],
                                ),
                                crossFadeState: isExpanded
                                    ? CrossFadeState.showFirst
                                    : CrossFadeState.showSecond,
                                duration: const Duration(milliseconds: 1200),
                                reverseDuration: Duration.zero,
                                sizeCurve: Curves.fastLinearToSlowEaseIn,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
