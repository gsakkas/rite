
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then (l1, (List.append (clone 0 (first - sec)) l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + x in
    let base = (0, 0) in
    let args =
      let combo = List.combine (List.rev l1) (List.rev l2) in
      match combo with
      | (i,j)::t -> if (i + j) > 9 then (1, ((i + j) - 10)) else (0, (i + j))
      | [] -> (0, 0) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then (l1, (List.append (clone 0 (first - sec)) l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      let (s,t) = a in ((((i + j) + s) / 10), ((((i + j) + s) mod 10) :: t)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,16)-(19,17)
(19,16)-(19,21)
(20,4)-(26,51)
(20,15)-(20,21)
(20,16)-(20,17)
(20,19)-(20,20)
(21,4)-(26,51)
(22,6)-(25,20)
(22,18)-(22,30)
(22,18)-(22,58)
(22,31)-(22,44)
(22,32)-(22,40)
(22,41)-(22,43)
(22,45)-(22,58)
(22,46)-(22,54)
(22,55)-(22,57)
(23,6)-(25,20)
(23,12)-(23,17)
(24,20)-(24,77)
(24,23)-(24,34)
(24,24)-(24,25)
(24,28)-(24,29)
(24,33)-(24,34)
(24,40)-(24,59)
(24,41)-(24,42)
(24,44)-(24,58)
(24,55)-(24,57)
(24,65)-(24,77)
(24,66)-(24,67)
(24,69)-(24,76)
(24,70)-(24,71)
(25,14)-(25,20)
(25,18)-(25,19)
(26,4)-(26,51)
(26,18)-(26,44)
(27,14)-(27,17)
*)

(* type error slice
(19,4)-(26,51)
(19,10)-(19,21)
(19,16)-(19,17)
(19,16)-(19,21)
(20,4)-(26,51)
(20,15)-(20,21)
(26,18)-(26,32)
(26,18)-(26,44)
(26,33)-(26,34)
(26,35)-(26,39)
*)

(* all spans
(2,14)-(2,65)
(2,16)-(2,65)
(2,20)-(2,65)
(2,23)-(2,29)
(2,23)-(2,24)
(2,28)-(2,29)
(2,35)-(2,37)
(2,43)-(2,65)
(2,43)-(2,44)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(2,57)-(2,64)
(2,58)-(2,59)
(2,62)-(2,63)
(4,12)-(12,17)
(4,15)-(12,17)
(5,2)-(12,17)
(5,14)-(5,28)
(5,14)-(5,25)
(5,26)-(5,28)
(6,2)-(12,17)
(6,12)-(6,26)
(6,12)-(6,23)
(6,24)-(6,26)
(7,2)-(12,17)
(7,5)-(7,16)
(7,5)-(7,10)
(7,13)-(7,16)
(8,7)-(8,53)
(8,8)-(8,48)
(8,9)-(8,20)
(8,21)-(8,44)
(8,22)-(8,27)
(8,28)-(8,29)
(8,30)-(8,43)
(8,31)-(8,34)
(8,37)-(8,42)
(8,45)-(8,47)
(8,50)-(8,52)
(10,4)-(12,17)
(10,7)-(10,18)
(10,7)-(10,12)
(10,15)-(10,18)
(11,9)-(11,55)
(11,10)-(11,12)
(11,14)-(11,54)
(11,15)-(11,26)
(11,27)-(11,50)
(11,28)-(11,33)
(11,34)-(11,35)
(11,36)-(11,49)
(11,37)-(11,42)
(11,45)-(11,48)
(11,51)-(11,53)
(12,9)-(12,17)
(12,10)-(12,12)
(12,14)-(12,16)
(14,19)-(15,69)
(15,2)-(15,69)
(15,8)-(15,9)
(15,23)-(15,25)
(15,36)-(15,69)
(15,39)-(15,44)
(15,39)-(15,40)
(15,43)-(15,44)
(15,50)-(15,62)
(15,50)-(15,60)
(15,61)-(15,62)
(15,68)-(15,69)
(17,11)-(27,34)
(17,14)-(27,34)
(18,2)-(27,34)
(18,11)-(26,51)
(19,4)-(26,51)
(19,10)-(19,21)
(19,12)-(19,21)
(19,16)-(19,21)
(19,16)-(19,17)
(19,20)-(19,21)
(20,4)-(26,51)
(20,15)-(20,21)
(20,16)-(20,17)
(20,19)-(20,20)
(21,4)-(26,51)
(22,6)-(25,20)
(22,18)-(22,58)
(22,18)-(22,30)
(22,31)-(22,44)
(22,32)-(22,40)
(22,41)-(22,43)
(22,45)-(22,58)
(22,46)-(22,54)
(22,55)-(22,57)
(23,6)-(25,20)
(23,12)-(23,17)
(24,20)-(24,77)
(24,23)-(24,34)
(24,23)-(24,30)
(24,24)-(24,25)
(24,28)-(24,29)
(24,33)-(24,34)
(24,40)-(24,59)
(24,41)-(24,42)
(24,44)-(24,58)
(24,45)-(24,52)
(24,46)-(24,47)
(24,50)-(24,51)
(24,55)-(24,57)
(24,65)-(24,77)
(24,66)-(24,67)
(24,69)-(24,76)
(24,70)-(24,71)
(24,74)-(24,75)
(25,14)-(25,20)
(25,15)-(25,16)
(25,18)-(25,19)
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
