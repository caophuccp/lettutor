import 'package:flutter/material.dart';
import 'package:lettutor/components/expanded_session.dart';
import 'package:lettutor/styles/text_styles.dart';

class UserInfoComboBox extends StatefulWidget {
  UserInfoComboBox({
    Key? key,
    required this.items,
    required this.header,
    this.isExpanded = false,
    this.selectedItems = const [],
    this.selectedItem,
    this.allowsMultipleSelection = false,
    this.select,
    this.unselect,
  }) : super(key: key);

  final bool isExpanded;
  final String header;
  final List<String> items;
  final List<String> selectedItems; //allowsMultipleSelection = true
  final String? selectedItem; //allowsMultipleSelection = false
  final bool allowsMultipleSelection;
  final void Function(String)? select;
  final void Function(String)? unselect;

  @override
  _UserInfoComboBoxState createState() =>
      _UserInfoComboBoxState(isExpanded: isExpanded);
}

class _UserInfoComboBoxState extends State<UserInfoComboBox> {
  _UserInfoComboBoxState({
    this.isExpanded = false,
  }) : super();

  bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: toggle,
          child: Row(
            children: [
              Expanded(
                child: headerWidget(),
              ),
              Icon(Icons.arrow_drop_down_rounded),
              SizedBox(
                width: 16,
              ),
            ],
          ),
        ),
        ExpandedSection(
          expand: isExpanded,
          child: Container(
            child: widget.items.length > 5
                ? Container(
                  height: 200,
                  child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                              Divider(
                                color: Colors.grey.shade200,
                                thickness: 1,
                              )
                            ] +
                            _itemsWidget(context),
                      ),
                    ),
                )
                : Column(
                    children: <Widget>[
                          Divider(
                            color: Colors.grey.shade200,
                            thickness: 1,
                          )
                        ] +
                        _itemsWidget(context),
                  ),
          ),
        )
      ],
    );
  }

  List<Widget> _itemsWidget(BuildContext context) {
    return widget.items.map((item) => _itemWidget(context, item)).toList();
  }

  Widget _itemWidget(BuildContext context, String item) {
    return Container(
      color: Colors.transparent,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
      child: TextButton(
        onPressed: () {
          if (widget.allowsMultipleSelection) {
            if (widget.selectedItems.contains(item)) {
              widget.unselect?.call(item);
            } else {
              widget.select?.call(item);
            }
          } else {
            widget.select?.call(item);
            collapse();
          }
        },
        child: Row(
          children: [
            Text(item),
            Spacer(),
            if (isSelected(item))
              Icon(
                Icons.check_outlined,
                size: 14,
              )
          ],
        ),
        style: TextButton.styleFrom(
          primary: Theme.of(context).textTheme.subtitle1?.color ?? Colors.black,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
    );
  }

  Widget headerWidget() {
    if (!widget.allowsMultipleSelection) {
      return Container(
        color: Colors.transparent,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Text(
          widget.selectedItem ?? widget.header,
          style: TextStyles.subtitle2SemiBold,
        ),
      );
    }

    if (widget.selectedItems.isEmpty) {
      return Container(
        color: Colors.transparent,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Text(
          widget.header,
          style: TextStyles.subtitle2SemiBold,
        ),
      );
    }

    return Container(
      height: 32,
      child: ListView.separated(
        separatorBuilder: (_, __) => SizedBox(
          width: 4,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => Container(
          color: Colors.grey.withOpacity(0.3),
          child: TextButton(
            onPressed: () {
              widget.unselect?.call(widget.selectedItems[index]);
            },
            child: Text(widget.selectedItems[index]),
            style: TextButton.styleFrom(
              backgroundColor: Colors.grey.withOpacity(0.3),
              primary:
                  Theme.of(context).textTheme.subtitle1?.color ?? Colors.black,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ),
        itemCount: widget.selectedItems.length,
      ),
    );
  }

  bool isSelected(String item) {
    if (widget.allowsMultipleSelection) {
      return widget.selectedItems.contains(item);
    }
    return item == widget.selectedItem;
  }

  void toggle() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void expand() {
    setState(() {
      isExpanded = true;
    });
  }

  void collapse() {
    setState(() {
      isExpanded = false;
    });
  }
}
