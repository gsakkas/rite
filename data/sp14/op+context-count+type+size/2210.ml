
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
      match x with
      | (i,j) -> if (i + j) > 9 then (1, ((i + j) - 10)) else (0, (i + j))
      | _ -> a in
    let base = [] in
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
(20,6)-(22,14)
(21,17)-(21,74)
(21,20)-(21,27)
(21,20)-(21,31)
(21,21)-(21,22)
(21,30)-(21,31)
(21,37)-(21,56)
(21,38)-(21,39)
(21,41)-(21,55)
(21,42)-(21,49)
(21,43)-(21,44)
(21,52)-(21,54)
(21,62)-(21,74)
(21,66)-(21,73)
(21,67)-(21,68)
(21,71)-(21,72)
(22,13)-(22,14)
(23,4)-(25,51)
(24,4)-(25,51)
(25,4)-(25,51)
*)

(* type error slice
(19,4)-(25,51)
(19,10)-(22,14)
(20,6)-(22,14)
(20,6)-(22,14)
(21,17)-(21,74)
(21,37)-(21,56)
(22,13)-(22,14)
(23,4)-(25,51)
(23,15)-(23,17)
(25,18)-(25,32)
(25,18)-(25,44)
(25,33)-(25,34)
(25,35)-(25,39)
*)
