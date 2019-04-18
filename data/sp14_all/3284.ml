
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (list1,list2) -> (match (list1, list2) with | [] -> ([], [])) in
    let base = ([0], [0]) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with | ([],[]) -> ([], []) | (list1,list2) -> (list1, list2) in
    let base = ([0], [0]) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,7)-(16,70)
match a with
| ([] , []) -> ([] , [])
| (list1 , list2) -> (list1 , list2)
CaseG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,TupleG (fromList [EmptyG])),(TuplePatG (fromList [ConPatG Nothing]),Nothing,TupleG (fromList [EmptyG]))])

(16,26)-(16,70)
([] , [])
TupleG (fromList [ListG (fromList [])])

*)

(* type error slice
(16,26)-(16,70)
(16,33)-(16,47)
*)
