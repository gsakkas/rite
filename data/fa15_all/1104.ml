
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
(19,18)-(19,59)
additivePersistence (digitSum (digits n))
AppG (fromList [AppG (fromList [EmptyG])])

(19,39)-(19,47)
digitSum (digits n)
AppG (fromList [AppG (fromList [EmptyG])])

*)
