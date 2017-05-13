
let rec listReverse2 l dest =
  match l with | [] -> dest | h::t -> listReverse2 t (h :: dest);;

let rec digitsToList n =
  match n / 10 with
  | 0 -> [n mod 10]
  | _ -> (n mod 10) :: (digitsToList (n / 10));;

let listReverse l = listReverse2 l [];;

let digitsOfInt n = listReverse (digitsToList n);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n c =
  let l = digits n in
  let s = sumList l in
  if (s / 10) <> 0 then (additivePersistence s c) + 1 else c;;

let additivePersistence n = additivePersistence n 0;;
