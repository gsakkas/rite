
let rec mulByDigit i l =
  let comb a b = match b with | [] -> [a] | hd::tl -> [a + hd] @ [tl] in
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
(3,66)-(3,70)
tl
VarG

*)

(* type error slice
(3,18)-(3,70)
(3,55)-(3,63)
(3,55)-(3,70)
(3,56)-(3,62)
(3,64)-(3,65)
(3,66)-(3,70)
(3,67)-(3,69)
*)
