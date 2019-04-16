
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
    let f a x = a in
    let base = (1, 1) in
    let args = List.combine l1 l2 in
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
      let (l1x,l2x) = x in let (a1,a2) = a in (a1, ((l1x + l2x) :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,17)-(19,18)
let (l1x , l2x) = x in
let (a1 , a2) = a in
(a1 , (l1x + l2x) :: a2)
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG]),VarG)]) (LetG NonRec (fromList [(TuplePatG (fromList [EmptyPatG]),EmptyG)]) EmptyG)

(20,17)-(20,18)
[]
ListG (fromList [])

(20,20)-(20,21)
[]
ListG (fromList [])

(21,16)-(21,34)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(15,3)-(15,70)
(15,51)-(15,61)
(15,51)-(15,63)
(15,62)-(15,63)
(18,3)-(23,35)
(18,12)-(22,52)
(19,5)-(22,52)
(20,5)-(22,52)
(20,16)-(20,22)
(20,20)-(20,21)
(21,5)-(22,52)
(22,5)-(22,52)
(22,19)-(22,33)
(22,19)-(22,45)
(22,36)-(22,40)
(22,49)-(22,52)
(23,3)-(23,13)
(23,3)-(23,35)
(23,14)-(23,35)
(23,15)-(23,18)
*)
