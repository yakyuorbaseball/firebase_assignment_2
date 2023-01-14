import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_assignment_2/model/memo.dart';
import 'package:flutter/material.dart';

enum DogCat { dog, cat }
enum Sex { man, woman }

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
      'dogCat':_dogCat,
    });
  }

  //タイトルと詳細に今のメモ状態が反映されるようにする
  //initStateのタイミングで処理
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //もしwidget.currentMemoがnullでない→更新の場合
    if(widget.currentMemo != null) {
      //widget.currentMemo != nullとしているのでcurrentMemo!でnullでないと宣言
      nameEditingController.text =widget.currentMemo!.name;
      breedEditingController.text=widget.currentMemo!.breed;
      ageEditingController.text==widget.currentMemo!.breed;
    }
  }

  //初期値の指定
  DogCat? _dogCat = DogCat.dog;
  Sex? _character1 = Sex.man;



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
                      leading: Radio<DogCat>(
                        value: DogCat.dog,
                        groupValue: _dogCat,
                        onChanged: (DogCat? value) {
                          setState(() {
                            _dogCat = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text('猫'),
                      leading: Radio<DogCat>(
                        //value：該当のラジオボタンの値。
                        value: DogCat.cat,
                        //groupValue：グループ内のラジオボタンで現在選択されている値。
                        groupValue: _dogCat,
                        //onChanged：選択変更時の処理。setState()により選択の変更をグループ内のラジオボタンに伝播させられる。
                        onChanged: (DogCat? value) {
                          setState(() {
                            _dogCat = value;
                          });
                        },
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
                      leading: Radio<Sex>(
                        value: Sex.man,
                        groupValue: _character1,
                        onChanged: (Sex? value) {
                          setState(() {
                            _character1 = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text('メス'),
                      leading: Radio<Sex>(
                        value: Sex.woman,
                        groupValue: _character1,
                        onChanged: (Sex? value) {
                          setState(() {
                            _character1 = value;
                          });
                        },
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
