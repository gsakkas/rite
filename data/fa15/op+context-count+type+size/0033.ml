
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
(3,10)-(9,26)
(5,4)-(9,26)
(5,15)-(5,17)
(6,4)-(9,26)
(6,16)-(6,17)
(10,2)-(12,49)
(11,2)-(12,49)
(12,2)-(12,49)
*)

(* type error slice
(3,2)-(12,49)
(3,8)-(9,26)
(3,10)-(9,26)
(5,4)-(9,26)
(5,4)-(9,26)
(5,15)-(5,17)
(11,2)-(12,49)
(11,13)-(11,14)
(11,13)-(11,30)
(11,13)-(11,30)
(12,16)-(12,30)
(12,16)-(12,42)
(12,31)-(12,32)
(12,38)-(12,42)
*)
