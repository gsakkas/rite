
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if (x1 + x2) > 10
      then (1, (((x1 + x2) + a1) - 10))
      else (0, ((x1 + x2) + a1)) in
    let base = (0, 0) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if (x1 + x2) > 10
      then (1, ((((x1 + x2) + a1) - 10) :: a2))
      else (0, (((x1 + x2) + a1) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,19)-(19,38)
(20,13)-(20,31)
(20,18)-(20,31)
(21,5)-(23,52)
(21,20)-(21,21)
(24,20)-(24,27)
(24,28)-(24,30)
(24,31)-(24,33)
*)

(* type error slice
(11,3)-(11,76)
(11,3)-(11,76)
(11,52)-(11,62)
(11,52)-(11,64)
(11,63)-(11,64)
(14,3)-(24,33)
(14,12)-(23,52)
(15,5)-(23,52)
(15,5)-(23,52)
(15,11)-(20,31)
(15,13)-(20,31)
(16,7)-(20,31)
(17,7)-(20,31)
(18,7)-(20,31)
(19,13)-(19,38)
(19,19)-(19,38)
(21,5)-(23,52)
(22,5)-(23,52)
(23,5)-(23,52)
(23,5)-(23,52)
(23,19)-(23,33)
(23,19)-(23,45)
(23,34)-(23,35)
(23,49)-(23,52)
(24,3)-(24,13)
(24,3)-(24,33)
(24,15)-(24,18)
(24,15)-(24,33)
*)
