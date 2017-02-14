
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec addNumbs n = match n with | [] -> 0 | h::t -> h + (addNumbs t);;

let digits n = digitsOfInt (abs n);;

let rec additivePersistence n =
  match digits n with | [] -> 0 | h::t -> addNumbs n;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec addNumbs n = match n with | [] -> 0 | h::t -> h + (addNumbs t);;

let digits n = digitsOfInt (abs n);;

let rec additivePersistence n =
  match digits n with | [] -> 0 | h::t -> addNumbs (h :: t);;

*)

(* changed spans
(10,51)-(10,52)
*)

(* type error slice
(5,21)-(5,70)
(5,21)-(5,70)
(5,58)-(5,70)
(5,59)-(5,67)
(5,68)-(5,69)
(7,3)-(7,36)
(7,11)-(7,34)
(7,27)-(7,34)
(7,28)-(7,31)
(7,32)-(7,33)
(10,8)-(10,14)
(10,8)-(10,16)
(10,15)-(10,16)
(10,42)-(10,50)
(10,42)-(10,52)
(10,51)-(10,52)
*)
