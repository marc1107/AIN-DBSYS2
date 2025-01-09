# Uebungsblatt 8

MongoDB Docker Image herunterladen:

```zsh
docker pull mongo:latest
```

Kommandos um MongoDB Docker Container zu starten:

```zsh
docker run -d --name mongodb -p 27017:27017 mongo
docker exec -it mongodb mongosh
```

Zu Datenbank `Firma` wechseln oder diese erstellen:

```zsh
use firma;
```

## Aufgabe 1

Gegebene Datenbank:

```javascript
db.kunde.deleteMany({});
db.auftrag.deleteMany({});

db.auftrag.insertOne({
  auftragsnummer: 1234,
  kosten: 6000,
  beschreibung: "Entwicklung Onlineshop",
  jahr: 2021,
});

db.auftrag.insertOne({
  auftragsnummer: 1217,
  kosten: 300,
  beschreibung: "Installation Webserver",
  jahr: 2020,
});

db.auftrag.insertOne({
  auftragsnummer: 1218,
  kosten: 500,
  beschreibung: "Cloud Integration",
  jahr: 2020,
});

db.auftrag.insertOne({
  auftragsnummer: 1222,
  kosten: 2000,
  beschreibung: "Optimierung Infrastruktur",
  jahr: 2021,
});

db.auftrag.insertOne({
  auftragsnummer: 1224,
  kosten: 3000,
  beschreibung: "Optimierung Infrastruktur",
  jahr: 2021,
});

db.kunde.insertOne({
  name: "Müller",
  adresse: "Obere Laube 10 78462 Konstanz",
  auftraege: [
    {
      kosten: 6000,
      details: new DBRef(
        "auftrag",
        db.auftrag.findOne({
          auftragsnummer: 1234,
        })._id
      ),
    },
    {
      kosten: 300,
      details: new DBRef(
        "auftrag",
        db.auftrag.findOne({
          auftragsnummer: 1217,
        })._id
      ),
    },
  ],
});

db.kunde.insertOne({
  name: "Maier",
  adresse: "Seestrasse 10 78462 Konstanz",
  auftraege: [
    {
      kosten: 500,
      details: new DBRef(
        "auftrag",
        db.auftrag.findOne({
          auftragsnummer: 1218,
        })._id
      ),
    },
    {
      kosten: 2000,
      details: new DBRef(
        "auftrag",
        db.auftrag.findOne({
          auftragsnummer: 1222,
        })._id
      ),
    },
  ],
});

db.kunde.insertOne({
  name: "Kunz",
  adresse: "Seestrasse 1 78462 Konstanz",
  auftraege: [
    {
      kosten: 3000,
      details: new DBRef(
        "auftrag",
        db.auftrag.findOne({
          auftragsnummer: 1224,
        })._id
      ),
    },
  ],
});
```

### a) Ermittle alle Aufträge in 2021 über "Entwicklung Onlineshop" oder "Installation Webserver"

```javascript
db.auftrag.find({
  jahr: 2021,
  beschreibung: { $in: ["Entwicklung Onlineshop", "Installation Webserver"] },
});
```

### b) Welche Aufträge wurden 2021 beauftragt? Es soll hier nur die Auftragsbeschreibungen ausgegeben werden, z.B. "Entwicklung Onlineshop" oder "Installation Server".

```javascript
db.auftrag.find({ jahr: 2021 }, { beschreibung: 1, _id: 0 });
```

### c) Ermittle alle Kundennamen, die bereits einen Auftrag mit mind. 5000 Euro beauftragt haben.

```javascript
db.kunde.find(
  {
    "auftraege.kosten": { $gte: 5000 },
  },
  {
    name: 1,
    _id: 0,
  }
);
```

### d) Welcher Kunde hat den Auftrag mit Auftragsnummer 1222 beauftragt?

```javascript
db.kunde.find(
  {
    "auftraege.details": DBRef(
      "auftrag",
      db.auftrag.findOne({ auftragsnummer: 1222 })._id
    ),
  },
  {
    name: 1,
    _id: 0,
  }
);
```

### e) Wie viele Kosten haben die einzelnen Kunden insgesamt beauftragt?

```javascript
db.kunde.aggregate([
  { $unwind: "$auftraege" },
  { $group: { _id: "$name", totalKosten: { $sum: "$auftraege.kosten" } } },
]);
```

### f) In welchem Jahr hat die Firma an Entwicklung von Onlineshops am meisten Geld eingenommen? Es soll ausschliesslich das Jahr und die Summe ausgegeben werden.

```javascript
db.auftrag.aggregate([
  { $match: { beschreibung: "Entwicklung Onlineshop" } },
  { $group: { _id: "$jahr", totalEinnahmen: { $sum: "$kosten" } } },
  { $sort: { totalEinnahmen: -1 } },
  { $limit: 1 },
]);
```

### g) An welchen Aufträgen hat die Firma im Jahr 2021 wie viel Geld eingenommen? Die Aufträge sind in „beschreibung“ gespeichert.

```javascript
db.auftrag.aggregate([
  { $match: { jahr: 2021 } },
  { $group: { _id: "$beschreibung", totalEinnahmen: { $sum: "$kosten" } } },
]);
```

## Aufgabe 2

Gegebene Datenbank:

```javascript
db.abt.insertMany([
  { anr: "K51", name: "Entwicklung", ort: "Erlangen" },
  { anr: "K53", name: "Buchhaltung", ort: "Nürnberg" },
  { anr: "K55", name: "Personal", ort: "Nürnberg" },
]);

db.pers.insertOne({
  pnr: 123,
  name: "Mueller",
  jahrg: 1980,
  eindat: new Date("2000-09-01"),
  gehalt: 88000,
  beruf: "Kaufmann",
  abteilung: new DBRef("abt", db.abt.findOne({ name: "Entwicklung" })._id),
});

db.pers.insertOne({
  pnr: 406,
  name: "Coy",
  jahrg: 1972,
  eindat: new Date("2006-09-01"),
  gehalt: 100000,
  beruf: "Programmierer",
  vorgesetzter: new DBRef("pers", db.pers.findOne({ name: "Mueller" })._id),
  abteilung: new DBRef("abt", db.abt.findOne({ name: "Personal" })._id),
});

db.pers.insertOne({
  pnr: 829,
  name: "Schmidt",
  jahrg: 1982,
  eindat: new Date("2010-06-01"),
  gehalt: 94000,
  beruf: "Kaufmann",
  vorgesetzter: new DBRef("pers", db.pers.findOne({ name: "Mueller" })._id),
  abteilung: new DBRef("abt", db.abt.findOne({ name: "Buchhaltung" })._id),
});

db.pers.insertOne({
  pnr: 874,
  name: "Abel",
  eindat: new Date("2014-05-01"),
  gehalt: 82000,
  beruf: "Softw.Entwickler",
  vorgesetzter: new DBRef("pers", db.pers.findOne({ name: "Schmidt" })._id),
  abteilung: new DBRef("abt", db.abt.findOne({ name: "Personal" })._id),
});

db.pers.insertOne({
  pnr: 503,
  name: "Junghans",
  jahrg: 1997,
  gehalt: 80000,
  beruf: "Programmierer",
  vorgesetzter: new DBRef("pers", db.pers.findOne({ name: "Mueller" })._id),
  abteilung: new DBRef("abt", db.abt.findOne({ name: "Entwicklung" })._id),
});
```

### a) Wer verdient mehr als sein Chef?

```javascript
db.pers.aggregate([
  {
    $lookup: {
      from: "pers",
      localField: "vorgesetzter.$id",
      foreignField: "_id",
      as: "chef",
    },
  },
  {
    $match: {
      $expr: {
        $gt: ["$gehalt", { $arrayElemAt: ["$chef.gehalt", 0] }],
      },
    },
  },
  {
    $project: {
      name: 1,
      gehalt: 1,
      _id: 0,
    },
  },
]);
```

### b) In welchem Ort ist die Summe aller Gehälter am höchsten?

```javascript
db.pers.aggregate([
  {
    $lookup: {
      from: "abt",
      localField: "abteilung.$id",
      foreignField: "_id",
      as: "abteilung",
    },
  },
  {
    $group: {
      _id: { ort: { $arrayElemAt: ["$abteilung.ort", 0] } },
      totalGehalt: { $sum: "$gehalt" },
    },
  },
  {
    $sort: { totalGehalt: -1 },
  },
  {
    $limit: 1,
  },
]);
```
