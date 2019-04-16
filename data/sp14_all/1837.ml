
let rec digitsOfInt n =
  let rec append xs1 xs2 =
    match xs1 with | [] -> xs2 | hd::tl -> hd :: (append tl xs2) in
  let rec helper x =
    match x with | 0 -> [] | m -> append (helper (m / 10)) [m mod 10] in
  helper n;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec digitalRoot n =
  let rec helper x = if x < 10 then x else helper (sumList digits x) in
  helper n;;


(* fix

let rec digitsOfInt n =
  let rec append xs1 xs2 =
    match xs1 with | [] -> xs2 | hd::tl -> hd :: (append tl xs2) in
  let rec helper x =
    match x with | 0 -> [] | m -> append (helper (m / 10)) [m mod 10] in
  helper n;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec digitalRoot n =
  let rec helper x = if x < 10 then x else helper (sumList (digits x)) in
  helper n;;

*)

(* changed spans
(14,51)-(14,69)
sumList (digits x)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(11,58)-(11,75)
(11,63)-(11,75)
(11,64)-(11,71)
(14,51)-(14,69)
(14,52)-(14,59)
*)
