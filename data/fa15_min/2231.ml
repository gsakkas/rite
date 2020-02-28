
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = (1, 0) in
    let args =
      let combine (a,b) = a + b in
      List.map combine (List.rev (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match a with | (o,[]) -> (o, [x]) | (o,l) -> (o, (x :: l)) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      List.map combine (List.rev (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,17)-(18,45)
match a with
| (o , []) -> (o , [x])
| (o , l) -> (o , x :: l)
CaseG VarG [(TuplePatG (fromList [EmptyPatG]),Nothing,TupleG [EmptyG,EmptyG]),(TuplePatG (fromList [EmptyPatG]),Nothing,TupleG [EmptyG,EmptyG])]

(19,17)-(19,18)
0
LitG

(19,20)-(19,21)
[]
ListG []

*)

(* type error slice
(14,3)-(14,74)
(14,50)-(14,60)
(14,50)-(14,62)
(14,61)-(14,62)
(17,3)-(24,35)
(17,12)-(23,52)
(18,5)-(23,52)
(19,5)-(23,52)
(19,16)-(19,22)
(19,20)-(19,21)
(20,5)-(23,52)
(23,5)-(23,52)
(23,19)-(23,33)
(23,19)-(23,45)
(23,36)-(23,40)
(23,49)-(23,52)
(24,3)-(24,13)
(24,3)-(24,35)
(24,14)-(24,35)
(24,15)-(24,18)
*)
