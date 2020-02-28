
let rec mulByDigit i l =
  let comb a b = match b with | [] -> a | hd::tl -> a + hd in
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
(3,39)-(3,40)
[a]
ListG [VarG]

(3,53)-(3,59)
[a + hd]
ListG [BopG EmptyG EmptyG]

*)

(* type error slice
(3,3)-(11,16)
(3,12)-(3,59)
(3,14)-(3,59)
(3,18)-(3,59)
(3,39)-(3,40)
(3,53)-(3,54)
(3,53)-(3,59)
(9,14)-(9,74)
(9,33)-(9,74)
(9,34)-(9,38)
*)
