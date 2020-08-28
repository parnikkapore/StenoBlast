// Everything to do with the card deck

Table deck;
ArrayList<TableRow> curDeck;

void loadDeck(){
  /* Deck of all cards --------------------*/
  deck = loadTable("deck.csv","header");
  
  // Make sure all the needed columns are present
  deck.checkColumnIndex("word");
  deck.checkColumnIndex("box");
  deck.checkColumnIndex("due");
  
  /* Deck of cards we're currently playing */
  curDeck = new ArrayList<TableRow>();
}

void saveDeck(){
  saveTable(deck, "data/deck.csv");
}

void initDeckDue(){
  //println("Yar!");
  int now = int(System.currentTimeMillis()/(1000*24*60*60)); // Days since epoch
  curDeck.clear();
  
  for(int i=0; i<deck.getRowCount(); i++){
    TableRow r = deck.getRow(i);
    if(r.getInt("due") <= now){
       //println("Adding to practice", r.getString("word"));
       curDeck.add(int(random(curDeck.size())), r);
       //curDeck.add(r);
    }
  }
}
void initDeckAll(){
  curDeck.clear();
  
  for(int i=0; i<deck.getRowCount(); i++){
    TableRow r = deck.getRow(i);
    curDeck.add(r);
  }
}

TableRow randDeckItem(){
  //println(curDeck.size());
  //println("Hello!", curDeck.get(0).getString("word"));
  return curDeck.remove(0);
}
