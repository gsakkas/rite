
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
(3,38)-(3,39)
(3,52)-(3,58)
*)

(* type error slice
(3,2)-(11,15)
(3,11)-(3,58)
(3,13)-(3,58)
(3,17)-(3,58)
(3,38)-(3,39)
(3,52)-(3,53)
(3,52)-(3,58)
(9,13)-(9,73)
(9,32)-(9,73)
(9,33)-(9,37)
*)
