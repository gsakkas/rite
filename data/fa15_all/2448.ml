
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x = y
  then (l1, l2)
  else
    if x < y
    then (((clone 0 (y - x)) @ l1), l2)
    else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (l1x,l2x) = x in
      let (a1,a2) = a in
      let test = match a1 with | [] -> 0 | h::t -> h in
      let sum = (l1x + l2x) + test in
      let terms =
        match 2 with | [] -> (sum / 10) :: (sum mod 10) | h::t -> sum mod 10 in
      (((sum / 10) :: a1), (terms :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x = y
  then (l1, l2)
  else
    if x < y
    then (((clone 0 (y - x)) @ l1), l2)
    else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (l1x,l2x) = x in
      let (a1,a2) = a in
      let test = match a1 with | [] -> 0 | h::t -> h in
      let sum = (l1x + l2x) + test in
      match a2 with
      | [] -> ((0 :: a1), ((sum / 10) :: (sum mod 10) :: a2))
      | h::t -> (((sum / 10) :: a1), ((sum mod 10) :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(25,14)-(25,15)
a2
VarG

(25,29)-(25,39)
a1
VarG

(25,29)-(25,39)
0
LitG

(25,29)-(25,39)
(sum / 10) :: ((sum mod 10) :: a2)
ConAppG (Just (TupleG (fromList [BopG VarG LitG,ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing]))) Nothing

(25,29)-(25,55)
(0 :: a1 , (sum / 10) :: ((sum mod 10) :: a2))
TupleG (fromList [ConAppG (Just (TupleG (fromList [VarG,LitG]))) Nothing,ConAppG (Just (TupleG (fromList [BopG VarG LitG,ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing]))) Nothing])

(25,52)-(25,54)
(sum mod 10) :: a2
ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing

(26,6)-(26,41)
a2
VarG

(26,28)-(26,33)
sum mod 10
BopG VarG LitG

(26,37)-(26,39)
sum
VarG

(26,37)-(26,39)
10
LitG

*)
