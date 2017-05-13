
let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  if n < 10 then 0 else 1 + (additivePersistence (sumList n));;
