
let bigMul l1 l2 =
  let f a x = x in
  let base = ([], [0]) in
  let args =
    let rec helper acc l1 l2 =
      match l1 with
      | [] -> acc
      | h::t -> helper ((h, l2) :: acc) (List.map (fun x  -> x * 10) t) l2 in
    helper [] (List.rev l1) l2 in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let bigMul l1 l2 =
  let f a x = match x with | (k,v) -> ([k], v) in
  let base = ([], [0]) in
  let args =
    let rec helper acc l1 l2 =
      match l1 with
      | [] -> acc
      | h::t -> helper ((h, l2) :: acc) (List.map (fun x  -> x * 10) t) l2 in
    helper [] (List.rev l1) l2 in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(3,15)-(3,16)
match x with
| (k , v) -> ([k] , v)
CaseG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,TupleG (fromList [EmptyG]))])

*)

(* type error slice
(3,3)-(11,50)
(3,9)-(3,16)
(3,11)-(3,16)
(3,15)-(3,16)
(4,3)-(11,50)
(4,14)-(4,23)
(4,15)-(4,17)
(5,3)-(11,50)
(6,5)-(10,31)
(7,7)-(9,75)
(8,15)-(8,18)
(9,17)-(9,23)
(9,17)-(9,75)
(9,24)-(9,40)
(9,25)-(9,32)
(9,26)-(9,27)
(9,36)-(9,39)
(9,41)-(9,72)
(9,42)-(9,50)
(9,51)-(9,69)
(9,62)-(9,63)
(9,62)-(9,68)
(9,70)-(9,71)
(10,5)-(10,11)
(10,5)-(10,31)
(11,17)-(11,31)
(11,17)-(11,43)
(11,32)-(11,33)
(11,34)-(11,38)
(11,39)-(11,43)
*)
