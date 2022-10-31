import 'package:flutter/material.dart';
import 'privacy_text.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
//--------------------------------------------------------------------------

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;
  String jpg = '0001';
  String zeros = '';
  int temp = 0;
  List<String> myIndex = [''];
  List<int> pageNum = [0];
  bool privacy=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    myIndex = [
      'مقدمة',
      'تسمية الوقوف',
      'وقف السنة',
      'الوقف اللازم',
      'الوقف التام',
      'الوقف الكافى',
      'الوقف الحسن',
      'الوقف الصالح',
      'الوقف الجائز',
      'وقف المعانقة',
      'الوقف القبيح',
      'الوقف على رؤوس الآى',
      'الابتداء',
      'فصل فى ذكر مسائل مهمة',
      'مواضع عدم الوقف السبعة',
      'المواضع الخمسة التى يترجح فيها الوصل',
      'الوقف على (كلا)',
      'وقف الازدواج',
      'الوقف على (ذلك)',
      'الوقف على (كذلك)',
      'الوقف على (هذا)',
      'معنى الوقف والسكت والقطع',
      'خاتمة'
    ];
    pageNum = [
      3,
      10,
      12,
      14,
      16,
      25,
      28,
      32,
      35,
      37,
      39,
      49,
      69,
      71,
      120,
      125,
      132,
      168,
      172,
      176,
      179,
      182,
      184
    ];
  }

  void _makeFileName() {
    zeros = '';
    temp = 4 - _counter.toString().length;
    for (int i = 0; i < temp; i++) {
      zeros = zeros + '0';
    }
    jpg = zeros + _counter.toString();
    //print(jpg);
  }

  void _incrementCounter() {
    if (_counter >= 197) {
      return;
    }
    setState(() {
      _counter++;
      _makeFileName();
    });
  }

  void _decrementCounter() {
    if (_counter < 2) {
      return;
    }
    setState(() {
      _counter--;
      _makeFileName();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('كتاب معالم الاهتداء للحصرى'),
        actions: [IconButton(onPressed: (){
          setState(() {privacy=!privacy;print(privacy);  });


          //launchUrl(Uri(path:'https://github.com/mhussin2008/mohamed-privacy/blob/main/privacy-policy.md'));
        }, icon: Icon(Icons.privacy_tip))],

      ),
      drawer: SafeArea(
        child: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: myIndex.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Text(' ${pageNum[index]}'),
                            Expanded(
                                child: SizedBox(
                                    child: Text(
                              myIndex[index],
                              textAlign: TextAlign.right,
                            ))),
                            //
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _counter = pageNum[index] + 2;
                          privacy=true;
                          _makeFileName();
                        });
                        Navigator.pop(context);
                      });
                })),
      ),
      // appBar: AppBar(title: Text(widget.title), ),
      body: privacy? 
      Dismissible(
        key: ValueKey(_counter),
        resizeDuration: null,
        onDismissed: (DismissDirection direction) {
          if (direction == DismissDirection.endToStart) {
            _incrementCounter();
          } else {
            _decrementCounter();
          }
        },
        child: Center(
            child: Image.asset('assets/jpg/' + jpg + '.jpg')),
      ):SingleChildScrollView(child: Text(privacy_text)),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
