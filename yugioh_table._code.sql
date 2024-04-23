CREATE TABLE spell_card
(
  name_ INT NOT NULL,
  effect INT NOT NULL,
  type INT NOT NULL,
  PRIMARY KEY (effect)
);

CREATE TABLE monster_card
(
  name INT NOT NULL,
  effect INT,
  level INT NOT NULL,
  attack INT NOT NULL,
  defense INT NOT NULL,
  PRIMARY KEY (name)
);

CREATE TABLE trap_card
(
  name INT NOT NULL,
  effect INT NOT NULL,
  type INT NOT NULL,
  PRIMARY KEY (effect)
);

CREATE TABLE player
(
  BattleID INT NOT NULL,
  firstname INT NOT NULL,
  Lastname INT NOT NULL,
  Age INT NOT NULL,
  PRIMARY KEY (BattleID)
);

CREATE TABLE persons_deck
(
  name INT NOT NULL,
  age INT NOT NULL,
  RecipeID INT NOT NULL,
  BattleID INT NOT NULL,
  PRIMARY KEY (RecipeID),
  FOREIGN KEY (BattleID) REFERENCES player(BattleID)
);

CREATE TABLE have_spell
(
  RecipeID INT NOT NULL,
  spell_card_effect INT NOT NULL,
  PRIMARY KEY (RecipeID, spell_card_effect),
  FOREIGN KEY (RecipeID) REFERENCES persons_deck(RecipeID),
  FOREIGN KEY (spell_card_effect) REFERENCES spell_card(effect)
);

CREATE TABLE have_monster
(
  RecipeID INT NOT NULL,
  Monster_card_name INT NOT NULL,
  PRIMARY KEY (RecipeID, Monster_card_name),
  FOREIGN KEY (RecipeID) REFERENCES persons_deck(RecipeID),
  FOREIGN KEY (Monster_card_name) REFERENCES monster_card(name)
);

CREATE TABLE have_trap
(
  RecipeID INT NOT NULL,
  trap_card_effect INT NOT NULL,
  PRIMARY KEY (RecipeID, trap_card_effect),
  FOREIGN KEY (RecipeID) REFERENCES persons_deck(RecipeID),
  FOREIGN KEY (trap_card_effect) REFERENCES trap_card(effect)
);