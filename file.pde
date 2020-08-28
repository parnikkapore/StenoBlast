// Everything to do with the card deck
Table deck;

void loadDeck(){
  deck = loadTable("deck.csv","header");
  
  // Make sure all the needed columns are present
  deck.checkColumnIndex("word");
  deck.checkColumnIndex("box");
  deck.checkColumnIndex("due");
  
  deck.sort("due"); // This should be done during save, but save is a hack right now.
}

void saveDeck(){
  saveTable(deck, "data/deck.csv");
}

TableRow randDeckItem(){
  int items = deck.getRowCount();
  int id = int(random(0, items));
  return deck.getRow(id);
}
