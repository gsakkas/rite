
let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n = digitalRoot (sumList n);;


(* fix

let rec listReverse2 l dest =
  match l with | [] -> dest | h::t -> listReverse2 t (h :: dest);;

let rec digitsOfInt n =
  match n / 10 with
  | 0 -> [n mod 10]
  | _ -> (n mod 10) :: (digitsOfInt (n / 10));;

let rec digitsToList n =
  match n / 10 with
  | 0 -> [n mod 10]
  | _ -> (n mod 10) :: (digitsOfInt (n / 10));;

let rec listReverse l = listReverse2 l [];;

let digitsOfInt n = listReverse (digitsToList n);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n = digitalRoot (sumList (digits n));;

*)

(* changed spans
(4,46)-(4,47)
digits n
AppG [VarG]

*)

(* type error slice
(2,22)-(2,71)
(2,56)-(2,71)
(2,60)-(2,71)
(2,61)-(2,68)
(2,69)-(2,70)
(4,4)-(4,50)
(4,21)-(4,48)
(4,25)-(4,36)
(4,25)-(4,48)
(4,37)-(4,48)
(4,38)-(4,45)
(4,46)-(4,47)
*)
