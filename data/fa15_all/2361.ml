
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec addNumbs n = match n with | [] -> 0 | h::t -> h + (addNumbs t);;

let digits n = digitsOfInt (abs n);;

let rec additivePersistence n =
  match digits n with
  | [] -> 0
  | h::t -> if (addNumbs (h :: t)) >= 10 then false else true;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec addNumbs n = match n with | [] -> 0 | h::t -> h + (addNumbs t);;

let digits n = digitsOfInt (abs n);;

let rec additivePersistence n =
  match digits n with
  | [] -> 0
  | h::t -> if (addNumbs (h :: t)) >= 10 then 1 else 2;;

*)

(* changed spans
(12,47)-(12,52)
1
LitG

(12,58)-(12,62)
2
LitG

*)

(* type error slice
(10,3)-(12,62)
(11,11)-(11,12)
(12,13)-(12,62)
(12,58)-(12,62)
*)
