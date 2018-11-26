
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
(2,10)-(2,11)
[0 ; 0 ; 9 ; 9]
ListG LitG Nothing

(4,10)-(7,15)
List.rev
VarG

(4,10)-(7,15)
List.combine
VarG

(4,10)-(7,15)
l1
VarG

(4,10)-(7,15)
l2
VarG

(4,10)-(7,15)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(4,10)-(7,15)
List.combine l1 l2
AppG (fromList [VarG])

(4,10)-(7,15)
0
LitG

(4,10)-(7,15)
0
LitG

(4,10)-(7,15)
9
LitG

(4,10)-(7,15)
9
LitG

(4,10)-(7,15)
1
LitG

(4,10)-(7,15)
0
LitG

(4,10)-(7,15)
0
LitG

(4,10)-(7,15)
2
LitG

(4,10)-(7,15)
3
LitG

(4,10)-(7,15)
3
LitG

(4,10)-(7,15)
(3 , 3)
TupleG (fromList [LitG])

(4,10)-(7,15)
(3 , 3) :: (List.rev (List.combine l1
                                   l2))
ConAppG (Just (TupleG (fromList [AppG (fromList [AppG (fromList [VarG])]),TupleG (fromList [LitG])]))) Nothing

(4,10)-(7,15)
[1 ; 0 ; 0 ; 2]
ListG LitG Nothing

(20,15)-(20,16)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(21,4)-(21,76)
[]
ListG EmptyG Nothing

(21,21)-(21,23)
0
LitG

(21,29)-(21,76)
[]
ListG EmptyG Nothing

(22,2)-(22,44)
removeZero (add (padZero l1
                         l2))
AppG (fromList [AppG (fromList [EmptyG])])

*)
