
let rec appendLists (l1,l2) =
  match l1 with | [] -> l2 | h::t -> h :: (appendLists (t, l2));;

let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> appendLists ((digitsOfInt (n / 10)), [n mod 10]);;

let rec arrayLen l = match l with | [] -> 0 | h::t -> 1 + (arrayLen t);;

let rec digitSum dl = match dl with | [] -> 0 | h::t -> h + (digitSum t);;

let digits n = digitsOfInt (abs n);;

let rec additivePersistence n =
  match (arrayLen (digits n)) = 1 with
  | true  -> 0
  | false  -> 1 + (additivePersistence digitSum (digits n));;


(* fix

let rec appendLists (l1,l2) =
  match l1 with | [] -> l2 | h::t -> h :: (appendLists (t, l2));;

let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> appendLists ((digitsOfInt (n / 10)), [n mod 10]);;

let rec arrayLen l = match l with | [] -> 0 | h::t -> 1 + (arrayLen t);;

let rec digitSum dl = match dl with | [] -> 0 | h::t -> h + (digitSum t);;

let digits n = digitsOfInt (abs n);;

let rec additivePersistence n =
  match (arrayLen (digits n)) = 1 with
  | true  -> 0
  | false  -> 1 + (additivePersistence (digitSum (digits n)));;

*)

(* changed spans
(19,19)-(19,60)
additivePersistence (digitSum (digits n))
AppG [AppG [EmptyG]]

*)

(* type error slice
(16,4)-(19,62)
(16,29)-(19,60)
(17,3)-(19,60)
(18,14)-(18,15)
(19,19)-(19,60)
(19,20)-(19,39)
*)
