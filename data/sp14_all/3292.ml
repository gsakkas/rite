
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (v1,v2) -> ((v1 :: a), (v2 :: a)) in
    let base = ([], []) in
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
      match x with
      | (v1,v2) ->
          (match a with
           | (h1::t1,h2::t2) -> ((v1 :: h1 :: t1), (v2 :: h2 :: t2))) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,43)-(14,65)
match a with
| (h1 :: t1 , h2 :: t2) -> (v1 :: (h1 :: t1) , v2 :: (h2 :: t2))
CaseG VarG (fromList [(TuplePatG (fromList [ConsPatG EmptyPatG EmptyPatG]),Nothing,TupleG (fromList [EmptyG]))])

*)

(* type error slice
(14,5)-(17,52)
(14,11)-(14,65)
(14,13)-(14,65)
(14,17)-(14,65)
(14,43)-(14,65)
(14,55)-(14,64)
(14,62)-(14,63)
(17,19)-(17,33)
(17,19)-(17,45)
(17,34)-(17,35)
*)
