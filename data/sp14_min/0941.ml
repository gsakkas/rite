
let rec mulByDigit i l =
  let f x a =
    let digitRes = (x * i) + (fst a) in
    ((digitRes / 10), ((digitRes mod 10) :: (snd a))) in
  let base = (0, []) in
  let (_,result) = List.fold_right f ((0, 0) :: l) base in result;;


(* fix

let rec mulByDigit i l =
  let f x a =
    let digitRes = (x * i) + (fst a) in
    ((digitRes / 10), ((digitRes mod 10) :: (snd a))) in
  let base = (0, []) in
  let (_,result) = List.fold_right f (0 :: l) base in result;;

*)

(* changed spans
(7,39)-(7,45)
0
LitG

*)

(* type error slice
(3,3)-(7,66)
(3,9)-(5,54)
(4,20)-(4,27)
(4,21)-(4,22)
(7,20)-(7,35)
(7,20)-(7,56)
(7,36)-(7,37)
(7,38)-(7,51)
(7,39)-(7,45)
*)
