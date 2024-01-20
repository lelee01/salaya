
class lcomp {
  static lcomp? _storedList;

  static lcomp? getlistComp(data){
   _storedList = data;
   return _storedList;
  }

  static List<lcomp> listcomp = _storedList as List<lcomp>;

}
