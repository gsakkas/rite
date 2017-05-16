
let rec additivePersistence n =
  if n > 0 then (n mod 10) + ((additivePersistence n) / 10);;
