
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec digitalRoot n =
  let nList = digitsOfInt n in
  match nList with
  | [] -> 0
  | nList -> let sumOfN = sumList n in sumOfN + (digitalRoot sumOfN);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec digitalRoot n =
  let nList = digitsOfInt n in
  match nList with
  | [] -> 0
  | nList -> let sumOfN = sumList nList in sumOfN + (digitalRoot sumOfN);;

*)

(* changed spans
(11,34)-(11,35)
*)

(* type error slice
(3,25)-(3,47)
(3,26)-(3,37)
(3,38)-(3,46)
(5,21)-(5,74)
(5,21)-(5,74)
(5,62)-(5,74)
(5,63)-(5,70)
(5,71)-(5,73)
(8,14)-(8,25)
(8,14)-(8,27)
(8,26)-(8,27)
(11,26)-(11,33)
(11,26)-(11,35)
(11,34)-(11,35)
*)
