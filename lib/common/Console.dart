

class Console{
  // Console._();
  //
  // static final instance = Console._();
  //
  // factory Console.getInstance() => instance;

  static void infos(List<dynamic> targets){
    var time = new DateTime.now();
    for(var i = 0 ; i < targets.length ; i ++){
      var target = targets[i];
      print('[$time] - $target');
    }
  }

  static void info(dynamic target){
    var time = new DateTime.now();
    print('[$time] - $target');
  }
}