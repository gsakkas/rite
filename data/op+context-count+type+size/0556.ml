
let rec mulByDigit i l =
  let rec mBDhelper i x =
    match x with
    | [] -> []
    | hd::tl ->
        if ((hd * i) - 9) != 0
        then ((hd * i) / 10) :: (((hd * i) mod 10) + (mBDhelper i tl))
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
(3,21)-(9,41)
(8,36)-(8,50)
(8,36)-(8,69)
(9,15)-(9,17)
(9,15)-(9,21)
(9,20)-(9,21)
(9,27)-(9,36)
(9,37)-(9,38)
(9,39)-(9,41)
(10,3)-(10,12)
(10,3)-(10,16)
(10,13)-(10,14)
(10,15)-(10,16)
*)

(* type error slice
(3,3)-(10,16)
(3,21)-(9,41)
(3,23)-(9,41)
(4,5)-(9,41)
(7,9)-(9,41)
(8,16)-(8,69)
(8,16)-(8,69)
(8,36)-(8,69)
(8,36)-(8,69)
(8,55)-(8,64)
(8,55)-(8,69)
(9,15)-(9,41)
(9,27)-(9,36)
(9,27)-(9,41)
*)
