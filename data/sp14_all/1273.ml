
let digitsOfInt n =
  let rec lastDigit n acc =
    if n <= 0 then acc else lastDigit (n / 10) ((n mod 10) :: acc) in
  match n with | _ -> lastDigit n [];;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n count =
  match n with
  | [] -> count
  | _ -> additivePersistence (sumList (digitsOfInt n) (count + 1));;


(* fix

let digitsOfInt n =
  let rec lastDigit n accu =
    if n <= 0 then accu else lastDigit (n / 10) ((n mod 10) :: accu) in
  match n with | _ -> lastDigit n [];;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  match n with | 0 -> 0 | _ -> additivePersistence (sumList (digitsOfInt n));;

*)

(* changed spans
(3,23)-(4,67)
fun accu ->
  if n <= 0
  then accu
  else lastDigit (n / 10)
                 ((n mod 10) :: accu)
LamG VarPatG (IteG EmptyG EmptyG EmptyG)

(9,31)-(12,67)
match n with
| 0 -> 0
| _ -> additivePersistence (sumList (digitsOfInt n))
CaseG VarG [(LitPatG,Nothing,LitG),(WildPatG,Nothing,AppG [EmptyG])]

*)

(* type error slice
(2,4)-(5,39)
(2,17)-(5,37)
(4,29)-(4,38)
(4,29)-(4,67)
(4,39)-(4,47)
(5,23)-(5,32)
(5,23)-(5,37)
(5,33)-(5,34)
(7,58)-(7,75)
(7,63)-(7,75)
(7,64)-(7,71)
(9,4)-(12,69)
(9,29)-(12,67)
(9,31)-(12,67)
(10,3)-(12,67)
(10,9)-(10,10)
(11,11)-(11,16)
(12,10)-(12,29)
(12,10)-(12,67)
(12,30)-(12,67)
(12,31)-(12,38)
(12,39)-(12,54)
(12,40)-(12,51)
(12,52)-(12,53)
*)
