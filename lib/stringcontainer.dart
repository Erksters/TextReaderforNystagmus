//StringContainer.dart
//Author: Erick Saenz-Gardea
//Last Updates: Dec 24, 2019

///This class will create an iterable list for the uploaded novel. 
class StringContainer{
  List<String> _listGrowable;
  String _currentWord;
  int index = 0;

  ///Constructor
  StringContainer(String novel){
    _listGrowable = novel.split(" ");
    _currentWord = _listGrowable.elementAt(index);
    }

  ///This method will check if we are at the end of the novel. If we are, return false.
  bool canMoveForward(){
    if(index< _listGrowable.length - 1) return true;
    return false;
  }

  ///Will update the current word and the index
  void moveForward(){
    if(canMoveForward()){
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

  ///Getter for "_currentWord"
  String getCurrentWord(){
    return _currentWord;
  }
}
