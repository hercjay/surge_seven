

class Globals {
  // Add your global variables here
  String appName = "Surge Seven";
  //UserEntity? userEntity;

  static Globals? _globals;

  //get all necessary globals data
  void initGlobals() async {

  }

  //get the instance of the globals
  static Globals getInstance() {
    if (_globals == null) {
      _globals = Globals();
      _globals?.initGlobals();
    }
    // dPrint('globals instance gotten with universities list : ${_globals?.universities}');
    return _globals!;
  }
}

//create instance to be used throughout the app
final globals = Globals.getInstance();

