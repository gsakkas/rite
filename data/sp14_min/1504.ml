
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
(3,55)-(3,69)
[a + hd] @ tl
AppG [ListG [EmptyG],VarG]

*)

(* type error slice
(3,18)-(3,69)
(3,39)-(3,42)
(3,40)-(3,41)
(3,55)-(3,69)
(3,56)-(3,64)
(3,57)-(3,58)
(3,57)-(3,63)
*)
