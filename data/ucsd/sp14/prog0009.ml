
let count x = x + 1;;

let counter = 0;;

let rec sum n = if n <= 0 then 0 else (n mod 10) + (sum (n / 10));;

let rec additivePersistence n =
  let temp = sum n in
  let counters = count counter in
  let counter = counters in
  if temp >= 10 then additivePersistence temp else counter;;

let rec sum n = if n <= 0 then 0 else (n mod 10) + (sum (n / 10));;

let rec additivePersistence_helper (n,i) =
  let temp = sum n in
  if temp >= 10 then additivePersistence (temp, (i + 1)) else i;;
