import 'package:flutter/material.dart';

const double kTextAndIconHeight = 53.0;
const double kMarginBottom = 3.0;
class IconTab extends StatefulWidget{
  const IconTab({Key key,this.text,this.icon,this.color}):super(key:key);
  final String text;
  final String icon;
  final Color color;
  @override
  _IconTabState createState() => _IconTabState();

}
class _IconTabState extends State<IconTab>{
  Widget buildLabelText() => Text(widget.text,softWrap: false,overflow: TextOverflow.fade,style: TextStyle(color: widget.color),);
  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    double height = kTextAndIconHeight;
    Widget label = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //图标
        Container(
          child: Image(image: AssetImage(widget.icon), height: 30, width: 30,),
          margin: const EdgeInsets.only(bottom: kMarginBottom),
        ),
        //文本
        buildLabelText()
      ],
    );
    return SizedBox(
      height: height,
      child: Center(
        child: label,
        widthFactor: 1.0,
      ),
    );
  }

}