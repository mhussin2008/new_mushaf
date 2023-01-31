import 'package:flutter/material.dart';
import 'privacy_text.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
//--------------------------------------------------------------------------

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;
  String jpg = '001';
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
      'الفاتحة',
      'البقرة',
      'آل عمران',
      'النساء',
      'المائدة',
      'الأنعام',
      'الأعراف',
      'الأنفال',
      'التوبة',
      'يونس',
      'هود',
      'يوسف',
      'الرعد',
      'إبراهيم',
      'الحجر',
      'النحل',
      'الإسراء',
      'الكهف',
      'مريم',
      'طه',
      'الأنبياء',
      'الحج',
      'المؤمنون',
      'النور',
      'الفرقان',
      'الشعراء',
      'النمل',
      'القصص',
      'العنكبوت',
      'الروم',
      'لقمان',
      'السجدة',
      'الأحزاب',
      'سبأ',
      'فاطر',
      'يس',
      'الصافات',
      'ص',
      'الزمر',
      'غافر',
      'فصلت',
      'الشورى',
      'الزخرف',
      'الدخان',
      'الجاثية',
      'الأحقاف',
      'محمد',
      'الفتح',
      'الحجرات',
      'ق',
      'الذاريات',
      'الطور',
      'النجم',
      'القمر',
      'الرحمن',
      'الواقعة',
      'الحديد',
      'المجادلة',
      'الحشر',
      'الممتحنة',
      'الصف',
      'الجمعة',
      'المنافقون',
      'التغابن',
      'الطلاق',
      'التحريم',
      'الملك',
      'القلم',
      'الحاقة',
      'المعارج',
      'نوح',
      'الجن',
      'المزمل',
      'المدثر',
      'القيامة',
      'الإنسان',
      'المرسلات',
      'النبأ',
      'النازعات',
      'عبس',
      'التكوير',
      'الانفطار',
      'المطففين',
      'الانشقاق',
      'البروج',
      'الطارق',
      'الأعلى',
      'الغاشية',
      'الفجر',
      'البلد',
      'الشمس',
      'الليل',
      'الضحى',
      'الشرح',
      'التين',
      'العلق',
      'القدر',
      'البينة',
      'الزلزلة',
      'العاديات',
      'القارعة',
      'التكاثر',
      'العصر',
      'الهمزة',
      'الفيل',
      'قريش',
      'الماعون',
      'الكوثر',
      'الكافرون',
      'النصر',
      'المسد',
      'الإخلاص',
      'الفلق',
      'الناس'
    ]
   ;
    pageNum = [
      2,3,42,64,88,107,127,151,159,176,189,202,213,219,225,230,243,254,265,271,281,289,298,306,315,321,331,339,348,
      355,360,364,366,375,381,386,391,398,403,410,418,424,429,435,437,441,445,449,452,455,458,460,463,465,468,471,474,478,
      481,484,486,488,489,491,493,495,497,499,501,503,505,507,509,510,512,513,515,517,518,520,521,522,523,524,525,526,527,
      528,529,530,531,531,532,532,533,533,534,534,535,536,536,537,537,538,538,538,539,539,539,540,540,541,541,541
    ];
  }

  void _makeFileName() {
    zeros = '';
    temp = 3 - _counter.toString().length;
    for (int i = 0; i < temp; i++) {
      zeros = zeros + '0';
    }
    jpg = zeros + _counter.toString();
    //print(jpg);
  }

  void _incrementCounter() {
    if (_counter >= 543) {
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
        title: const Text('المصحف الشريف'),
        actions: [
          IconButton(
           onPressed: () async {
              var prefs=await SharedPreferences.getInstance();
              //prefs.setInt('ref', _counter).then((value) => print('saved $_counter'));
              _counter = await prefs.setInt('ref', _counter).then((bool success) {
                return _counter;});
              setState(()  {
                _counter;
                });}
             , icon: Icon(Icons.save)
          ),
          IconButton(
              onPressed: () async {
                var prefs=await SharedPreferences.getInstance();

                setState(() {
                  _counter=prefs.getInt('ref')!;
                  _makeFileName();
                  print(_counter);
                });
                }
              , icon: Icon(Icons.download)
          ),

          IconButton(onPressed: (){
          setState(() {
          privacy=!privacy;print(privacy);
         // print('pages'+pageNum.length.toString());
         // print('surah'+myIndex.length.toString());
          });


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
                          _counter = pageNum[index] ;
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
            child: Image.asset('assets/quran_pages/' + 'mushaf_page'+jpg + '.jpg')),
      ):SingleChildScrollView(child: Text(privacy_text)),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
