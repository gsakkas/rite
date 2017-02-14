
let bigMul l1 l2 =
  let f a x =
    let (l1',l2') = x in
    let (pos,total) = a in
    match l2' with | [] -> [] | h::t -> ((pos + 1), total) in
  let base = (0, [0]) in
  let args = ((List.rev l1), (List.rev l2)) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let bigMul l1 l2 =
  let f a x = let (pos,total) = a in (pos, l2) in
  let base = (0, [0]) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(4,5)-(6,58)
(4,21)-(4,22)
(5,5)-(6,58)
(6,5)-(6,58)
(6,11)-(6,14)
(6,28)-(6,30)
(6,43)-(6,50)
(6,49)-(6,50)
(6,53)-(6,58)
(7,3)-(9,50)
(7,15)-(7,21)
(8,3)-(9,50)
(8,16)-(8,42)
(8,31)-(8,42)
(9,3)-(9,50)
*)

(* type error slice
(3,3)-(9,50)
(3,9)-(6,58)
(3,11)-(6,58)
(4,5)-(6,58)
(5,5)-(6,58)
(5,5)-(6,58)
(5,23)-(5,24)
(6,5)-(6,58)
(6,5)-(6,58)
(6,28)-(6,30)
(6,43)-(6,58)
(9,17)-(9,31)
(9,17)-(9,43)
(9,32)-(9,33)
*)
