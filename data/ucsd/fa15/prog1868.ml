
let is10gte n = n >= 10;;

let rec additivePersistence n =
  if is10gte then 1 + (additivePersistence (sumList (digitsOfInt n))) else 0;;
