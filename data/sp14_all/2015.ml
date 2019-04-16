
let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) = (List.length l2) with
  | true  -> (l1, l2)
  | false  ->
      let lendiff = (List.length l1) - (List.length l2) in
      (match lendiff > 0 with
       | true  -> (l1, ((clone 0 lendiff) @ l2))
       | false  -> (((clone 0 (- lendiff)) @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a (x,y) = ((x + y) + a) / 10 in
    let base = 0 in
    let args = List.combine l1 l2 in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) = (List.length l2) with
  | true  -> (l1, l2)
  | false  ->
      let lendiff = (List.length l1) - (List.length l2) in
      (match lendiff > 0 with
       | true  -> (l1, ((clone 0 lendiff) @ l2))
       | false  -> (((clone 0 (- lendiff)) @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a (x,y) = ((x + y) / 10) :: a in
    let base = [] in
    let args = List.combine l1 l2 in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,21)-(19,39)
((x + y) / 10) :: a
ConAppG (Just (TupleG (fromList [EmptyG])))

(20,16)-(20,17)
[]
ListG (fromList [])

(21,38)-(21,64)
let res =
  List.fold_left f base args in
res
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) VarG

*)

(* type error slice
(15,3)-(15,58)
(15,37)-(15,47)
(15,37)-(15,49)
(15,48)-(15,49)
(18,3)-(22,35)
(18,12)-(21,64)
(19,5)-(21,64)
(19,11)-(19,39)
(19,21)-(19,34)
(19,32)-(19,33)
(20,5)-(21,64)
(21,5)-(21,64)
(21,38)-(21,52)
(21,38)-(21,64)
(21,53)-(21,54)
(22,3)-(22,13)
(22,3)-(22,35)
(22,14)-(22,35)
(22,15)-(22,18)
*)
