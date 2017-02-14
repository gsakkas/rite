
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
      | (i,j)::t -> if (i + j) > 9 then (1, ((i + j) - 10)) else (0, (i + j))
      | [] -> a in
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
(20,7)-(22,16)
(21,21)-(21,76)
(21,25)-(21,26)
(21,25)-(21,30)
(21,25)-(21,35)
(21,34)-(21,35)
(21,42)-(21,43)
(21,42)-(21,58)
(21,47)-(21,48)
(21,47)-(21,52)
(21,47)-(21,58)
(21,56)-(21,58)
(21,67)-(21,76)
(21,71)-(21,72)
(21,71)-(21,76)
(21,75)-(21,76)
(22,15)-(22,16)
(23,5)-(25,52)
(24,5)-(25,52)
(25,5)-(25,52)
*)

(* type error slice
(19,5)-(25,52)
(19,11)-(22,16)
(20,7)-(22,16)
(20,7)-(22,16)
(21,21)-(21,76)
(21,42)-(21,58)
(22,15)-(22,16)
(23,5)-(25,52)
(23,16)-(23,18)
(25,19)-(25,33)
(25,19)-(25,45)
(25,34)-(25,35)
(25,36)-(25,40)
*)
