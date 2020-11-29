import 'package:flushbar/flushbar.dart';
import 'package:flushbar_example/widget/button_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'Flushbar Example';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.red),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Flushbar> flushBars = [];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: 'Top SnackBar',
                onClicked: () => showTopSnackBar(context),
              ),
              const SizedBox(height: 16),
              ButtonWidget(
                text: 'Blurred SnackBar',
                onClicked: () => showBlurredSnackBar(context),
              ),
              const SizedBox(height: 16),
              ButtonWidget(
                text: 'Dismiss SnackBar',
                onClicked: () => showDismissSnackBar(context),
              ),
              const SizedBox(height: 16),
              ButtonWidget(
                text: 'Gradient SnackBar',
                onClicked: () => showGradientSnackBar(context),
              ),
            ],
          ),
        ),
      );

  void showTopSnackBar(BuildContext context) => show(
        context,
        Flushbar(
          icon: Icon(Icons.error, size: 32, color: Colors.white),
          shouldIconPulse: false,
          title: 'Title',
          message: 'Hello',
          mainButton: FlatButton(
            child: Text(
              'Click Me',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onPressed: () {},
          ),
          onTap: (_) {
            print('Clicked bar');
          },
          duration: Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
          margin: EdgeInsets.fromLTRB(8, kToolbarHeight + 8, 8, 0),
          borderRadius: 16,
        ),
      );

  void showBlurredSnackBar(BuildContext context) => show(
        context,
        Flushbar(
          icon: Icon(Icons.error, size: 32, color: Colors.white),
          shouldIconPulse: false,
          title: 'Title',
          message: 'Hello',
          mainButton: FlatButton(
            child: Text(
              'Click Me',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onPressed: () {},
          ),
          onTap: (_) {
            print('Clicked bar');
          },
          padding: EdgeInsets.all(24),
          flushbarPosition: FlushbarPosition.TOP,
          margin: EdgeInsets.fromLTRB(8, kToolbarHeight + 8, 8, 0),
          duration: Duration(seconds: 3),
          borderRadius: 16,
          barBlur: 20,
          backgroundColor: Colors.black.withOpacity(0.5),
        ),
      );

  void showDismissSnackBar(BuildContext context) => show(
        context,
        Flushbar(
          icon: Icon(Icons.error, size: 32, color: Colors.white),
          shouldIconPulse: false,
          title: 'Title',
          message: 'Hello',
          mainButton: FlatButton(
            child: Text(
              'Click Me',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onPressed: () {},
          ),
          onTap: (_) {
            print('Clicked bar');
          },
          flushbarPosition: FlushbarPosition.TOP,
          margin: EdgeInsets.fromLTRB(8, kToolbarHeight + 8, 8, 0),
          borderRadius: 16,
          backgroundColor: Colors.blue.withOpacity(0.7),
          barBlur: 20,
          padding: EdgeInsets.all(24),
          animationDuration: Duration(microseconds: 0),
          dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        ),
      );

  void showGradientSnackBar(BuildContext context) => show(
        context,
        Flushbar(
          animationDuration: Duration(microseconds: 0),
          icon: Icon(Icons.error, size: 32, color: Colors.white),
          shouldIconPulse: false,
          title: 'Title',
          message: 'Hello',
          mainButton: FlatButton(
            child: Text(
              'Click Me',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onPressed: () {},
          ),
          padding: EdgeInsets.all(24),
          flushbarPosition: FlushbarPosition.TOP,
          margin: EdgeInsets.fromLTRB(8, kToolbarHeight + 8, 8, 0),
          duration: Duration(seconds: 3),
          borderRadius: 16,
          backgroundGradient: LinearGradient(
            colors: [Colors.red, Colors.orange],
          ),
          boxShadows: [
            BoxShadow(
              color: Colors.red,
              offset: Offset(2, 2),
              blurRadius: 8,
            )
          ],
        ),
      );

  Future show(BuildContext context, Flushbar newFlushBar) async {
    await Future.wait(flushBars.map((flushBar) => flushBar.dismiss()).toList());
    flushBars.clear();

    newFlushBar.show(context);
    flushBars.add(newFlushBar);
  }
}
