
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
(19,16)-(19,17)
(19,16)-(19,21)
(20,4)-(26,51)
(20,15)-(20,16)
(21,4)-(26,51)
(22,6)-(25,20)
(22,18)-(22,30)
(22,18)-(22,58)
(22,31)-(22,44)
(22,32)-(22,40)
(22,41)-(22,43)
(22,45)-(22,58)
(22,46)-(22,54)
(22,55)-(22,57)
(23,6)-(25,20)
(23,12)-(23,17)
(24,20)-(24,77)
(24,23)-(24,30)
(24,23)-(24,34)
(24,24)-(24,25)
(24,28)-(24,29)
(24,33)-(24,34)
(24,40)-(24,59)
(24,41)-(24,42)
(24,44)-(24,58)
(24,46)-(24,47)
(24,55)-(24,57)
(24,65)-(24,77)
(24,66)-(24,67)
(24,69)-(24,76)
(24,70)-(24,71)
(25,14)-(25,20)
(25,18)-(25,19)
(26,4)-(26,51)
(26,18)-(26,44)
(27,19)-(27,26)
*)

(* type error slice
(21,4)-(26,51)
(22,6)-(25,20)
(23,6)-(25,20)
(24,20)-(24,77)
(24,40)-(24,59)
(26,18)-(26,32)
(26,18)-(26,44)
(26,40)-(26,44)
*)
