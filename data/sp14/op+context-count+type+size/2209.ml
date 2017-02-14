
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
      if (i + j) > 9
      then (1, ((i + j) - 10))
      else if (i + j) <= 9 then (0, (i + j)) in
    let base = (0, 0) in
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
(21,7)-(23,43)
(21,11)-(21,12)
(21,11)-(21,16)
(21,11)-(21,21)
(21,15)-(21,16)
(21,20)-(21,21)
(22,13)-(22,14)
(22,13)-(22,29)
(22,18)-(22,19)
(22,18)-(22,29)
(22,27)-(22,29)
(23,12)-(23,43)
(23,16)-(23,17)
(23,16)-(23,21)
(23,16)-(23,27)
(23,20)-(23,21)
(23,26)-(23,27)
(23,34)-(23,35)
(23,34)-(23,43)
(24,5)-(26,52)
(24,17)-(24,21)
(24,20)-(24,21)
(25,5)-(26,52)
(25,16)-(25,55)
(26,5)-(26,52)
*)

(* type error slice
(15,3)-(15,70)
(15,3)-(15,70)
(15,51)-(15,61)
(15,51)-(15,63)
(15,62)-(15,63)
(18,3)-(27,33)
(18,12)-(26,52)
(19,5)-(26,52)
(19,5)-(26,52)
(19,11)-(23,43)
(19,13)-(23,43)
(20,7)-(23,43)
(21,7)-(23,43)
(22,13)-(22,29)
(22,18)-(22,29)
(23,12)-(23,43)
(23,12)-(23,43)
(23,12)-(23,43)
(23,34)-(23,43)
(24,5)-(26,52)
(25,5)-(26,52)
(26,5)-(26,52)
(26,5)-(26,52)
(26,19)-(26,33)
(26,19)-(26,45)
(26,34)-(26,35)
(26,49)-(26,52)
(27,3)-(27,13)
(27,3)-(27,33)
(27,15)-(27,18)
(27,15)-(27,33)
*)
