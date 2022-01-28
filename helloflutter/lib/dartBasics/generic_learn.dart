
import 'package:helloflutter/dartBasics/oop_learn.dart';

//入口方法
//构造方法
//实例方法
//setters 和 getters
//静态方法
//抽象方法
//私有方法
//匿名方法
//泛型方法

class TestGeneric {

  void start() {
    //泛型
    Cache<String> cache1 = Cache();
    cache1.setItem('cache1', 'cache1'); //泛型作用：类型检查约束类比：List<String>
    String string1 = cache1.getItem('cache1');
    print(string1);

    Cache<int> cache2 = Cache();
    cache2.setItem('cache2', 1008);
    int int1 = cache2.getItem('cache2');
    print(int1);

    Member<Student> member = Member(Student('', '', 16));
    print(member.fixedName());
  }
}

///泛型：
///通俗理解：泛型主要是解决类、接口、方法的复用性、以及对不特定数据类型的支持

///泛型类
///泛型作用：提高代码服用度
class Cache<T> {
  static final Map<String, Object> _cached = Map();

  void setItem(String key, T value) {
    _cached[key] = value as Object;
  }

  ///泛型方法
  T getItem(String key) {
    return _cached[key] as T;
  }
}

///有时候你在实现类似通用接口的泛型中，期望的类型是某些特定类型时，这时可以使用类型约束
class Member<T extends Person> {
  final T _person;

  ///泛型作用：约束参数类型
  Member(this._person);

  String fixedName() {
    return 'fixed:${_person.name}';
  }
}
