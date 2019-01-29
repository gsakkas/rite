
let rec digitsOfInt n =
  let rec append xs1 xs2 =
    match xs1 with | [] -> xs2 | hd::tl -> append tl (hd :: xs2) in
  let rec helper x =
    match x with | 0 -> [] | n -> append (helper (n / 10)) (n mod 10) in
  helper n;;


(* fix

let rec digitsOfInt n =
  let rec helper x =
    match x with | 0 -> [] | n -> (helper (n / 10)) @ [n mod 10] in
  helper n;;

*)

(* changed spans
(6,34)-(6,40)
(@)
VarG

(6,59)-(6,69)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
