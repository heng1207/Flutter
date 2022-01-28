

///定一个Dart类，所有类都继承自Object
class Person {
  final String name;
  final int age;

  ///标准的构造方法
  ///类的构造方法，用于初始化类的对象
  Person(this.name,this.age);

  ///重写父类方法
  @override
  String toString() {
    return 'name:$name, age:$age';
  }
}

class Student extends Person{
  ///定义类的变量
  late String _school;///通过下划线来标识私有字段（变量）
  final String? city; ///可空的属性：通过?进行修饰
  final String country; ///在构造函数中设置默认值或者通过required进行修饰
  @override
  final String name;

  ///构造方法： 快捷键 option+return
  ///初始化子类的构造方法，必须先调用父类的构造方法
  ///通this.school初始化自有参数
  ///name,age交给父类进行初始化
  ///city为可选参数
  ///country设有默认参数
  Student(this._school,String name, int age,{this.city, this.country = 'China'})
  //初始化列表：除了调用父类构造器，在子类构造器方法体之前，你也可以初始化实例变量，不同的初始化变量之间用逗号分隔开
      :name = '$_school.$city',
  //如果父类没有默认构造方法（无参构造方法），则需要在初始化列表中调用父类构造方法进行初始化
        super(name, age){
    //构造方法体不是必须的
    print('构造方法体不是必须的');
  }


  //命名构造方法：[类名+.+方法名]
  //使用命名构造方法为类实现多个构造方法
  Student.cover(Student stu, this._school, this.city, this.country, this.name) : super(stu.name, stu.age) {
    print('命名构造方法');
  }

  //命名工厂构造方法：factory [类名+.+方法名]
  //它可以有返回值，而且不需要将类的final变量作为参数，是提供一种灵活获取类对象的方式
  factory Student.stu(Student stu){
    return Student(stu._school,stu.name,stu.age,city: stu.city,country: stu.country);
  }

  @override
  String toString() {
    return 'name:$name school:${this._school},city:$city,country:$country ${super.toString()}';
  }

  //可以为私有字段设置getter来让外界获取到私有字段
  String get school => _school;

  //可以为私有字段设置setter来控制外界对私有字段的修改
  set school(String value){
    _school = value;
  }

  //静态方法
  static doPrint(String str) {
    print('doPrint:$str');
  }
  ///科普小知识：实例方法，对象的实例方法可以访问到实例变量与this，如上述代码中的toString
}



///工厂构造方法演示
class Logger extends Object {
  static Logger? _cache;

//  工厂构造方法：
//  不仅仅是构造方法，更是一种模式
//  有时候为了返回一个之前已经创建的缓存对象，原始的构造方法已经不能满足要求
//  那么可以使用工厂模式来定义构造方法
  factory Logger() {
    _cache ??= Logger._internal();
    return _cache!;
  }
  Logger._internal();

  void log(String msg) {
    print(msg);
  }
}


///使用 abstract 修饰符来定义一个抽象类，该类不能被实例化。抽象类在定义接口的时候非常有用，实际上抽象中也包含一些实现
abstract class Study {
  void study();
}

///继承抽象类要实现它的抽象方法，否则也需要将自己定义成抽象类
class StudyFlutter extends Study {
  @override
  void study() {
    print('Learning Flutter');
  }
}

///为类添加特征：mixins
///mixins 是在多个类层次结构中重用代码的一种方式
///要使用 mixins ，在 with 关键字后面跟一个或多个 mixin 的名字(用逗号分开)，并且with要用在extends关键字之后
///mixins的特征：实现 mixin ，就创建一个继承 Object 类的子类(不能继承其他类)，不声明任何构造方法，不调用 super
///猜猜上面的类中哪个是mixin？

class Test extends Person with Study {
  Test(String name, int age) : super(name, age);

  @override
  void study() {
    // TODO: implement study
  }
}