# Joudlustestid

Joudlusteste vaadates vaadates näeme, et kasutajate juurdetulekul kuni 50 kasutajani ei suurene serveri load time. Siit võib järeldada, et serveril suuremaid arhitektuurilisi probleeme ei ole ja ta skaleerub vertikaalselt suhteliselt hästi. Seda väidet kinnitab asjaolu, et me kasutame enda alus raamistikuks Springi, mis on maailmatasemel kasutatud veebiraamistik, mida kasutavad ka kõige suuremad enterprise ärid.

Lisaks näeme et meie serveri load time on keskmiselt umbes 750ms, mis on suhteliselelt kõrge arvestades rakenduse keerukust. Selleks et seda optimeerida oleks kõigelihtsam esialgu parem server osta. Kuid samas jooksutasime testid ka google.com vastu ning Google load time oli umbes 700ms. Siit võime järeldada et Kooli rakenduse jaoks on load time.

Vaadates erinevaid lehti näeme, et kõige rohkem aega võtab meil CSS ja javascripti laadimine. Eriti kaua võtab aega bootstrapi CSS laadimine. Kui me pakiks resursid enne kliendile saatmist kokku, siis saaks oluliselt kiirendada lehe laadimist.
