
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
(14,42)-(14,64)
a
VarG

(14,42)-(14,64)
match a with
| (h1 :: t1 , h2 :: t2) -> (v1 :: (h1 :: t1) , v2 :: (h2 :: t2))
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(14,55)-(14,57)
h1
VarG

(14,55)-(14,57)
t1
VarG

(14,55)-(14,57)
v2 :: (h2 :: t2)
ConAppG (Just (TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG]))) Nothing]))) Nothing

(14,61)-(14,62)
h2 :: t2
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(15,4)-(17,51)
h2
VarG

(15,4)-(17,51)
t2
VarG

*)
