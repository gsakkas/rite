
let bigMul l1 l2 =
  let f a x =
    let (m,n) = a in
    let (c,d) = x in let z = (c * d) + m in ((z / 10), ((z mod 10) :: n)) in
  let base = (0, []) in
  let args =
    List.combine (List.rev ([0; 0; 0; 0] :: l1))
      (List.rev ([0; 0; 0; 0] :: l2)) in
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
(8,29)-(8,41)
(8,33)-(8,34)
(8,36)-(8,37)
(8,39)-(8,40)
(9,18)-(9,30)
(9,22)-(9,23)
(9,25)-(9,26)
(9,28)-(9,29)
*)

(* type error slice
(3,3)-(10,50)
(3,9)-(5,72)
(3,11)-(5,72)
(5,5)-(5,72)
(5,17)-(5,18)
(5,31)-(5,36)
(5,35)-(5,36)
(7,3)-(10,50)
(8,5)-(8,17)
(8,5)-(9,36)
(9,8)-(9,16)
(9,8)-(9,36)
(9,18)-(9,30)
(9,18)-(9,36)
(9,18)-(9,36)
(10,17)-(10,31)
(10,17)-(10,43)
(10,32)-(10,33)
(10,39)-(10,43)
*)
