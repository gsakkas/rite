
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
(23,49)-(23,52)
[res]
ListG (fromList [VarG])

*)

(* type error slice
(14,3)-(14,69)
(14,50)-(14,60)
(14,50)-(14,62)
(14,61)-(14,62)
(17,3)-(24,35)
(17,12)-(23,52)
(18,5)-(23,52)
(18,11)-(20,33)
(18,13)-(20,33)
(19,7)-(20,33)
(20,7)-(20,33)
(20,20)-(20,32)
(21,5)-(23,52)
(22,5)-(23,52)
(23,5)-(23,52)
(23,19)-(23,33)
(23,19)-(23,45)
(23,34)-(23,35)
(23,49)-(23,52)
(24,3)-(24,13)
(24,3)-(24,35)
(24,14)-(24,35)
(24,15)-(24,18)
*)
