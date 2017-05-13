
let rec help n = if n > 0 then (n mod 10) + (help (n / 10)) else 0;;

let rec additivePersistence n =
  if n >= 10 then 1 + (additivePersistence (help n)) else 0;;

let rec help n = if n > 0 then (n mod 10) + (help (n / 10)) else 0;;

let additivePersistence n =
  let county = if n >= 10 then 1 + (additivePersistence (help n)) else 0 in
  additivePersistence n;;

let rec help n = if n > 0 then (n mod 10) + (help (n / 10)) else 0;;

let additivePersistence n =
  let rec county = if n >= 10 then 1 + (additivePersistence (help n)) else 0 in
  county n;;
