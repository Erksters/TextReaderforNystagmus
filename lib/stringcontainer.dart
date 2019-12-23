
class StringContainer{
  List<String> _listGrowable;
  String _currentWord;
  int index = 0;

  StringContainer(String novel){
    _listGrowable = novel.split(" ");
    _currentWord = _listGrowable.elementAt(index);
    }

  ///Will update the current word and the index
  void moveForward(){
    if(index< _listGrowable.length - 1){
      index++;
      _currentWord = _listGrowable.elementAt(index);
    }
  }
  
  ///Will update the current word and the index.
  void moveBackward(){
    if(index >0 ){
      index--;
      _currentWord = _listGrowable.elementAt(index);
    }
  }

  ///Can change the index to whatever number >= 0.
  void changeIndex(int position){
    if(position > -1 && position < _listGrowable.length){
      index = position;
      _currentWord = _listGrowable.elementAt(index);
    }
  }
}
