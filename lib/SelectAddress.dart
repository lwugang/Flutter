import 'package:flutter/material.dart';

/// 选择地址页面
class SelectAddressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SelectAddressPage();
  }
}

class SelectAddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: IconButton(
            icon: const BackButtonIcon(),
            onPressed: () {
              print(Navigator.canPop(context));
              Navigator.pop(context);
            }),
        title: new Text("选择地址"),
        centerTitle: true,
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return ListView.builder(itemBuilder: (context, it) {
      if (it.isOdd) {
        return new Divider(
          height: 10,
        );
      }
      return buildRow(context,it.toInt());
    });
  }

  Widget buildRow(BuildContext context,int i) {
    return new ListTile(
      title: new Text("地址" + i.toString()),
      onTap: (){_onListItemClick(context,i);},
    );
  }

  void _onListItemClick(BuildContext context, int i) {
    Navigator.pop(context,"地址"+i.toString());
  }
}
