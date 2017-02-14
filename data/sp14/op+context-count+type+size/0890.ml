
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
(4,4)-(6,58)
(4,20)-(4,21)
(5,4)-(6,58)
(6,4)-(6,58)
(6,10)-(6,13)
(6,27)-(6,29)
(6,41)-(6,50)
(6,48)-(6,49)
(6,52)-(6,57)
(7,2)-(9,49)
(7,13)-(7,21)
(8,2)-(9,49)
(8,13)-(8,43)
(8,29)-(8,42)
(9,2)-(9,49)
*)

(* type error slice
(3,2)-(9,49)
(3,8)-(6,58)
(3,10)-(6,58)
(4,4)-(6,58)
(5,4)-(6,58)
(5,4)-(6,58)
(5,22)-(5,23)
(6,4)-(6,58)
(6,4)-(6,58)
(6,27)-(6,29)
(6,40)-(6,58)
(9,16)-(9,30)
(9,16)-(9,42)
(9,31)-(9,32)
*)
