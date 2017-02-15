
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
      | [] -> if sum > 9 then [1; sum - 1] else [0; sum]
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
(19,14)-(19,56)
(19,17)-(19,20)
(19,17)-(19,24)
(19,23)-(19,24)
(19,30)-(19,42)
(19,31)-(19,32)
(19,34)-(19,37)
(19,34)-(19,41)
(19,40)-(19,41)
(19,48)-(19,56)
(19,49)-(19,50)
(21,13)-(21,22)
(21,14)-(21,17)
(22,15)-(22,16)
(22,21)-(22,30)
(22,22)-(22,25)
(23,15)-(23,24)
(23,22)-(23,23)
(23,28)-(23,30)
(24,4)-(26,51)
(24,15)-(24,17)
(25,4)-(26,51)
(26,4)-(26,51)
(26,18)-(26,32)
(26,35)-(26,39)
*)

(* type error slice
(15,4)-(26,51)
(15,10)-(23,30)
(18,6)-(23,30)
(18,6)-(23,30)
(18,12)-(18,13)
(26,4)-(26,51)
(26,18)-(26,32)
(26,18)-(26,44)
(26,33)-(26,34)
*)
