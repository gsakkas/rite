
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
    let args = List.combine (List.rev l1 List.rev l2) in
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
(16,6)-(18,72)
(16,12)-(16,13)
(17,14)-(17,16)
(18,16)-(18,72)
(18,33)-(18,72)
(18,37)-(18,38)
(18,41)-(18,42)
(18,46)-(18,48)
(18,54)-(18,60)
(18,59)-(18,60)
(18,66)-(18,67)
(18,71)-(18,72)
(19,4)-(21,51)
(19,15)-(19,21)
(19,19)-(19,20)
(20,4)-(21,51)
(20,15)-(20,27)
(20,15)-(20,53)
(20,28)-(20,53)
(20,38)-(20,40)
(20,41)-(20,49)
(21,4)-(21,51)
(22,2)-(22,12)
(22,13)-(22,34)
(22,14)-(22,17)
(22,18)-(22,33)
(22,19)-(22,26)
(22,27)-(22,29)
(22,30)-(22,32)
*)

(* type error slice
(15,4)-(21,51)
(15,10)-(18,72)
(15,12)-(18,72)
(16,6)-(18,72)
(16,6)-(18,72)
(16,6)-(18,72)
(16,12)-(16,13)
(18,16)-(18,72)
(18,33)-(18,72)
(18,54)-(18,60)
(18,54)-(18,60)
(18,59)-(18,60)
(20,28)-(20,53)
(20,29)-(20,37)
(21,18)-(21,32)
(21,18)-(21,44)
(21,33)-(21,34)
*)
