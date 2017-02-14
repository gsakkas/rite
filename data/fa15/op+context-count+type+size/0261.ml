
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
      match a with
      | [] -> []
      | h::t -> let (j,k) = x in if (j + k) > 10 then 1 :: h else 0 :: h in
    let base = (0, 0) in
    let args = List.combine ((List.rev l1), (List.rev l2)) in
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
(16,7)-(18,73)
(16,13)-(16,14)
(17,15)-(17,17)
(18,17)-(18,73)
(18,34)-(18,73)
(18,38)-(18,39)
(18,42)-(18,43)
(18,47)-(18,49)
(18,55)-(18,61)
(18,60)-(18,61)
(18,67)-(18,68)
(18,72)-(18,73)
(19,5)-(21,52)
(19,17)-(19,21)
(19,20)-(19,21)
(20,5)-(21,52)
(20,16)-(20,28)
(20,16)-(20,57)
(20,31)-(20,42)
(20,31)-(20,57)
(20,40)-(20,42)
(20,46)-(20,54)
(20,46)-(20,57)
(21,5)-(21,52)
(22,3)-(22,13)
(22,15)-(22,18)
(22,15)-(22,33)
(22,20)-(22,27)
(22,20)-(22,33)
(22,28)-(22,30)
(22,31)-(22,33)
*)

(* type error slice
(15,5)-(21,52)
(15,11)-(18,73)
(15,13)-(18,73)
(16,7)-(18,73)
(16,7)-(18,73)
(16,7)-(18,73)
(16,13)-(16,14)
(18,17)-(18,73)
(18,34)-(18,73)
(18,55)-(18,61)
(18,55)-(18,61)
(18,60)-(18,61)
(20,16)-(20,28)
(20,16)-(20,57)
(20,31)-(20,57)
(21,19)-(21,33)
(21,19)-(21,45)
(21,34)-(21,35)
*)
