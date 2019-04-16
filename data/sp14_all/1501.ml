
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
(3,15)-(3,31)
fun b ->
  match b with
  | [] -> [a]
  | hd :: tl -> [a + hd]
LamG VarPatG (CaseG EmptyG (fromList [(ConsPatG EmptyPatG EmptyPatG,Nothing,EmptyG),(ConPatG Nothing,Nothing,EmptyG)]))

*)

(* type error slice
(3,3)-(11,16)
(3,12)-(3,31)
(3,15)-(3,31)
(3,25)-(3,31)
(9,14)-(9,74)
(9,33)-(9,74)
(9,34)-(9,38)
*)
