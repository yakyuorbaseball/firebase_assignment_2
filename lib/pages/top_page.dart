import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_assignment_2/model/memo.dart';
import 'package:firebase_assignment_2/pages/add_page.dart';
import 'package:flutter/material.dart';

class topPage extends StatefulWidget {
  const topPage({Key? key, required this.title}) :super(key: key);
  final String title;

  @override
  State<topPage> createState() => _topPageState();
}

class _topPageState extends State<topPage> {
  //追加したメモをリアルタイムで取得
  //取得した値の並べ替えorderBy('createdDate', descending: true)
  //descending: trueで新しい順
  //where('title', isEqualTo: 'test5')にすると、test5と一致するtitleだけが取得
  var memoCollection =
  FirebaseFirestore.instance.collection('memo').orderBy('name').snapshots();

  var _selectedValue = '"犬のみ';
  var _popMenu = ["犬のみ", "猫のみ", "年齢:昇順","年齢:降順"];




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<String>(
            initialValue: _selectedValue,
            onSelected: (String s) {
              if(s == _popMenu[0]){
                setState(() {
                  memoCollection =
                      FirebaseFirestore.instance.collection('memo').where('dogCat', isEqualTo: '犬').snapshots();
                });
              }else if(s == _popMenu[1]) {
                setState(() {
                  memoCollection =
                      FirebaseFirestore.instance.collection('memo').where('dogCat', isEqualTo: '猫').snapshots();
                });
              }else if(s == _popMenu[2]) {
                setState(() {
                  memoCollection =
                      FirebaseFirestore.instance.collection('memo').orderBy('age', descending: false).snapshots();
                });
              }else if(s == _popMenu[3]) {
                setState(() {
                  memoCollection =
                      FirebaseFirestore.instance.collection('memo').orderBy('age', descending: true).snapshots();
                });
              }
            },
            itemBuilder: (BuildContext context) {
              return _popMenu.map((String s) {
                return PopupMenuItem(
                  child: Text(s),
                  value: s,
                );
              }).toList();
            },
          )
        ],
      ),
      //StreamBuilder追加したメモをリアルタイムで取得
      body: StreamBuilder<QuerySnapshot>(
          stream: memoCollection,
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              //グルグルマークで待つ
              return const CircularProgressIndicator();
            }
            //final docs = snapshot.data.docs;でnullの可能性があるとしているので、
            //！snapshot.hasDataでsnapshot.hasDataでない（頭に！）場合の処理
            if(!snapshot.hasData) {
              return const Center(child: Text('データがありません'),);
            }
            //if(!snapshot.hasData)の分岐を乗り越えてるので、snapshotはデータを持っているので
            //data!nullでないと記述
            final docs = snapshot.data!.docs;

            return ListView.builder(
                itemCount: docs.length,
                //indexは初めの値は0で、繰り返し表示をしようとするたびにプラス１されていく値
                itemBuilder: (context, index) {
                  //docs[index].data()をMap<String, dynamic>型として扱うという指示
                  Map<String, dynamic> data = docs[index].data() as Map<String, dynamic>;
                  final Memo fetchMemo = Memo(
                    id: docs[index].id,
                    name: data['name'],
                    breed: data['breed'],
                    age: data['age'],
                    sex: data['sex'],
                  );
                  return Card(
                    child: Expanded(
                      child: ListTile(
                        //itemBuilder: (context, index)のindexをmemoList[index].titleに入れることで
                        //memoListの値を順番に取得する指示を出せる
                          title: Text(
                              '名前:' + fetchMemo.name + '    '+'''品種:''' + fetchMemo.breed + '''    ''' + '    '+'''性別:'''+ fetchMemo.sex + '    '+ '''年齢:''' + fetchMemo.age
                          )
                      ),
                    ),
                  );
                }
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddMemoPage()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
