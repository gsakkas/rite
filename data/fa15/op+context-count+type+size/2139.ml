
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
(12,46)-(12,51)
(12,57)-(12,61)
*)

(* type error slice
(10,2)-(12,61)
(10,2)-(12,61)
(11,10)-(11,11)
(12,12)-(12,61)
(12,46)-(12,51)
*)
