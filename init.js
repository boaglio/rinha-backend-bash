use rinhadb;

db.people.createIndex({ _id: 1 });

db.people.createIndex(
  { _fts: 'text', _ftsx: 1 },
  {
    name: 'Pessoa_TextIndex',
    weights: { name: 1, nickname: 1, birth_date: 1,stack: 1},
    default_language: 'english',
    language_override: 'language',
    textIndexVersion: 3
  }
);

db.people.createIndex({ nickname: 1 }, { unique: true });
