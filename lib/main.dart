import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provide/provide.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:plpidb/pages/CollectPage.dart';
import 'package:plpidb/pages/about.dart';
import 'package:plpidb/pages/articleDetail.dart';
import 'package:plpidb/pages/homePage.dart';
import 'package:plpidb/pages/naviPage.dart';
import 'package:plpidb/pages/projectPage.dart';
import 'package:plpidb/pages/searchPage.dart';
import 'package:plpidb/pages/treePage.dart';
import 'package:plpidb/res/colors.dart';
import 'package:plpidb/res/strings.dart';
import 'package:plpidb/util/favoriteProvide.dart';
import 'package:plpidb/util/themeProvide.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'common/api.dart';
import 'generated/l10n.dart';
import 'http/httpUtil.dart';

void main() async {

    //runApp前调用，初始化绑定，手势、渲染、服务等
    WidgetsFlutterBinding.ensureInitialized();

    //初始化
    var theme = ThemeProvide();
    var favorite = FavoriteProvide();
    var providers = Providers();

    //将theme,favorite加到providers中
    providers
        ..provide(Provider.function((context) => theme))
        ..provide(Provider.function((context) => favorite));

    int themeIndex = await getTheme();

    runApp(ProviderNode(
        providers: providers,
        child: MyApp(themeIndex),
    ));
}

Future<int> getTheme() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    int themeIndex = sp.getInt("themeIndex");
    return null == themeIndex ? 0 : themeIndex;
}

class MyApp extends StatelessWidget {
    // This widget is the root of your application.
    final int themeIndex;

    MyApp(this.themeIndex);

    @override
    Widget build(BuildContext context) {
        return Provide<ThemeProvide>(
            builder: (context, child, theme) {
                return MaterialApp(
                    // ignore: missing_return
                    localeResolutionCallback: (deviceLocale, supportedLocales) {
                        print('deviceLocale: $deviceLocale');
                    },
                    localizationsDelegates: [
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                        const AppLocalizationDelegate(),
                        S.delegate,
                    ],
                    supportedLocales: [
                        const Locale('en','US'),
                        const Locale.fromSubtags(languageCode: 'zh'), // generic Chinese 'zh'
                        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'), // generic simplified Chinese 'zh_Hans'
                        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'), // generic traditional Chinese 'zh_Hant'
                        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans', countryCode: 'CN'), // 'zh_Hans_CN'
                        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW'), // 'zh_Hant_TW'
                        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant', countryCode: 'HK'), // 'zh_Hant_HK'
                        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant', countryCode: 'MO'), // 'zh_Hant_MO'
                    ],
                    title: YStrings.appName + "3",
                    theme: ThemeData(
                        // This is the theme of your application.
                        //除了primaryColor，还有brightness、iconTheme、textTheme等等可以设置
                        primaryColor: YColors.themeColor[theme.value != null
                            ? theme.value
                            : themeIndex]["primaryColor"],
                        primaryColorDark: YColors.themeColor[theme.value != null
                            ? theme.value
                            : themeIndex]["primaryColorDark"],
                        accentColor: YColors.themeColor[
                        theme.value != null ? theme.value : themeIndex]["colorAccent"]

//              primaryColor: YColors.colorPrimary,
//              primaryColorDark: YColors.colorPrimaryDark,
//              accentColor: YColors.colorAccent,
//              dividerColor: YColors.dividerColor,
                    ),
                    home: MyHomePage(title: YStrings.appName + "2"),
                );
            },
        );
    }
}

class MyHomePage extends StatefulWidget {
    MyHomePage({Key key, this.title}) : super(key: key);

    final String title;

    @override
    _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    int _selectedIndex = 0;
    String title = YStrings.appName;

    var _pageController = PageController(initialPage: 0);

    var pages = <Widget>[
        HomePage(),
        TreePage(),
        NaviPage(),
        ProjectPage(),
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(S.of(context).title),
                actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.search),
                        tooltip: '搜索',
                        onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SearchPage()),
                            );
                        },
                    ),
                ],
            ),
            body: PageView.builder(
                onPageChanged: _pageChange,
                controller: _pageController,
                itemCount: pages.length,
                itemBuilder: (BuildContext context, int index) {
                    return pages.elementAt(_selectedIndex);
                },
            ),
            bottomNavigationBar: BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        title: Text(S.of(context).home),
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.filter_list),
                        title: Text(S.of(context).tree),
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.low_priority),
                        title: Text(S.of(context).navi),
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.apps),
                        title: Text(S.of(context).project),
                    ),
                ],
                //当前选中下标
                currentIndex: _selectedIndex,
                //显示模式
                type: BottomNavigationBarType.fixed,
                //选中颜色
                fixedColor: Theme.of(context).primaryColor,
                //点击事件
                onTap: _onItemTapped,
            ),
            floatingActionButton: FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: showToast,
                tooltip: '点击选中最后一个',
                child: Icon(Icons.add, color: Colors.white),
            ),
            drawer: showDrawer(),
        );
    }

    void _onItemTapped(int index) {
        //bottomNavigationBar 和 PageView 关联
        _pageController.animateToPage(index,
            duration: Duration(milliseconds: 300), curve: Curves.ease);
    }

    void _pageChange(int index) {
        setState(() {
            _selectedIndex = index;
            //根据下标修改标题
            switch (index) {
                case 0:
                    title = S.of(context).appName;
                    break;
                case 1:
                    title = S.of(context).tree;
                    break;
                case 2:
                    title = S.of(context).navi;
                    break;
                case 3:
                    title = S.of(context).project;
                    break;
            }
        });
    }

    void showToast() {
        Fluttertoast.showToast(
            msg: "选中最后一个",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: YColors.colorPrimaryDark,
            textColor: Colors.white,
            fontSize: 16.0,
        );
        _onItemTapped(3);
    }

    Widget showDrawer() {
        return Drawer(
            child: ListView(
                //ListView padding 不为空的时候，Drawer顶部的状态栏就不会有灰色背景
                padding: EdgeInsets.zero,
                children: <Widget>[
                    UserAccountsDrawerHeader(
                        //头像
                        currentAccountPicture: GestureDetector(
                            //圆形头像
                            child: ClipOval(
                                child: Image.network(
                                    'https://avatar.csdnimg.cn/C/0/1/1_yechaoa.jpg'),
                            ),
                            onTap: () {
                                Navigator.of(context).pop();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => AboutPage()),
                                );
                            },
                        ),
                        //其他头像
                        otherAccountsPictures: <Widget>[
                            IconButton(
                                icon: Icon(
                                    Icons.stars,
                                    color: Colors.white,
                                ),
                                onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ArticleDetail(
                                                title: "点个star",
                                                url:
                                                "https://github.com/yechaoa/plpidb"),
                                        ),
                                    );
                                })
                        ],
                        accountName: Text(
                            S.of(context).proName,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        accountEmail: Text(YStrings.github),
                    ),

                    ///功能列表
                    ListTile(
                        leading: Icon(Icons.favorite_border),
                        title: Text("我的收藏"),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CollectPage()),
                            );
                        },
                    ),
                    ListTile(
                        leading: Icon(Icons.color_lens),
                        title: Text("切换主题"),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () {
                            Navigator.of(context).pop();
                            showThemeDialog();
                        },
                    ),
                    ListTile(
                        leading: Icon(Icons.share),
                        title: Text("我要分享"),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () {
                            Navigator.of(context).pop();
                            Share.share(
                                '【' + S.of(context).appName + '】\nhttp://www.plpidb.com');
                        },
                    ),
                    ListTile(
                        leading: Icon(Icons.info_outline),
                        title: Text("关于项目"),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () {
                            //先关闭再跳转
                            Navigator.of(context).pop();
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AboutPage()),
                            );
                        },
                    ),

                    Divider(),

                    ListTile(
                        leading: Icon(Icons.block),
                        title: Text("退出"),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () {
                            //关闭drawer
                            Navigator.of(context).pop();
                            showLogoutDialog();
                        },
                    ),
                ],
            ),
        );
    }

    void showLogoutDialog() {
        showDialog<void>(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
                return AlertDialog(
                    title: Text('提示'),
                    content: SingleChildScrollView(
                        child: ListBody(
                            children: <Widget>[
                                Text('确认退出吗？'),
                            ],
                        ),
                    ),
                    actions: <Widget>[
                        FlatButton(
                            child: Text('取消', style: TextStyle(color: YColors.primaryText)),
                            onPressed: () {
                                Navigator.of(context).pop();
                            },
                        ),
                        FlatButton(
                            child: Text('确定'),
                            onPressed: () {
                                //退出
                                HttpUtil().get(Api.LOGOUT);
                                Navigator.of(context).pop();
                            },
                        ),
                    ],
                );
            },
        );
    }

    void showThemeDialog() {
        showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
                return AlertDialog(
                    title: Text('切换主题'),
                    content: SingleChildScrollView(
                        child: Container(
                            //包含ListView要指定宽高
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: YColors.themeColor.keys.length,
                                itemBuilder: (BuildContext context, int position) {
                                    return GestureDetector(
                                        child: Container(
                                            padding: EdgeInsets.all(20.0),
                                            margin: EdgeInsets.only(bottom: 15),
                                            color: YColors.themeColor[position]["primaryColor"],
                                        ),
                                        onTap: () async {
                                            Provide.value<ThemeProvide>(context).setTheme(position);
                                            //存储主题下标
                                            SharedPreferences sp =
                                            await SharedPreferences.getInstance();
                                            sp.setInt("themeIndex", position);
                                            Navigator.of(context).pop();
                                        },
                                    );
                                },
                            ),
                        ),
                    ),
                    actions: <Widget>[
                        FlatButton(
                            child: Text('关闭',
                                style: TextStyle(color: Theme.of(context).primaryColor)),
                            onPressed: () {
                                Navigator.of(context).pop();
                            },
                        ),
                    ],
                );
            },
        );
    }
}
