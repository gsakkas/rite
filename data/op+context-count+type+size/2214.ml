
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
      let (s,t) = a in (((i + j) / 10), (t :: ((i + j) mod 10))) = a in
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
(21,27)-(21,69)
(21,36)-(21,38)
(21,42)-(21,43)
(21,49)-(21,50)
(21,60)-(21,62)
(21,68)-(21,69)
*)

(* type error slice
(19,5)-(24,52)
(19,11)-(21,69)
(19,13)-(21,69)
(20,7)-(21,69)
(20,19)-(20,20)
(21,7)-(21,69)
(21,19)-(21,20)
(21,27)-(21,38)
(21,27)-(21,62)
(21,27)-(21,69)
(21,42)-(21,43)
(21,42)-(21,62)
(21,49)-(21,62)
(21,68)-(21,69)
(22,5)-(24,52)
(22,17)-(22,18)
(22,17)-(22,22)
(22,20)-(22,22)
(23,5)-(24,52)
(23,16)-(23,28)
(23,16)-(23,55)
(23,30)-(23,38)
(23,30)-(23,41)
(23,39)-(23,41)
(23,44)-(23,52)
(23,44)-(23,55)
(23,53)-(23,55)
(24,19)-(24,33)
(24,19)-(24,45)
(24,34)-(24,35)
(24,36)-(24,40)
(24,41)-(24,45)
*)
