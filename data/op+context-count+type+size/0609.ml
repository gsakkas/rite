
let rec mulByDigit i l =
  let rec mBDhelper i x =
    match x with
    | [] -> 0
    | hd::tl ->
        if ((hd * i) / 10) != 0
        then ((hd * i) mod 10) :: (((hd * i) / 10) + (mBDhelper i tl))
        else (hd * i) :: (mBDhelper i tl) in
  mBDhelper i l;;



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


(* changed spans
(5,13)-(5,14)
(7,22)-(7,26)
(8,24)-(8,27)
(8,46)-(8,47)
(8,52)-(8,53)
*)

(* type error slice
(8,16)-(8,69)
*)
