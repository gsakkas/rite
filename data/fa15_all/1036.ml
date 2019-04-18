
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
0
LitG

(8,45)-(8,47)
0 :: (0 :: (0 :: l1))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(9,18)-(9,30)
0
LitG

(9,34)-(9,36)
0 :: (0 :: (0 :: l2))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(3,3)-(10,50)
(3,9)-(5,74)
(3,11)-(5,74)
(5,5)-(5,74)
(5,17)-(5,18)
(5,30)-(5,37)
(5,35)-(5,36)
(7,3)-(10,50)
(8,5)-(8,17)
(8,5)-(9,38)
(9,7)-(9,38)
(9,8)-(9,16)
(9,17)-(9,37)
(9,18)-(9,30)
(10,17)-(10,31)
(10,17)-(10,43)
(10,32)-(10,33)
(10,39)-(10,43)
*)
