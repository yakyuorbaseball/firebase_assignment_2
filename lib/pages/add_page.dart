import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_assignment_2/model/memo.dart';
import 'package:flutter/material.dart';

class AddMemoPage extends StatefulWidget {
  final Memo? currentMemo;
  const AddMemoPage({Key? key,this.currentMemo}) : super(key: key);

  @override
  _AddMemoPageState createState() => _AddMemoPageState();
}

class _AddMemoPageState extends State<AddMemoPage> {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController breedEditingController = TextEditingController();
  TextEditingController ageEditingController = TextEditingController();


  //メモを作成する処理をメソッドとして定義
  Future<void> createMemo() async{
    final memoCollection = FirebaseFirestore.instance.collection('memo');
    //memoCollectionに対して新しい情報を追加する
    await memoCollection.add({
      //TextFieldに入力されているtitleEditingControllerの情報をtextスタイルで
      'name': nameEditingController.text,
      'breed': breedEditingController.text,
      'age': ageEditingController.text,
      'dogCat': _type,
      'sex': _type2,
    });
  }

  String _type = '';

  void _handleRadio(String? value) => setState(() {_type = value!;});

  String _type2 = '';

  void _handleRadio2(String? value) => setState(() {_type2 = value!;});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            //左寄せ
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              //TextFieldから入力欄を作成
              //TextFieldの入力欄を調整→Container
              Container(
                //TextFieldの入力欄の周りが囲われる
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                ),
                //MediaQuery.of(context).size.widthで画面幅いっぱい。これに*0.8で画面幅に対して80％
                width: MediaQuery.of(context).size.width*0.8,
                child: TextField(
                  //textEditingControllerを入れる
                  controller: nameEditingController,
                  decoration: const InputDecoration(
                      hintText: '名前',
                      border: InputBorder.none,
                      //入力開始位置の調整leftに対して10の余白
                      contentPadding: EdgeInsets.only(left: 10)
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      title: const Text('犬'),
                      leading: Radio(
                        activeColor: Colors.blue,
                        value: '犬',
                        groupValue: _type,
                        onChanged: _handleRadio,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text('猫'),
                      leading: Radio(
                        activeColor: Colors.blue,
                        //value：該当のラジオボタンの値。
                        value: '猫',
                        //groupValue：グループ内のラジオボタンで現在選択されている値。
                        groupValue: _type,
                        //onChanged：選択変更時の処理。setState()により選択の変更をグループ内のラジオボタンに伝播させられる。
                        onChanged: _handleRadio,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              //TextFieldから入力欄を作成
              //TextFieldの入力欄を調整→Container
              Container(
                //TextFieldの入力欄の周りが囲われる
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  //MediaQuery.of(context).size.widthで画面幅いっぱい。これに*0.8で画面幅に対して80％
                  width: MediaQuery.of(context).size.width*0.8,
                  child: TextField(
                    controller: breedEditingController,
                    decoration: const InputDecoration(
                        hintText: '品種',
                        border: InputBorder.none,
                        //入力開始位置の調整leftに対して10の余白
                        contentPadding: EdgeInsets.only(left: 10)
                    ),
                  )
              ),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      title: const Text('オス'),
                      leading: Radio(
                        activeColor: Colors.blue,
                        value: 'オス',
                        groupValue: _type2,
                        onChanged: _handleRadio2,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text('メス'),
                      leading: Radio(
                        activeColor: Colors.blue,
                        value: 'メス',
                        groupValue: _type2,
                        onChanged: _handleRadio2,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                //TextFieldの入力欄の周りが囲われる
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  //MediaQuery.of(context).size.widthで画面幅いっぱい。これに*0.8で画面幅に対して80％
                  width: MediaQuery.of(context).size.width*0.8,
                  child: TextField(
                    //textEditingControllerを入れる
                    controller: ageEditingController,
                    decoration: const InputDecoration(
                        hintText: '年齢',
                        border: InputBorder.none,
                        //入力開始位置の調整leftに対して10の余白
                        contentPadding: EdgeInsets.only(left: 10)
                    ),
                  )
              ),
              const SizedBox(height: 40),
              Container(
                width: MediaQuery.of(context).size.width*0.8,
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () async{
                    //メモを作成する処理を記述
                    await createMemo();
                    //登録ボタンを押すと元のページに戻る
                    Navigator.pop(context);
                  },
                  child: Text('登録'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
