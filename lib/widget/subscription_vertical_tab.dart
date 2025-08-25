import '../utils/appcolor.dart';
import 'package:flutter/material.dart';

enum IndicatorSidse { start, end }


class SubscriptionVerticalTabs extends StatefulWidget {
  final Key key;
  final int initialIndex;
  final double tabsWidth;
  final double indicatorWidth;
  final IndicatorSidse indicatorSide;
  final List<Tab> tabs;
  final List<Widget> contents;
  final TextDirection direction;
  final Color indicatorColor;
  final bool disabledChangePageFromContentView;
  final Axis contentScrollAxis;
  final Color selectedTabBackgroundColor;
  final Color tabBackgroundColor;
  final TextStyle selectedTabTextStyle;
  final TextStyle tabTextStyle;
  final Duration changePageDuration;
  final Curve changePageCurve;
  final Color tabsShadowColor;
  final double tabsElevation;
  final Function(int tabIndex) onSelect;
  final Color backgroundColor;

  SubscriptionVerticalTabs(
      {required this.key,
        required this.tabs,
        required this.contents,
        this.tabsWidth = 200,
        this.indicatorWidth = 3,
        required this.indicatorSide,
        this.initialIndex = 0,
        this.direction = TextDirection.ltr,
        this.indicatorColor = AppColors.white,
        this.disabledChangePageFromContentView = false,
        this.contentScrollAxis = Axis.vertical,
        this.selectedTabBackgroundColor = const Color(0x1100ff00),
        this.tabBackgroundColor = const Color(0xffdee4e3),
        this.selectedTabTextStyle = const TextStyle(color: Colors.black),
        this.tabTextStyle = const TextStyle(color: Colors.black38),
        this.changePageCurve = Curves.easeInOut,
        this.changePageDuration = const Duration(milliseconds: 300),
        this.tabsShadowColor = Colors.black54,
        this.tabsElevation = 2.0,
        required this.onSelect,
        required this.backgroundColor})
      : assert(
  tabs.length == contents.length),
        super(key: key);

  @override
  _SubscriptionVerticalTabsState createState() => _SubscriptionVerticalTabsState();
}

class _SubscriptionVerticalTabsState extends State<SubscriptionVerticalTabs>
    with TickerProviderStateMixin {
  late int _selectedIndex;
  late bool _changePageByTapView;

  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<RelativeRect> rectAnimation;

  PageController pageController = PageController();

  List<AnimationController> animationControllers = [];

  ScrollPhysics pageScrollPhysics = const AlwaysScrollableScrollPhysics();

  @override
  void initState() {
    _selectedIndex = widget.initialIndex;
    for (int i = 0; i < widget.tabs.length; i++) {
      animationControllers.add(AnimationController(
        duration: const Duration(milliseconds: 400),
        vsync: this,
      ));
    }
    _selectTab(widget.initialIndex);

    if (widget.disabledChangePageFromContentView == true) {
      pageScrollPhysics = const NeverScrollableScrollPhysics();
    }

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pageController.jumpToPage(widget.initialIndex);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Border(right: BorderSide(width: 0.5, color: widget.indicatorColor));
    if (widget.direction == TextDirection.rtl) {
      Border(left: BorderSide(width: 0.5, color: widget.indicatorColor));
    }

    return Directionality(
      textDirection: widget.direction,
      child: Container(
        color: widget.backgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Material(
                    elevation: widget.tabsElevation,
                    shadowColor: widget.tabsShadowColor,
                    shape: const BeveledRectangleBorder(),
                    child: Container(
                      color: AppColors.tabBg,
                      width: widget.tabsWidth,
                      child: ListView.builder(
                        itemCount: widget.tabs.length,
                        itemBuilder: (context, index) {
                          Tab tab = widget.tabs[index];
                          Alignment alignment = Alignment.centerLeft;
                          if (widget.direction == TextDirection.rtl) {
                            alignment = Alignment.center;
                          }
                          Widget? child;
                          if (tab.child != null) {
                            child = tab.child;
                          } else {
                            child = Container(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: <Widget>[
                                    (tab.icon != null)
                                        ? const Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 5,
                                        )
                                      ],
                                    )
                                        : Container(),
                                    (tab.text != null)
                                        ? Container(
                                        width: widget.tabsWidth - 50,
                                        child: Text(
                                          "${tab.text}",
                                          softWrap: true,
                                          style: _selectedIndex == index
                                              ? widget.selectedTabTextStyle
                                              : widget.tabTextStyle,
                                        ))
                                        : Container(),
                                  ],
                                ));
                          }

                          Color itemBGColor = widget.tabBackgroundColor;
                          Color itemIndecatorBGColor = widget.tabBackgroundColor;
                          if (_selectedIndex == index) {
                            itemBGColor =AppColors.white;
                            itemIndecatorBGColor =AppColors.redDark;
                          }
                          double left;
                          if (widget.direction == TextDirection.rtl) {
                            left = ((widget.indicatorSide == IndicatorSidse.end)
                                ? 0
                                : null)!;

                          } else {
                            left =
                            ((widget.indicatorSide == IndicatorSidse.start)
                                ? 0
                                : null)!;
                          }

                          return Stack(
                            children: <Widget>[
                              Positioned(
                                top: 2,
                                bottom: 2,
                                width: widget.indicatorWidth,
                                left: left,
                                child: ScaleTransition(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                  ),
                                  scale: Tween(begin: 0.0, end: 1.0).animate(
                                    CurvedAnimation(
                                      parent: animationControllers[index],
                                      curve: Curves.elasticOut,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _changePageByTapView = true;
                                  setState(() {
                                    _selectTab(index);
                                  });

                                  pageController.animateToPage(index,
                                      duration: widget.changePageDuration,
                                      curve: widget.changePageCurve);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: itemBGColor,
                                    border: Border(
                                      right: BorderSide(
                                        color: itemIndecatorBGColor, // Set your desired color
                                        width: 5.0,         // Set border width
                                      ),
                                    ), ),
                                  alignment: alignment,
                                  padding: const EdgeInsets.all(5),
                                  child: child,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      scrollDirection: widget.contentScrollAxis,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (index) {
                        if (_changePageByTapView == false) {
                          _selectTab(index);
                        }
                        if (_selectedIndex == index) {
                          _changePageByTapView = false;
                        }
                        setState(() {});
                      },
                      controller: pageController,

                      // the number of pages
                      itemCount: widget.contents.length,

                      // building pages
                      itemBuilder: (BuildContext context, int index) {
                        return widget.contents[index];
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectTab(index) {
    _selectedIndex = index;
    for (AnimationController animationController in animationControllers) {
      animationController.reset();
    }
    animationControllers[index].forward();

    widget.onSelect(_selectedIndex);
  }
}
