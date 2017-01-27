
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
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in List.rev res in
  removeZero (add ((padZero 0) :: (l1 0) :: l2));;


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
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in List.rev res in
  removeZero (add (padZero (0 :: l1) (0 :: l2)));;

*)

(* changed spans
(24,21)-(24,30)
(24,21)-(24,47)
(24,29)-(24,30)
(24,36)-(24,40)
(24,39)-(24,40)
*)

(* type error slice
(2,4)-(5,23)
(2,15)-(5,21)
(2,17)-(5,21)
(3,3)-(5,21)
(4,29)-(4,40)
(4,29)-(4,60)
(4,41)-(4,42)
(4,44)-(4,49)
(4,52)-(4,60)
(5,3)-(5,14)
(5,3)-(5,21)
(5,15)-(5,16)
(5,17)-(5,18)
(5,19)-(5,21)
(7,4)-(11,78)
(7,13)-(11,75)
(7,16)-(11,75)
(8,3)-(11,75)
(8,15)-(8,26)
(8,15)-(8,29)
(8,15)-(8,48)
(8,27)-(8,29)
(8,34)-(8,45)
(8,34)-(8,48)
(8,46)-(8,48)
(9,3)-(11,75)
(10,10)-(10,21)
(10,10)-(10,45)
(10,10)-(10,50)
(10,23)-(10,28)
(10,23)-(10,40)
(10,29)-(10,30)
(10,32)-(10,35)
(10,32)-(10,40)
(10,36)-(10,40)
(10,43)-(10,45)
(10,48)-(10,50)
(17,3)-(24,47)
(17,12)-(23,61)
(18,5)-(23,61)
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
(21,5)-(23,61)
(21,17)-(21,18)
(21,17)-(21,22)
(21,20)-(21,22)
(22,5)-(23,61)
(22,16)-(22,28)
(22,16)-(22,55)
(22,30)-(22,38)
(22,30)-(22,41)
(22,39)-(22,41)
(22,44)-(22,52)
(22,44)-(22,55)
(22,53)-(22,55)
(23,5)-(23,61)
(23,19)-(23,33)
(23,19)-(23,45)
(23,34)-(23,35)
(23,36)-(23,40)
(23,41)-(23,45)
(23,49)-(23,57)
(23,49)-(23,61)
(23,58)-(23,61)
(24,15)-(24,18)
(24,15)-(24,47)
(24,21)-(24,28)
(24,21)-(24,30)
(24,21)-(24,47)
(24,29)-(24,30)
*)
