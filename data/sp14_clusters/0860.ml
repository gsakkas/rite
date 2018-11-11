
let listReverse l =
  let rec lr l' = function | [] -> l' | h::t -> lr (h :: l') t in lr [] l;;

let rec digitsOfInt n =
  let this =
    match n with
    | 0 -> []
    | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10)) in
  this listReverse n;;


(* fix

let listReverse l =
  let rec lr l' = function | [] -> l' | h::t -> lr (h :: l') t in lr [] l;;

let rec digitsOfInt n =
  let xxx n =
    match n with
    | 0 -> []
    | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10)) in
  listReverse (xxx n);;

*)

(* changed spans
(6,2)-(10,20)
let xxx =
  fun n ->
    match n with
    | 0 -> []
    | n -> if n < 0
           then []
           else (n mod 10) :: (digitsOfInt (n / 10)) in
listReverse (xxx n)
LetG NonRec [LamG EmptyG] (AppG [EmptyG])

(7,4)-(9,69)
fun n ->
  match n with
  | 0 -> []
  | n -> if n < 0
         then []
         else (n mod 10) :: (digitsOfInt (n / 10))
LamG (CaseG EmptyG [(Nothing,EmptyG),(Nothing,EmptyG)])

(10,2)-(10,6)
listReverse (xxx n)
AppG [AppG [EmptyG]]

(10,19)-(10,20)
xxx
VarG

(10,19)-(10,20)
xxx n
AppG [VarG]

*)
