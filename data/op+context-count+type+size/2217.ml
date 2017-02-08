
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
    let base = 0 in
    let args =
      let combo = List.combine (List.rev l1) (List.rev l2) in
      match combo with
      | (i,j)::t -> if (i + j) > 9 then (1, ((i + j) - 10)) else (0, (i + j))
      | [] -> (0, 0) in
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
(20,5)-(26,52)
(20,16)-(20,17)
(21,5)-(26,52)
(22,7)-(25,20)
(22,19)-(22,31)
(22,19)-(22,58)
(22,33)-(22,41)
(22,33)-(22,44)
(22,42)-(22,44)
(22,47)-(22,55)
(22,47)-(22,58)
(22,56)-(22,58)
(23,7)-(25,20)
(23,13)-(23,18)
(24,21)-(24,76)
(24,25)-(24,26)
(24,25)-(24,30)
(24,25)-(24,35)
(24,29)-(24,30)
(24,34)-(24,35)
(24,42)-(24,43)
(24,42)-(24,58)
(24,47)-(24,48)
(24,47)-(24,58)
(24,56)-(24,58)
(24,67)-(24,68)
(24,67)-(24,76)
(24,71)-(24,72)
(24,71)-(24,76)
(25,16)-(25,20)
(25,19)-(25,20)
(26,5)-(26,52)
(26,19)-(26,45)
*)

(* type error slice
(21,5)-(26,52)
(22,7)-(25,20)
(23,7)-(25,20)
(24,21)-(24,76)
(24,42)-(24,58)
(26,19)-(26,33)
(26,19)-(26,45)
(26,41)-(26,45)
*)
