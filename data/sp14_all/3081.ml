
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

let x x = x;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + x in
    let base = [x] in
    let args = [(l1, l2)] in let (_,res) = List.fold_left f base args in res in
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
(6,1)-(6,1)
(3 , 3) :: (List.rev (List.combine l1
                                   l2))
ConAppG (Just (TupleG (fromList [EmptyG])))

(15,7)-(15,12)
EMPTY
EmptyG

(19,17)-(19,22)
x
VarG

(20,16)-(20,19)
(0 , [])
TupleG (fromList [LitG,ListG (fromList [])])

(21,18)-(21,20)
0
LitG

(21,22)-(21,24)
[]
ListG (fromList [])

(22,3)-(22,57)
removeZero (add (padZero l1
                         l2))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(13,38)-(13,78)
(13,52)-(13,62)
(13,52)-(13,65)
(13,71)-(13,78)
(19,5)-(21,77)
(19,11)-(19,22)
(19,17)-(19,18)
(19,17)-(19,22)
(20,5)-(21,77)
(20,16)-(20,19)
(21,44)-(21,58)
(21,44)-(21,70)
(21,59)-(21,60)
(21,61)-(21,65)
(22,3)-(22,45)
(22,4)-(22,14)
(22,48)-(22,57)
(22,49)-(22,50)
*)
