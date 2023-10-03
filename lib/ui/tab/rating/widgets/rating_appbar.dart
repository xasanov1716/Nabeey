import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../utils/colors.dart';

class RatingAppBar extends StatefulWidget {
  const RatingAppBar({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.body,
  });

  final String title;
  final String subtitle;
  final String image;
  final Widget body;

  @override
  State<RatingAppBar> createState() => _RatingAppBarState();
}

class _RatingAppBarState extends State<RatingAppBar> {
  ScrollController _scrollController = ScrollController();
  bool lastStatus = true;

  _scrollListener() {
    if (isPined != lastStatus) {
      setState(() {
        lastStatus = isPined;
      });
    }
  }

  bool get isPined {
    return _scrollController.hasClients && _scrollController.offset > (200 - kToolbarHeight);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 240 * height / 812,
            floating: false,
            pinned: true,
            automaticallyImplyLeading: true,
            backgroundColor: AppColors.white,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: width / 18, bottom: 16.0), // Adjust padding as needed
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Visibility(visible: isPined, child: SizedBox(width: 10 * width / 375)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Visibility(visible: isPined, child: SizedBox(height: 15 * height / 812)),
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontFamily: "Urbanist",
                          fontSize: 18 * width / 375,
                          fontWeight: FontWeight.w700,
                          color: isPined ? AppColors.black : AppColors.white,
                        ),
                        // maxLines: 1,
                        // overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        widget.subtitle,
                        style: TextStyle(
                          fontFamily: "Urbanist",
                          fontSize: 10 * width / 375,
                          fontWeight: FontWeight.w400,
                          color: isPined ? AppColors.black : AppColors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
              background: ClipRRect(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20 * width / 375)),
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ];
      },
      body: widget.body,
    );
  }
}