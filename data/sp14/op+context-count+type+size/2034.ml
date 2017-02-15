
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
(7,38)-(7,44)
(7,42)-(7,43)
*)

(* type error slice
(3,2)-(7,65)
(3,8)-(5,53)
(4,19)-(4,26)
(4,20)-(4,21)
(7,19)-(7,34)
(7,19)-(7,55)
(7,35)-(7,36)
(7,37)-(7,50)
(7,37)-(7,50)
(7,38)-(7,44)
*)
