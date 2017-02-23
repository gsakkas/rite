
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
    let f a x = a + (((fst x) + (snd x)) mod 10) in
    let base = 0 in
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
(18,16)-(18,17)
(18,16)-(18,48)
(19,4)-(21,51)
(19,15)-(19,16)
(20,4)-(21,51)
(20,15)-(20,33)
(21,4)-(21,51)
(21,48)-(21,51)
(22,2)-(22,12)
(22,2)-(22,34)
(22,14)-(22,17)
(22,18)-(22,33)
(22,19)-(22,26)
(22,27)-(22,29)
(22,30)-(22,32)
*)

(* type error slice
(18,4)-(21,51)
(18,10)-(18,48)
(18,16)-(18,17)
(18,16)-(18,48)
(21,4)-(21,51)
(21,18)-(21,32)
(21,18)-(21,44)
(21,33)-(21,34)
*)

(* all spans
(2,14)-(5,20)
(2,16)-(5,20)
(3,2)-(5,20)
(3,22)-(4,59)
(3,24)-(4,59)
(3,26)-(4,59)
(4,4)-(4,59)
(4,7)-(4,12)
(4,7)-(4,8)
(4,11)-(4,12)
(4,18)-(4,21)
(4,27)-(4,59)
(4,27)-(4,38)
(4,39)-(4,40)
(4,41)-(4,48)
(4,42)-(4,43)
(4,46)-(4,47)
(4,49)-(4,59)
(4,50)-(4,51)
(4,55)-(4,58)
(5,2)-(5,20)
(5,2)-(5,13)
(5,14)-(5,15)
(5,16)-(5,17)
(5,18)-(5,20)
(7,12)-(11,75)
(7,15)-(11,75)
(8,2)-(11,75)
(8,13)-(8,48)
(8,13)-(8,29)
(8,14)-(8,25)
(8,26)-(8,28)
(8,32)-(8,48)
(8,33)-(8,44)
(8,45)-(8,47)
(9,2)-(11,75)
(9,5)-(9,13)
(9,5)-(9,9)
(9,12)-(9,13)
(10,7)-(10,50)
(10,8)-(10,45)
(10,9)-(10,20)
(10,21)-(10,41)
(10,22)-(10,27)
(10,28)-(10,29)
(10,30)-(10,40)
(10,31)-(10,34)
(10,35)-(10,39)
(10,42)-(10,44)
(10,47)-(10,49)
(11,7)-(11,75)
(11,10)-(11,18)
(11,10)-(11,14)
(11,17)-(11,18)
(11,24)-(11,61)
(11,25)-(11,27)
(11,29)-(11,60)
(11,30)-(11,41)
(11,42)-(11,56)
(11,43)-(11,48)
(11,49)-(11,50)
(11,51)-(11,55)
(11,57)-(11,59)
(11,67)-(11,75)
(11,68)-(11,70)
(11,72)-(11,74)
(13,19)-(14,68)
(14,2)-(14,68)
(14,8)-(14,9)
(14,23)-(14,24)
(14,35)-(14,68)
(14,38)-(14,43)
(14,38)-(14,39)
(14,42)-(14,43)
(14,49)-(14,61)
(14,49)-(14,59)
(14,60)-(14,61)
(14,67)-(14,68)
(16,11)-(22,34)
(16,14)-(22,34)
(17,2)-(22,34)
(17,11)-(21,51)
(18,4)-(21,51)
(18,10)-(18,48)
(18,12)-(18,48)
(18,16)-(18,48)
(18,16)-(18,17)
(18,20)-(18,48)
(18,21)-(18,40)
(18,22)-(18,29)
(18,23)-(18,26)
(18,27)-(18,28)
(18,32)-(18,39)
(18,33)-(18,36)
(18,37)-(18,38)
(18,45)-(18,47)
(19,4)-(21,51)
(19,15)-(19,16)
(20,4)-(21,51)
(20,15)-(20,33)
(20,15)-(20,27)
(20,28)-(20,30)
(20,31)-(20,33)
(21,4)-(21,51)
(21,18)-(21,44)
(21,18)-(21,32)
(21,33)-(21,34)
(21,35)-(21,39)
(21,40)-(21,44)
(21,48)-(21,51)
(22,2)-(22,34)
(22,2)-(22,12)
(22,13)-(22,34)
(22,14)-(22,17)
(22,18)-(22,33)
(22,19)-(22,26)
(22,27)-(22,29)
(22,30)-(22,32)
*)
