
let x x = x;;

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else x :: xs;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + x in
    let base = 0 in
    let args = [l1] in let (_,res) = List.fold_left f base args in res in
  (removeZero (add (padZero l1 l2)) 0 0 9 9) + (1 0 0 2);;


(* fix

let l1 = [0; 0; 9; 9];;

let l2 = [1; 0; 0; 2];;

let x = (3, 3) :: (List.rev (List.combine l1 l2));;

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else x :: xs;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = x in
    let base = (0, []) in
    let args = [(0, [])] in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(2,7)-(2,12)
(3 , 3) :: (List.rev (List.combine l1
                                   l2))
ConAppG (Just (TupleG (fromList [EmptyG])))

(19,17)-(19,22)
x
VarG

(20,16)-(20,17)
(0 , [])
TupleG (fromList [LitG,ListG (fromList [])])

(21,17)-(21,19)
(0 , [])
TupleG (fromList [LitG,ListG (fromList [])])

(22,3)-(22,57)
removeZero (add (padZero l1
                         l2))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(19,5)-(21,71)
(19,11)-(19,22)
(19,17)-(19,18)
(19,17)-(19,22)
(21,24)-(21,71)
(21,38)-(21,52)
(21,38)-(21,64)
(21,53)-(21,54)
(22,48)-(22,57)
(22,49)-(22,50)
*)
