import 'package:flutter/material.dart';

// tools
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

// models
import 'package:you_are_programmer/models/global_app_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('就不好好说话 >_<'),
        centerTitle: true,
      ),

      // Body Root Column
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),

          // Noitce Block
          HomePageNoticeBar(),
          Expanded(child: HomePageForm()),
        ],
      ),
    );
  }
}

class HomePageNoticeBar extends StatelessWidget {
  const HomePageNoticeBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 30,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Theme.of(context).secondaryHeaderColor),
        child: Center(
          child: Text(
            '输入你想说的话，选择语言后即可生成啦！',
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );
  }
}

// Homepage Text Function Form
class HomePageForm extends StatefulWidget {
  const HomePageForm({super.key});

  @override
  State<HomePageForm> createState() => _HomePageFormState();
}

class _HomePageFormState extends State<HomePageForm> {
  final GlobalKey<FormState> textFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, GlobalAppInfo globalAppInfo, child) {
      return Form(
        key: textFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),

          // Form Column Part
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // Childrens
            children: [
              // Choose Language
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: DropdownButtonFormField(
                    value: 'C',
                    focusColor: Colors.transparent,
                    items: genDropDownItems(globalAppInfo.getLangList()),
                    onChanged: ((value) {
                      String lang = value.toString();
                      globalAppInfo.changeLang(lang);
                    })),
              ),

              // input form
              Expanded(
                flex: 1,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: Container(
                      child: TextFormField(
                    maxLines: 100,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20))),
                    onChanged: (value) {
                      print(value);
                      globalAppInfo.setText(value);
                    },
                  )),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: TextFormField(
                    controller: TextEditingController.fromValue(
                        TextEditingValue(text: globalAppInfo.getGenText())),
                    // initialValue: globalAppInfo.getGenText(),
                    maxLines: 100,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)))),
                    onPressed: (() async {
                      Clipboard.setData(
                          ClipboardData(text: globalAppInfo.getGenText()));
                      SmartDialog.showToast('成功复制到剪贴板');
                    }),
                    child: Text(
                      '复制到设备剪贴板',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }));
  }
}

// Generate DropdownItems
List<DropdownMenuItem<String>> genDropDownItems(List<String> stringList) {
  String lang;
  List<DropdownMenuItem<String>> itemList = [];
  for (lang in stringList) {
    itemList.add(DropdownMenuItem(
      value: lang,
      child: Text(lang),
    ));
  }

  return itemList;
}
