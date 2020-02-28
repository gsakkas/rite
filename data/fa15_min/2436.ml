
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
    let f a x = x in
    let base = [] in
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
LetG NonRec [(TuplePatG (fromList [EmptyPatG]),VarG)] (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

(20,16)-(20,18)
([] , [])
TupleG [ListG [],ListG []]

*)

(* type error slice
(19,5)-(22,52)
(19,11)-(19,18)
(19,13)-(19,18)
(19,17)-(19,18)
(20,5)-(22,52)
(20,16)-(20,18)
(21,5)-(22,52)
(21,16)-(21,24)
(21,16)-(21,45)
(21,25)-(21,45)
(21,26)-(21,38)
(22,19)-(22,33)
(22,19)-(22,45)
(22,34)-(22,35)
(22,36)-(22,40)
(22,41)-(22,45)
*)
