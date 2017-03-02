
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
(19,14)-(19,57)
(19,17)-(19,20)
(19,17)-(19,24)
(19,23)-(19,24)
(19,31)-(19,45)
(19,32)-(19,33)
(19,35)-(19,44)
(19,42)-(19,43)
(19,52)-(19,57)
(19,53)-(19,56)
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
*)

(* type error slice
(15,4)-(26,51)
(15,10)-(23,30)
(15,12)-(23,30)
(16,6)-(23,30)
(17,6)-(23,30)
(17,6)-(23,30)
(17,16)-(17,23)
(18,6)-(23,30)
(18,6)-(23,30)
(18,6)-(23,30)
(18,6)-(23,30)
(18,12)-(18,13)
(19,14)-(19,57)
(19,14)-(19,57)
(19,30)-(19,46)
(19,30)-(19,46)
(19,31)-(19,45)
(19,52)-(19,57)
(19,52)-(19,57)
(19,53)-(19,56)
(21,10)-(23,30)
(21,13)-(21,22)
(21,20)-(21,21)
(22,15)-(22,16)
(22,15)-(22,42)
(22,15)-(22,42)
(26,18)-(26,32)
(26,18)-(26,44)
(26,33)-(26,34)
*)

(* all spans
(2,14)-(2,64)
(2,16)-(2,64)
(2,20)-(2,64)
(2,23)-(2,28)
(2,23)-(2,24)
(2,27)-(2,28)
(2,34)-(2,36)
(2,42)-(2,64)
(2,42)-(2,43)
(2,47)-(2,64)
(2,48)-(2,53)
(2,54)-(2,55)
(2,56)-(2,63)
(2,57)-(2,58)
(2,61)-(2,62)
(4,12)-(8,74)
(4,15)-(8,74)
(5,2)-(8,74)
(5,13)-(5,48)
(5,13)-(5,29)
(5,14)-(5,25)
(5,26)-(5,28)
(5,32)-(5,48)
(5,33)-(5,44)
(5,45)-(5,47)
(6,2)-(8,74)
(6,5)-(6,13)
(6,5)-(6,9)
(6,12)-(6,13)
(7,7)-(7,34)
(7,8)-(7,10)
(7,12)-(7,33)
(7,28)-(7,29)
(7,13)-(7,27)
(7,14)-(7,19)
(7,20)-(7,21)
(7,22)-(7,26)
(7,30)-(7,32)
(8,7)-(8,74)
(8,10)-(8,18)
(8,10)-(8,14)
(8,17)-(8,18)
(8,24)-(8,60)
(8,25)-(8,55)
(8,50)-(8,51)
(8,26)-(8,49)
(8,27)-(8,32)
(8,33)-(8,34)
(8,35)-(8,48)
(8,36)-(8,40)
(8,43)-(8,47)
(8,52)-(8,54)
(8,57)-(8,59)
(8,66)-(8,74)
(8,67)-(8,69)
(8,71)-(8,73)
(10,19)-(11,71)
(11,2)-(11,71)
(11,8)-(11,9)
(11,23)-(11,25)
(11,37)-(11,71)
(11,40)-(11,45)
(11,40)-(11,41)
(11,44)-(11,45)
(11,51)-(11,64)
(11,51)-(11,61)
(11,62)-(11,64)
(11,70)-(11,71)
(13,11)-(27,34)
(13,14)-(27,34)
(14,2)-(27,34)
(14,11)-(26,51)
(15,4)-(26,51)
(15,10)-(23,30)
(15,12)-(23,30)
(16,6)-(23,30)
(16,20)-(16,21)
(17,6)-(23,30)
(17,16)-(17,23)
(17,16)-(17,18)
(17,21)-(17,23)
(18,6)-(23,30)
(18,12)-(18,13)
(19,14)-(19,57)
(19,17)-(19,24)
(19,17)-(19,20)
(19,23)-(19,24)
(19,30)-(19,46)
(19,31)-(19,45)
(19,32)-(19,33)
(19,35)-(19,44)
(19,36)-(19,39)
(19,42)-(19,43)
(19,52)-(19,57)
(19,53)-(19,56)
(21,10)-(23,30)
(21,13)-(21,26)
(21,13)-(21,22)
(21,14)-(21,17)
(21,20)-(21,21)
(21,25)-(21,26)
(22,15)-(22,42)
(22,15)-(22,16)
(22,20)-(22,42)
(22,20)-(22,36)
(22,21)-(22,30)
(22,22)-(22,25)
(22,28)-(22,29)
(22,33)-(22,35)
(22,40)-(22,42)
(23,15)-(23,30)
(23,15)-(23,24)
(23,16)-(23,19)
(23,22)-(23,23)
(23,28)-(23,30)
(24,4)-(26,51)
(24,15)-(24,17)
(25,4)-(26,51)
(25,15)-(25,55)
(25,15)-(25,27)
(25,28)-(25,41)
(25,29)-(25,37)
(25,38)-(25,40)
(25,42)-(25,55)
(25,43)-(25,51)
(25,52)-(25,54)
(26,4)-(26,51)
(26,18)-(26,44)
(26,18)-(26,32)
(26,33)-(26,34)
(26,35)-(26,39)
(26,40)-(26,44)
(26,48)-(26,51)
(27,2)-(27,34)
(27,2)-(27,12)
(27,13)-(27,34)
(27,14)-(27,17)
(27,18)-(27,33)
(27,19)-(27,26)
(27,27)-(27,29)
(27,30)-(27,32)
*)
