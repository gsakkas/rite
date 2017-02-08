
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then (l1, (List.append (clone 0 (first - sec)) l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      let (s,t) = a in (((i + j) / 10), (t :: ((i + j) mod 10))) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then (l1, (List.append (clone 0 (first - sec)) l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      let (s,t) = a in ((((i + j) + s) / 10), ((((i + j) + s) mod 10) :: t)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(21,27)-(21,28)
(21,36)-(21,38)
(21,42)-(21,43)
(21,49)-(21,50)
(21,60)-(21,62)
(22,5)-(24,52)
(25,20)-(25,27)
(25,28)-(25,30)
(25,31)-(25,33)
*)

(* type error slice
(19,5)-(24,52)
(19,11)-(21,62)
(19,13)-(21,62)
(20,7)-(21,62)
(21,7)-(21,62)
(21,7)-(21,62)
(21,19)-(21,20)
(21,27)-(21,62)
(21,42)-(21,43)
(21,42)-(21,62)
(21,42)-(21,62)
(21,42)-(21,62)
(21,49)-(21,62)
(24,19)-(24,33)
(24,19)-(24,45)
(24,34)-(24,35)
*)
