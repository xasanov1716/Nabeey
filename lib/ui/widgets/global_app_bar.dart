import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../utils/colors.dart';

class GlobalAppBar extends StatefulWidget {
  const GlobalAppBar({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onTap,
    required this.body,
  });

  final String title;
  final String subtitle;
  final String image;
  final VoidCallback onTap;
  final Widget body;

  @override
  State<GlobalAppBar> createState() => _GlobalAppBarState();
}

class _GlobalAppBarState extends State<GlobalAppBar> {
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
                  Visibility(visible: isPined, child: SizedBox(width: 35 * width / 375)),
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10 * width / 375),
                    child: ZoomTapAnimation(
                      onTap: widget.onTap,
                      child: Container(
                        height: 45 * height / 812,
                        width: 90 * width / 375,
                        decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(width / 5.5), color: AppColors.C_F59C16),
                        child: Center(
                          child: Text(
                            "Take the quiz",
                            style: TextStyle(
                              fontFamily: "Urbanist",
                              fontSize: 12 * width / 375,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
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
