
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
(3,53)-(3,59)
*)

(* type error slice
(3,3)-(11,16)
(3,12)-(3,59)
(3,14)-(3,59)
(3,18)-(3,59)
(3,24)-(3,25)
(3,39)-(3,40)
(3,53)-(3,54)
(3,53)-(3,59)
(9,16)-(9,28)
(9,16)-(9,72)
(9,34)-(9,38)
(9,34)-(9,72)
(9,41)-(9,55)
*)
