
let rec add current next =
  match current with | [] -> [next] | front::back -> front :: (add back next);;

let rec digitsOfInt n =
  if n <= 0 then [] else add (digitsOfInt (n / 10)) (n mod 10);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | xf::xb -> xf + (sumList xb);;

let rec additivePersistence n =
  let x = sumList digits n in
  if x > 9 then 1 + (additivePersistence x) else 1;;


(* fix

let rec add current next =
  match current with | [] -> [next] | front::back -> front :: (add back next);;

let rec digitsOfInt n =
  if n <= 0 then [] else add (digitsOfInt (n / 10)) (n mod 10);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | xf::xb -> xf + (sumList xb);;

let rec additivePersistence n =
  let x = sumList (digits n) in
  if x > 9 then 1 + (additivePersistence x) else 1;;

*)

(* changed spans
(13,11)-(13,27)
sumList (digits n)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(10,58)-(10,75)
(10,63)-(10,75)
(10,64)-(10,71)
(13,11)-(13,18)
(13,11)-(13,27)
*)
