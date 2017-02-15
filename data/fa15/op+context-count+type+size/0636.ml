
let bigMul l1 l2 =
  let f a x =
    let (m,n) = a in
    let (c,d) = x in let z = (c * d) + m in ((z / 10), ((z mod 10) :: n)) in
  let base = (0, []) in
  let args =
    List.combine (List.rev ([(0, 0, 0, 0)] :: l1))
      (List.rev ([(0, 0, 0, 0)] :: l2)) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let bigMul l1 l2 =
  let f a x =
    let (m,n) = a in
    let (c,d) = x in let z = (c * d) + m in ((z / 10), ((z mod 10) :: n)) in
  let base = (0, []) in
  let args =
    List.combine (List.rev (0 :: 0 :: 0 :: 0 :: l1))
      (List.rev (0 :: 0 :: 0 :: 0 :: l2)) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(8,28)-(8,42)
(8,29)-(8,41)
(8,33)-(8,34)
(8,36)-(8,37)
(8,39)-(8,40)
(9,17)-(9,31)
(9,18)-(9,30)
(9,22)-(9,23)
(9,25)-(9,26)
(9,28)-(9,29)
*)

(* type error slice
(3,2)-(10,49)
(3,8)-(5,73)
(3,10)-(5,73)
(5,4)-(5,73)
(5,16)-(5,17)
(5,29)-(5,36)
(5,34)-(5,35)
(7,2)-(10,49)
(8,4)-(8,16)
(8,4)-(9,39)
(9,6)-(9,39)
(9,7)-(9,15)
(9,16)-(9,38)
(9,16)-(9,38)
(9,17)-(9,31)
(10,16)-(10,30)
(10,16)-(10,42)
(10,31)-(10,32)
(10,38)-(10,42)
*)
