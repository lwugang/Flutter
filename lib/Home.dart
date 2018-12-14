import 'package:flutter/material.dart';
import 'package:flutter_app/SelectAddress.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new HomePageState();
  }
}

class HomePageState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePage();
  }
}

class HomePage extends State<HomePageState> {
  List<String> bodyContents = new List();

  @override
  Widget build(BuildContext context) {
    return createHome(context);
  }

  Widget buildRow(BuildContext context, int i) {
    return new ListTile(
      title: new Text(bodyContents.elementAt(i)),
      onTap: () {
        // item点击事件
        Scaffold.of(context).showSnackBar(new SnackBar(
            content: new Text(bodyContents.elementAt(i)),
            action: new SnackBarAction(
              label: "确定",
              onPressed: () {
                print("close");
              },
            )));
      },
    );
  }

  Widget createBodyContent() {
    return new ListView.builder(
        itemCount: bodyContents.length,
        padding: EdgeInsets.all(16),
        itemBuilder: (context, it) {
          return new Column(children: <Widget>[
            buildRow(context, it.toInt()),
            new Divider(
              height: 10,
            )
          ]);
        });
  }

  /// 右边菜单被点击
  _onRightMenuClick(BuildContext context) {
    Navigator.push<String>(
            context,
            new MaterialPageRoute(
                builder: (context) => new SelectAddressWidget()))
        .then((String ret) {
          if(ret==null)
            return;
        setState(() {
          bodyContents.add(ret);
        });
    });
  }

  Widget createHome(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        actions: <Widget>[
          new FlatButton(
            child: new Text("添加"),
            textColor: Colors.white,
            onPressed: () {
              _onRightMenuClick(context);
            },
          )
        ],
        title: new Text("首页"),
        centerTitle: true,
      ),
      body: createBodyContent(),
    );
  }
}
