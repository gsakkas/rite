
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
    let f a x = a + x in
    let base = List.combine (List.rev l1) (List.rev l2) in
    let args = List.split base in
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
(19,17)-(19,18)
(19,17)-(19,22)
(20,5)-(22,52)
(20,16)-(20,55)
(20,44)-(20,52)
(20,53)-(20,55)
(21,5)-(22,52)
(21,16)-(21,26)
(21,16)-(21,31)
(21,27)-(21,31)
(22,5)-(22,52)
(22,19)-(22,33)
(22,19)-(22,45)
(22,34)-(22,35)
(22,36)-(22,40)
(22,41)-(22,45)
(22,49)-(22,52)
(23,3)-(23,13)
(23,3)-(23,33)
(23,15)-(23,18)
(23,20)-(23,27)
(23,20)-(23,33)
(23,28)-(23,30)
(23,31)-(23,33)
*)

(* type error slice
(19,5)-(22,52)
(19,11)-(19,22)
(19,17)-(19,18)
(19,17)-(19,22)
(21,16)-(21,26)
(21,16)-(21,31)
(21,27)-(21,31)
(22,19)-(22,33)
(22,19)-(22,45)
(22,34)-(22,35)
(22,36)-(22,40)
*)
