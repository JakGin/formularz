-- Locations
INSERT INTO "Solectwo" (name) VALUES ('BABY');
INSERT INTO "Solectwo" (name) VALUES ('BIAŁKOWICE');
INSERT INTO "Solectwo" (name) VALUES ('GAJKOWICE');
INSERT INTO "Solectwo" (name) VALUES ('GAZOMIA NOWA');
INSERT INTO "Solectwo" (name) VALUES ('GAZOMIA STARA');
INSERT INTO "Solectwo" (name) VALUES ('GOŚCIMOWICE PIERWSZE');
INSERT INTO "Solectwo" (name) VALUES ('GOŚCIMOWICE DRUGIE');
INSERT INTO "Solectwo" (name) VALUES ('GOŚCIMOWICE DRUGIE - POWĘZINY');
INSERT INTO "Solectwo" (name) VALUES ('JAROSTY');
INSERT INTO "Solectwo" (name) VALUES ('KARLIN');
INSERT INTO "Solectwo" (name) VALUES ('KIEŁCZÓWKA');
INSERT INTO "Solectwo" (name) VALUES ('KOSÓW');
INSERT INTO "Solectwo" (name) VALUES ('MICHAŁÓW');
INSERT INTO "Solectwo" (name) VALUES ('MOSZCZENICA');
INSERT INTO "Solectwo" (name) VALUES ('WOLA MOSZCZENICKA');
INSERT INTO "Solectwo" (name) VALUES ('PODOLIN');
INSERT INTO "Solectwo" (name) VALUES ('POMYKÓW');
INSERT INTO "Solectwo" (name) VALUES ('RACIBOROWICE');
INSERT INTO "Solectwo" (name) VALUES ('RAKÓW');
INSERT INTO "Solectwo" (name) VALUES ('RĘKORAJ');
INSERT INTO "Solectwo" (name) VALUES ('SIEROSŁAW');
INSERT INTO "Solectwo" (name) VALUES ('SROCK');

-- Streets
-- BABY
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Brzozowa', (SELECT id FROM "Solectwo" WHERE name = 'BABY'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Cicha', (SELECT id FROM "Solectwo" WHERE name = 'BABY'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Dworcowa', (SELECT id FROM "Solectwo" WHERE name = 'BABY'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Kolejarzy', (SELECT id FROM "Solectwo" WHERE name = 'BABY'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Piotrkowska', (SELECT id FROM "Solectwo" WHERE name = 'BABY'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Polna', (SELECT id FROM "Solectwo" WHERE name = 'BABY'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Rzemieślnicza', (SELECT id FROM "Solectwo" WHERE name = 'BABY'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Sieradzka', (SELECT id FROM "Solectwo" WHERE name = 'BABY'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Spacerowa', (SELECT id FROM "Solectwo" WHERE name = 'BABY'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Sportowa', (SELECT id FROM "Solectwo" WHERE name = 'BABY'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Szkolna', (SELECT id FROM "Solectwo" WHERE name = 'BABY'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Świerkowa', (SELECT id FROM "Solectwo" WHERE name = 'BABY'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Wąska', (SELECT id FROM "Solectwo" WHERE name = 'BABY'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Wolborska', (SELECT id FROM "Solectwo" WHERE name = 'BABY'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Zielona', (SELECT id FROM "Solectwo" WHERE name = 'BABY'));

-- JAROSTY
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Kolejowa', (SELECT id FROM "Solectwo" WHERE name = 'JAROSTY'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Kwiatowa', (SELECT id FROM "Solectwo" WHERE name = 'JAROSTY'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Leśna', (SELECT id FROM "Solectwo" WHERE name = 'JAROSTY'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Łąkowa', (SELECT id FROM "Solectwo" WHERE name = 'JAROSTY'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Mariana Grabińskiego', (SELECT id FROM "Solectwo" WHERE name = 'JAROSTY'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Miła', (SELECT id FROM "Solectwo" WHERE name = 'JAROSTY'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Nowa', (SELECT id FROM "Solectwo" WHERE name = 'JAROSTY'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Południowa', (SELECT id FROM "Solectwo" WHERE name = 'JAROSTY'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Słoneczna', (SELECT id FROM "Solectwo" WHERE name = 'JAROSTY'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('św. Jana Pawła II', (SELECT id FROM "Solectwo" WHERE name = 'JAROSTY'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Turystyczna', (SELECT id FROM "Solectwo" WHERE name = 'JAROSTY'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Ustronna', (SELECT id FROM "Solectwo" WHERE name = 'JAROSTY'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Żeńców', (SELECT id FROM "Solectwo" WHERE name = 'JAROSTY'));

-- RAKÓW
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Adama', (SELECT id FROM "Solectwo" WHERE name = 'RAKÓW'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Cyprysowa', (SELECT id FROM "Solectwo" WHERE name = 'RAKÓW'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Dębowa', (SELECT id FROM "Solectwo" WHERE name = 'RAKÓW'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Gazomska', (SELECT id FROM "Solectwo" WHERE name = 'RAKÓW'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Jarzębinowa', (SELECT id FROM "Solectwo" WHERE name = 'RAKÓW'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Moszczenicka', (SELECT id FROM "Solectwo" WHERE name = 'RAKÓW'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Piotrkowska', (SELECT id FROM "Solectwo" WHERE name = 'RAKÓW'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Słoneczna', (SELECT id FROM "Solectwo" WHERE name = 'RAKÓW'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Sosnowa', (SELECT id FROM "Solectwo" WHERE name = 'RAKÓW'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Stumilowego Lasu', (SELECT id FROM "Solectwo" WHERE name = 'RAKÓW'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Świerkowa', (SELECT id FROM "Solectwo" WHERE name = 'RAKÓW'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Wrzosowa', (SELECT id FROM "Solectwo" WHERE name = 'RAKÓW'));

-- SROCK
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Krótka', (SELECT id FROM "Solectwo" WHERE name = 'SROCK'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Łączna', (SELECT id FROM "Solectwo" WHERE name = 'SROCK'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Łódzka', (SELECT id FROM "Solectwo" WHERE name = 'SROCK'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Piotrkowska', (SELECT id FROM "Solectwo" WHERE name = 'SROCK'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Plac Rynek', (SELECT id FROM "Solectwo" WHERE name = 'SROCK'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Podolska', (SELECT id FROM "Solectwo" WHERE name = 'SROCK'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Pogodna', (SELECT id FROM "Solectwo" WHERE name = 'SROCK'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Południowa', (SELECT id FROM "Solectwo" WHERE name = 'SROCK'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Słoneczna', (SELECT id FROM "Solectwo" WHERE name = 'SROCK'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Spacerowa', (SELECT id FROM "Solectwo" WHERE name = 'SROCK'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Stawna', (SELECT id FROM "Solectwo" WHERE name = 'SROCK'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Wschodnia', (SELECT id FROM "Solectwo" WHERE name = 'SROCK'));
INSERT INTO "Street" ("name", "solectwoId") VALUES ('Zielona', (SELECT id FROM "Solectwo" WHERE name = 'SROCK'));