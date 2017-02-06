
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
(3,25)-(3,31)
(11,3)-(11,12)
(11,13)-(11,14)
(11,15)-(11,16)
*)

(* type error slice
(2,4)-(11,18)
(2,20)-(11,16)
(2,22)-(11,16)
(3,3)-(11,16)
(3,12)-(3,31)
(3,15)-(3,31)
(3,15)-(3,31)
(3,15)-(3,31)
(3,25)-(3,26)
(3,29)-(3,31)
(4,21)-(10,41)
(4,23)-(10,41)
(5,5)-(10,41)
(5,5)-(10,41)
(5,5)-(10,41)
(5,5)-(10,41)
(5,5)-(10,41)
(5,11)-(5,12)
(6,13)-(6,15)
(8,14)-(8,16)
(8,19)-(8,20)
(9,34)-(9,38)
(9,34)-(9,72)
(9,34)-(9,72)
(9,58)-(9,67)
(9,58)-(9,72)
(10,27)-(10,36)
(10,27)-(10,41)
(11,13)-(11,14)
(11,15)-(11,16)
*)
