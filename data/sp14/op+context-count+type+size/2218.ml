
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
      let (s,t) = a in (((i + j) / 10), ((i + j) mod 10)) = a in
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
(21,23)-(21,61)
(21,26)-(21,27)
(21,35)-(21,37)
(21,40)-(21,56)
(21,42)-(21,43)
(21,53)-(21,55)
(21,60)-(21,61)
(25,19)-(25,26)
(25,27)-(25,29)
(25,30)-(25,32)
*)

(* type error slice
(19,4)-(24,51)
(19,10)-(21,61)
(19,12)-(21,61)
(20,6)-(21,61)
(21,6)-(21,61)
(21,23)-(21,57)
(21,23)-(21,61)
(21,23)-(21,61)
(21,23)-(21,61)
(21,60)-(21,61)
(24,18)-(24,32)
(24,18)-(24,44)
(24,33)-(24,34)
*)
