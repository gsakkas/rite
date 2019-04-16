
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
(10,52)-(10,53)
h :: t
ConAppG (Just (TupleG (fromList [EmptyG])))

*)

(* type error slice
(5,22)-(5,71)
(5,59)-(5,71)
(5,60)-(5,68)
(5,69)-(5,70)
(7,4)-(7,37)
(7,12)-(7,35)
(7,28)-(7,35)
(7,29)-(7,32)
(7,33)-(7,34)
(10,9)-(10,15)
(10,9)-(10,17)
(10,16)-(10,17)
(10,43)-(10,51)
(10,43)-(10,53)
(10,52)-(10,53)
*)
