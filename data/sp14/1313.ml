
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
(4,5)-(6,59)
let (pos , total) = a in
(pos , l2)
LetG NonRec [(TuplePatG (fromList [EmptyPatG]),VarG)] (TupleG [EmptyG,EmptyG])

(8,14)-(8,44)
List.rev l1
AppG [VarG]

*)

(* type error slice
(3,3)-(9,50)
(3,9)-(6,59)
(3,11)-(6,59)
(4,5)-(6,59)
(5,5)-(6,59)
(5,23)-(5,24)
(6,5)-(6,59)
(6,28)-(6,30)
(6,41)-(6,59)
(9,17)-(9,31)
(9,17)-(9,43)
(9,32)-(9,33)
*)
