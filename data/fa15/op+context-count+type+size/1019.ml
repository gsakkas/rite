
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff > 0
  then (l1, ((clone 0 diff) @ l2))
  else if diff < 0 then (((clone 0 (diff * (-1))) @ l1), l2) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::l' -> if h = 0 then removeZero l' else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (n1,n2) = x in
      let sum = n1 + n2 in
      match a with
      | [] -> if sum > 9 then [(1, (sum - 1))] else [sum]
      | c::x' ->
          if (sum + c) > 9
          then 1 :: ((sum + c) - 10) :: x'
          else (sum + c) :: x' in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff > 0
  then (l1, ((clone 0 diff) @ l2))
  else if diff < 0 then (((clone 0 (diff * (-1))) @ l1), l2) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::l' -> if h = 0 then removeZero l' else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (n1,n2) = x in
      let sum = n1 + n2 in
      match a with
      | [] -> [sum]
      | c::x' -> if c > 9 then (sum + 1) :: (c - 10) :: x' else sum :: a in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,15)-(19,58)
(19,18)-(19,21)
(19,18)-(19,25)
(19,24)-(19,25)
(19,33)-(19,34)
(19,33)-(19,44)
(19,37)-(19,44)
(19,43)-(19,44)
(19,53)-(19,58)
(19,54)-(19,57)
(21,15)-(21,18)
(21,15)-(21,22)
(22,16)-(22,17)
(22,23)-(22,26)
(22,23)-(22,30)
(23,17)-(23,24)
(23,23)-(23,24)
(23,29)-(23,31)
(24,5)-(26,52)
(24,16)-(24,18)
(25,5)-(26,52)
(26,5)-(26,52)
(26,49)-(26,52)
*)

(* type error slice
(15,5)-(26,52)
(15,11)-(23,31)
(15,13)-(23,31)
(16,7)-(23,31)
(17,7)-(23,31)
(17,7)-(23,31)
(17,17)-(17,24)
(18,7)-(23,31)
(18,7)-(23,31)
(18,7)-(23,31)
(18,7)-(23,31)
(18,13)-(18,14)
(19,15)-(19,58)
(19,15)-(19,58)
(19,31)-(19,47)
(19,31)-(19,47)
(19,33)-(19,44)
(19,53)-(19,58)
(19,53)-(19,58)
(19,54)-(19,57)
(21,11)-(23,31)
(21,15)-(21,22)
(21,21)-(21,22)
(22,16)-(22,17)
(22,16)-(22,43)
(22,16)-(22,43)
(26,19)-(26,33)
(26,19)-(26,45)
(26,34)-(26,35)
*)
