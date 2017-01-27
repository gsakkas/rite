
let rec clone x n =
  let rec cloneHelper x n acc =
    if n <= 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((List.append (clone 0 (abs diff)) l1), l2)
  else if diff > 0 then (l1, (List.append (clone 0 diff) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst a) + ((fst x) + (snd x)) in
      ((sum / 10), ((sum mod 10) :: (snd a))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_right f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec cloneHelper x n acc =
    if n <= 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((List.append (clone 0 (abs diff)) l1), l2)
  else if diff > 0 then (l1, (List.append (clone 0 diff) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst a) + ((fst x) + (snd x)) in
      ((sum / 10), ((sum mod 10) :: (snd a))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,19)-(23,34)
*)

(* type error slice
(18,5)-(23,53)
(18,11)-(20,43)
(18,13)-(20,43)
(19,7)-(20,43)
(19,18)-(19,21)
(19,18)-(19,23)
(19,22)-(19,23)
(19,29)-(19,32)
(19,29)-(19,34)
(19,33)-(19,34)
(20,9)-(20,17)
(20,9)-(20,43)
(20,22)-(20,43)
(21,5)-(23,53)
(21,17)-(21,18)
(21,17)-(21,22)
(21,20)-(21,22)
(22,5)-(23,53)
(22,16)-(22,28)
(22,16)-(22,34)
(22,29)-(22,31)
(22,32)-(22,34)
(23,19)-(23,34)
(23,19)-(23,46)
(23,35)-(23,36)
(23,37)-(23,41)
(23,42)-(23,46)
*)
