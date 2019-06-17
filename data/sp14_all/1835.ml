
let rec digitsOfInt n =
  let rec append xs1 xs2 =
    match xs1 with | [] -> xs2 | hd::tl -> hd :: (append tl xs2) in
  let rec helper x =
    match x with | 0 -> [] | m -> append (helper (m / 10)) [m mod 10] in
  helper n;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  let rec helper count x =
    match x with
    | [] -> count
    | hd::tl -> helper (count + 1) (sumList (digits n)) in
  helper 0;;


(* fix

let rec digitsOfInt n =
  let rec append xs1 xs2 =
    match xs1 with | [] -> xs2 | hd::tl -> hd :: (append tl xs2) in
  let rec helper x =
    match x with | 0 -> [] | m -> append (helper (m / 10)) [m mod 10] in
  helper n;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  let rec helper count x =
    if x < 10 then count else helper (count + 1) (sumList (digits n)) in
  helper 0 n;;

*)

(* changed spans
(15,5)-(17,56)
if x < 10
then count
else helper (count + 1)
            (sumList (digits n))
IteG (BopG EmptyG EmptyG) VarG (AppG [EmptyG,EmptyG])

(18,3)-(18,11)
helper 0 n
AppG [LitG,VarG]

*)

(* type error slice
(11,58)-(11,75)
(11,63)-(11,75)
(11,64)-(11,71)
(14,3)-(18,11)
(14,18)-(17,56)
(14,24)-(17,56)
(15,5)-(17,56)
(15,11)-(15,12)
(17,17)-(17,23)
(17,17)-(17,56)
(17,36)-(17,56)
(17,37)-(17,44)
*)
