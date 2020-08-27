/*
String[] words = {
  "the", "pup", "sat", "sap", "hull", "is", "tough", "tap",
  "pull", "pal", "had", "it", "you", "hut", "salt", "staff" };
*/

String getCurS(){
  // return "cat";
  // return "supercalifragilisticexpialidocious";
  
  String news = curs;
  while (news == curs){
    curR = randDeckItem();
    news = curR.getString("word");
  }
  return news;
}
