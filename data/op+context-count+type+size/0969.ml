
let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper x (n - 1) (x :: acc) in
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
      let sum = (fst a) + (((fst x) + (snd x)) mod 10) in
      ((sum / 10), (sum mod 10)) in
    let base = (0, 0) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper x (n - 1) (x :: acc) in
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
      let sum = (fst a) + (((fst x) + (snd x)) mod 10) in
      ((sum / 10), (sum mod 10)) in
    let base = (0, 0) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in [res] in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(21,17)-(21,18)
(21,20)-(21,21)
(23,49)-(23,52)
*)

(* type error slice
(2,4)-(5,23)
(2,15)-(5,21)
(2,17)-(5,21)
(3,3)-(5,21)
(4,28)-(4,39)
(4,28)-(4,59)
(4,40)-(4,41)
(4,43)-(4,48)
(4,51)-(4,59)
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
(14,3)-(14,69)
(14,50)-(14,60)
(14,50)-(14,62)
(14,61)-(14,62)
(17,3)-(24,33)
(17,12)-(23,52)
(18,5)-(23,52)
(18,11)-(20,31)
(18,13)-(20,31)
(19,7)-(20,31)
(19,18)-(19,21)
(19,18)-(19,23)
(19,22)-(19,23)
(19,30)-(19,33)
(19,30)-(19,35)
(19,34)-(19,35)
(20,9)-(20,17)
(20,9)-(20,31)
(20,21)-(20,31)
(21,5)-(23,52)
(21,17)-(21,18)
(21,17)-(21,21)
(21,20)-(21,21)
(22,5)-(23,52)
(22,16)-(22,28)
(22,16)-(22,34)
(22,29)-(22,31)
(22,32)-(22,34)
(23,5)-(23,52)
(23,19)-(23,33)
(23,19)-(23,45)
(23,34)-(23,35)
(23,36)-(23,40)
(23,41)-(23,45)
(23,49)-(23,52)
(24,3)-(24,13)
(24,3)-(24,33)
(24,15)-(24,18)
(24,15)-(24,33)
(24,20)-(24,27)
(24,20)-(24,33)
(24,28)-(24,30)
(24,31)-(24,33)
*)
