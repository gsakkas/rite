
let rec mulByDigit i l =
  let rec mBDhelper i x =
    match x with
    | [] -> []
    | hd::tl ->
        if ((hd * i) / 10) != 0
        then ((hd * i) mod 10) :: (((hd * i) / 10) + (mBDhelper i tl))
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
(3,2)-(10,15)
(3,20)-(9,41)
(7,11)-(7,26)
(7,23)-(7,25)
(8,13)-(8,30)
(8,14)-(8,22)
(8,15)-(8,17)
(8,20)-(8,21)
(8,27)-(8,29)
(8,34)-(8,70)
(8,54)-(8,63)
(8,64)-(8,65)
(8,66)-(8,68)
(9,13)-(9,21)
(9,13)-(9,41)
(9,25)-(9,41)
(10,2)-(10,11)
(10,2)-(10,15)
(10,12)-(10,13)
(10,14)-(10,15)
*)

(* type error slice
(3,2)-(10,15)
(3,20)-(9,41)
(3,22)-(9,41)
(4,4)-(9,41)
(7,8)-(9,41)
(8,13)-(8,70)
(8,13)-(8,70)
(8,34)-(8,70)
(8,34)-(8,70)
(8,53)-(8,69)
(8,54)-(8,63)
(9,13)-(9,41)
(9,25)-(9,41)
(9,26)-(9,35)
*)
