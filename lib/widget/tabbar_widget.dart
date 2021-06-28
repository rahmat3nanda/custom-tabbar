import 'package:flutter/material.dart';

class TabbarWidget extends PreferredSize {
  final List<Widget> children;
  final Color bgColor;
  final Color activeColor;
  final double height;
  final Function(int i) onSelected;

  TabbarWidget({
    @required this.children,
    @required this.bgColor,
    @required this.activeColor,
    this.onSelected,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return _TabbarWidget(
      children: children,
      bgColor: bgColor,
      activeColor: activeColor,
      onSelected: onSelected,
      preferredSize: preferredSize,
    );
  }
}

class _TabbarWidget extends StatefulWidget {
  final List<Widget> children;
  final Color bgColor;
  final Color activeColor;
  final Size preferredSize;
  final Function(int i) onSelected;

  _TabbarWidget({
    @required this.children,
    @required this.bgColor,
    @required this.activeColor,
    @required this.preferredSize,
    this.onSelected,
  });

  @override
  __TabbarWidgetState createState() => __TabbarWidgetState();
}

class __TabbarWidgetState extends State<_TabbarWidget> {
  int _selected;

  @override
  void initState() {
    super.initState();
    _selected = 0;
  }

  BorderRadius _getBorderRadius(int i) {
    if (widget.children.length > 1) {
      if (i == _selected - 1) {
        return BorderRadius.only(bottomRight: Radius.circular(16.0));
      }
      if (i == _selected + 1) {
        return BorderRadius.only(bottomLeft: Radius.circular(16.0));
      }
    }
    return BorderRadius.zero;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.preferredSize.height,
      color: widget.activeColor,
      alignment: Alignment.center,
      child: Row(
        children: List.generate(widget.children.length, (i) {
          print("$i ${_getBorderRadius(i)}");
          return Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                if (widget.onSelected != null) {
                  setState(() {
                    _selected = i;
                    widget.onSelected(i);
                  });
                }
              },
              child: Container(
                height: widget.preferredSize.height,
                decoration: BoxDecoration(
                  color: _selected == i ? widget.activeColor : widget.bgColor,
                  borderRadius: _getBorderRadius(i),
                ),
                child: Center(
                  child: widget.children[i],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
