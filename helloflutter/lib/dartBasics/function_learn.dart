

//构造方法
//实例方法
//setters 和 getters
//静态方法
//抽象方法
//私有方法
//匿名方法
//泛型方法

class TestFunction {
  FunctionLearn functionLearn = FunctionLearn();

  void start() {
    functionLearn._learn();
    functionLearn.anonymousFunction();
  }
}

class FunctionLearn {
  ///方法构成
  ///返回值类型 + 方法名 + 参数
  ///其中：返回值类型可缺省，也可为void或具体的类型
  ///方法名：匿名方法不需要方法名，下文会提到
  ///参数：参数类型和参数名，参数类型可缺省（另外，参数又分可选参数和参数默认值，可参考面向对象一节中构造方法部分的讲解）
  int sum(int val1, int val2) {
    return val1 + val2;
  }

  ///私有方法：
  ///通过_开头命名的方法
  ///作用域是当前文件
  _learn() {
    print('FunctionLearn');
  }

  ///  匿名方法：
  ///  大部分方法都带有名字，例如 main() 或者 print();
  ///  在Dart中你有可以创建没有名字的方法，称之为 匿名方法，有时候也被称为 lambda 或者 closure 闭包；
  ///  你可以把匿名方法赋值给一个变量， 然后你可以使用这个方法，比如添加到集合或者从集合中删除；
  ///  匿名方法和命名方法看起来类似— 在括号之间可以定义一些参数，参数使用逗号 分割，也可以是可选参数；
  ///  后面大括号中的代码为函数体：
  ///  ([[Type] param1[, …]]) {
  ///     codeBlock;
  ///   };
  anonymousFunction() {
    var list = ['私有方法', '匿名方法'];
    //下面的代码定义了一个参数为i （该参数没有指定类型）的匿名函数
    //list 中的每个元素都会调用这个函数来 打印出来，同时来计算了每个元素在 list 中的索引位置
    list.forEach((i) {
      print(list.indexOf(i).toString() + ': ' + i);
    });
  }
}
