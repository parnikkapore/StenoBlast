// Everything to do with the card deck
Table deck;

void loadDeck(){
  deck = loadTable("deck.csv","header");
}

TableRow randDeckItem(){
  int items = deck.getRowCount();
  int id = int(random(0, items));
  return deck.getRow(id);
}
