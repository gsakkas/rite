
let rec additivePersistence n =
  n = ((n mod 10) + (additivePersistence (n / 10)));;
