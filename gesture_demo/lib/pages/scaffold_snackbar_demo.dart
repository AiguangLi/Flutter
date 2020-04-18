import 'package:flutter/material.dart';

class ScaffoldSnackBarDemo extends StatelessWidget {
  final _scallfoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///使用GlobalKey解决
      key: _scallfoldKey,
      body: Center(
        child: RaisedButton(
          child: Text('SHOW A SNACKBAR'),
          onPressed: () {
            _scallfoldKey.currentState.showSnackBar(SnackBar(
              content: Text('Have a snack!'),
            ));
          },
        ),
      ),
      appBar: AppBar(title: Text('Scaffold.of Example')),
    );
  }
}

// ...

class MyScaffoldBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('SHOW A SNACKBAR'),
        onPressed: () {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('Have a snack!'),
            ),
          );
        },
      ),
    );
  }
}
