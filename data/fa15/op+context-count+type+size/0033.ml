
let rec mulByDigit i l =
  let f a xs =
    let (a1,a2) = a in
    let h::t = xs in
    let val1 = (h * i) + a1 in
    if val1 > 9
    then ((val1 / 10), ((val1 mod 10) :: a2))
    else (0, (val1 :: a2)) in
  let base = (0, []) in
  let args = 0 :: (List.rev l) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec mulByDigit i l =
  let f a x =
    let (a1,a2) = a in
    let val1 = (x * i) + a1 in
    if val1 > 9
    then ((val1 / 10), ((val1 mod 10) :: a2))
    else (0, (val1 :: a2)) in
  let base = (0, []) in
  let args = 0 :: (List.rev l) in
  let (_,res) = List.fold_left f base args in res;;

let _ = mulByDigit 9 [9; 9; 9; 9];;

*)

(* changed spans
(3,11)-(9,25)
(5,5)-(9,25)
(5,16)-(5,18)
(6,5)-(9,25)
(6,17)-(6,18)
(10,3)-(12,50)
(11,3)-(12,50)
(12,3)-(12,50)
*)

(* type error slice
(3,3)-(12,50)
(3,9)-(9,25)
(3,11)-(9,25)
(5,5)-(9,25)
(5,5)-(9,25)
(5,16)-(5,18)
(11,3)-(12,50)
(11,14)-(11,15)
(11,14)-(11,30)
(11,14)-(11,30)
(12,17)-(12,31)
(12,17)-(12,43)
(12,32)-(12,33)
(12,39)-(12,43)
*)
