
let rec countlist x = match x with | [] -> 0 | h::t -> 1 + (countlist t);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let x = sumList n in if x < 10 then countlist n else additivePersistence x;;
