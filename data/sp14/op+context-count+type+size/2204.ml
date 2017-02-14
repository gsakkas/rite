
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
      let (s,t) = a in
      (((((i + j) + s) + t) / 10), ((((i + j) + s) + t) mod 10)) in
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
(22,10)-(22,17)
(22,25)-(22,26)
(22,35)-(22,63)
(22,38)-(22,45)
(22,53)-(22,54)
(23,4)-(25,51)
(23,15)-(23,22)
(24,4)-(25,51)
(25,4)-(25,51)
*)

(* type error slice
(19,4)-(25,51)
(19,10)-(22,64)
(21,6)-(22,64)
(21,18)-(21,19)
(22,8)-(22,27)
(22,25)-(22,26)
(23,4)-(25,51)
(23,15)-(23,22)
(23,19)-(23,21)
(25,18)-(25,32)
(25,18)-(25,44)
(25,33)-(25,34)
(25,35)-(25,39)
*)
