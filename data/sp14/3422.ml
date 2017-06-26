
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
(2,16)-(2,70)
(4,45)-(4,46)
*)

(* type error slice
(2,21)-(2,70)
(2,55)-(2,70)
(2,59)-(2,70)
(2,60)-(2,67)
(2,68)-(2,69)
(4,3)-(4,49)
(4,20)-(4,47)
(4,24)-(4,35)
(4,24)-(4,47)
(4,36)-(4,47)
(4,37)-(4,44)
(4,45)-(4,46)
*)

(* all spans
(2,16)-(2,70)
(2,21)-(2,70)
(2,27)-(2,29)
(2,43)-(2,44)
(2,55)-(2,70)
(2,55)-(2,56)
(2,59)-(2,70)
(2,60)-(2,67)
(2,68)-(2,69)
(4,20)-(4,47)
(4,24)-(4,47)
(4,24)-(4,35)
(4,36)-(4,47)
(4,37)-(4,44)
(4,45)-(4,46)
*)
