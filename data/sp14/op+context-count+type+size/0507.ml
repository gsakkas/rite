
let rec mulByDigit i l =
  let comb a b = match b with | [] -> [a] | hd::tl -> [[a + hd]; tl] in
  let rec mBDhelper i x =
    match x with
    | [] -> []
    | hd::tl ->
        if (hd * i) > 9
        then ((hd * i) / 10) :: (comb ((hd * i) mod 10) (mBDhelper i tl))
        else (hd * i) :: (mBDhelper i tl) in
  mBDhelper i l;;


(* fix

let rec mulByDigit i l =
  let comb a b = match b with | [] -> [a] | hd::tl -> [a + hd] @ tl in
  let rec mBDhelper i x =
    match x with
    | [] -> []
    | hd::tl ->
        if (hd * i) > 9
        then ((hd * i) / 10) :: (comb ((hd * i) mod 10) (mBDhelper i tl))
        else (hd * i) :: (mBDhelper i tl) in
  mBDhelper i l;;

*)

(* changed spans
(3,54)-(3,68)
(3,55)-(3,63)
*)

(* type error slice
(3,17)-(3,68)
(3,17)-(3,68)
(3,38)-(3,41)
(3,38)-(3,41)
(3,39)-(3,40)
(3,54)-(3,68)
(3,54)-(3,68)
(3,55)-(3,63)
(3,56)-(3,57)
(3,56)-(3,62)
*)
