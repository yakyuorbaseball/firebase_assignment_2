class Memo{
  String id;
  String name;
  String breed;
  String age;

  //コンストラクタ→クラスのインスタンスを生成する際に呼び出されるメソッド　クラス名(this.要素の変数名);
  //設計図から実在するものを生成するときに動いてくれるメソッドのこと
  Memo({
    //required必須項目を指定
    required this.id,
    required this.name,
    required this.breed,
    required this.age

  });
}