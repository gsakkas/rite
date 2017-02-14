
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
(11,35)-(11,36)
*)

(* type error slice
(3,27)-(3,38)
(3,27)-(3,46)
(3,40)-(3,46)
(5,22)-(5,74)
(5,22)-(5,74)
(5,64)-(5,71)
(5,64)-(5,74)
(5,72)-(5,74)
(8,15)-(8,26)
(8,15)-(8,28)
(8,27)-(8,28)
(11,27)-(11,34)
(11,27)-(11,36)
(11,35)-(11,36)
*)
