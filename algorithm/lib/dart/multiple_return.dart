// https://www.youtube.com/watch?v=KhYTFglbF2k

class MultiReturn{
  (String,int) userInfo(Map<String,dynamic> json){
    return (json['name'] as String,json['age'as int]);
  }

  var json = {'name':'Isaac','age':2};

  void test(){
    // var info = userInfo(json);
    // var name = info.$0;
    // var age = info.$1;

    //destructuring
    var (name,age) = userInfo(json);

  }
}