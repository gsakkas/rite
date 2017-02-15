
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
(23,48)-(23,51)
*)

(* type error slice
(14,2)-(14,68)
(14,2)-(14,68)
(14,49)-(14,59)
(14,49)-(14,61)
(14,60)-(14,61)
(17,2)-(24,34)
(17,11)-(23,51)
(18,4)-(23,51)
(18,4)-(23,51)
(18,10)-(20,32)
(18,12)-(20,32)
(19,6)-(20,32)
(20,6)-(20,32)
(20,19)-(20,31)
(21,4)-(23,51)
(22,4)-(23,51)
(23,4)-(23,51)
(23,4)-(23,51)
(23,18)-(23,32)
(23,18)-(23,44)
(23,33)-(23,34)
(23,48)-(23,51)
(24,2)-(24,12)
(24,2)-(24,34)
(24,13)-(24,34)
(24,14)-(24,17)
*)
