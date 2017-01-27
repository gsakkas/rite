
let rec mulByDigit i l =
  let rec mBDhelper i x =
    match x with
    | [] -> 0
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
(3,3)-(10,16)
(5,13)-(5,14)
(7,14)-(7,26)
(7,24)-(7,26)
(8,16)-(8,18)
(8,16)-(8,22)
(8,16)-(8,30)
(8,21)-(8,22)
(8,28)-(8,30)
(8,38)-(8,69)
(8,55)-(8,64)
(8,65)-(8,66)
(8,67)-(8,69)
(9,15)-(9,21)
(9,15)-(9,41)
(9,27)-(9,41)
(10,3)-(10,12)
(10,3)-(10,16)
(10,13)-(10,14)
(10,15)-(10,16)
*)

(* type error slice
(4,5)-(9,41)
(5,13)-(5,14)
(7,9)-(9,41)
(7,14)-(7,20)
(7,19)-(7,20)
(8,16)-(8,30)
(8,16)-(8,69)
(8,38)-(8,69)
(8,55)-(8,64)
(8,55)-(8,69)
(8,65)-(8,66)
(8,67)-(8,69)
(9,15)-(9,21)
(9,15)-(9,41)
(9,27)-(9,36)
(9,27)-(9,41)
(9,37)-(9,38)
(9,39)-(9,41)
*)
