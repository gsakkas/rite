
let rec mulByDigit i l =
  let comb a (hd::tl) = a + hd in
  let rec mBDhelper i x =
    match x with
    | [] -> []
    | hd::tl ->
        if ((hd * i) - 9) != 0
        then ((hd * i) / 10) :: (comb ((hd * i) mod 10) (mBDhelper i tl))
        else (hd * i) :: (mBDhelper i tl) in
  mBDhelper i l;;


(* fix

let rec mulByDigit i l =
  let comb a b = match b with | [] -> [a] | hd::tl -> [a + hd] in
  let rec mBDhelper i x =
    match x with
    | [] -> []
    | hd::tl ->
        if ((hd * i) - 9) != 0
        then ((hd * i) / 10) :: (comb ((hd * i) mod 10) (mBDhelper i tl))
        else (hd * i) :: (mBDhelper i tl) in
  mBDhelper i l;;

*)

(* changed spans
(3,14)-(3,30)
fun b ->
  match b with
  | [] -> [a]
  | hd :: tl -> [a + hd]
LamG (CaseG EmptyG [(Nothing,EmptyG),(Nothing,EmptyG)])

(3,24)-(3,30)
b
VarG

(3,24)-(3,30)
a
VarG

(3,24)-(3,30)
match b with
| [] -> [a]
| hd :: tl -> [a + hd]
CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,ListG EmptyG Nothing)]

(3,24)-(3,30)
[a]
ListG VarG Nothing

(3,24)-(3,30)
[a + hd]
ListG (BopG EmptyG EmptyG) Nothing

*)
