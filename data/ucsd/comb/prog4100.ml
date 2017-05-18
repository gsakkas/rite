
let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec help n = match n with | 0 -> [] | _ -> cat (help (n / 10)) (n mod 10);;

let rec digitsOfInt n = if n = 0 then [0] else help n;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (n / 10) = 0 then 0 else 1 + (additivePersistence (sumList (digits n)));;

let _ = additivePersistence - 9999;;
