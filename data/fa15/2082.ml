
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 > length2
  then (l1, ((clone 0 (length1 - length2)) @ l2))
  else (((clone 0 (length2 - length1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let sum = (x1 + x2) + a1 in
      let carry = sum / 10 in (carry, ((sum mod 10) :: a2)) in
    let base = (0, []) in
    let args = List.combine ((List.rev 0) :: l1) ((List.rev 0) :: l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 > length2
  then (l1, ((clone 0 (length1 - length2)) @ l2))
  else (((clone 0 (length2 - length1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let sum = (x1 + x2) + a1 in
      let carry = sum / 10 in (carry, ((sum mod 10) :: a2)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(22,28)-(22,48)
(22,39)-(22,40)
(22,49)-(22,69)
(22,60)-(22,61)
*)

(* type error slice
(22,29)-(22,41)
(22,30)-(22,38)
(22,39)-(22,40)
(22,50)-(22,62)
(22,51)-(22,59)
(22,60)-(22,61)
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
(4,12)-(9,49)
(4,15)-(9,49)
(5,2)-(9,49)
(5,16)-(5,30)
(5,16)-(5,27)
(5,28)-(5,30)
(6,2)-(9,49)
(6,16)-(6,30)
(6,16)-(6,27)
(6,28)-(6,30)
(7,2)-(9,49)
(7,5)-(7,22)
(7,5)-(7,12)
(7,15)-(7,22)
(8,7)-(8,49)
(8,8)-(8,10)
(8,12)-(8,48)
(8,43)-(8,44)
(8,13)-(8,42)
(8,14)-(8,19)
(8,20)-(8,21)
(8,22)-(8,41)
(8,23)-(8,30)
(8,33)-(8,40)
(8,45)-(8,47)
(9,7)-(9,49)
(9,8)-(9,44)
(9,39)-(9,40)
(9,9)-(9,38)
(9,10)-(9,15)
(9,16)-(9,17)
(9,18)-(9,37)
(9,19)-(9,26)
(9,29)-(9,36)
(9,41)-(9,43)
(9,46)-(9,48)
(11,19)-(12,69)
(12,2)-(12,69)
(12,8)-(12,9)
(12,23)-(12,25)
(12,36)-(12,69)
(12,39)-(12,44)
(12,39)-(12,40)
(12,43)-(12,44)
(12,50)-(12,62)
(12,50)-(12,60)
(12,61)-(12,62)
(12,68)-(12,69)
(14,11)-(24,34)
(14,14)-(24,34)
(15,2)-(24,34)
(15,11)-(23,51)
(16,4)-(23,51)
(16,10)-(20,59)
(16,12)-(20,59)
(17,6)-(20,59)
(17,20)-(17,21)
(18,6)-(20,59)
(18,20)-(18,21)
(19,6)-(20,59)
(19,16)-(19,30)
(19,16)-(19,25)
(19,17)-(19,19)
(19,22)-(19,24)
(19,28)-(19,30)
(20,6)-(20,59)
(20,18)-(20,26)
(20,18)-(20,21)
(20,24)-(20,26)
(20,30)-(20,59)
(20,31)-(20,36)
(20,38)-(20,58)
(20,39)-(20,51)
(20,40)-(20,43)
(20,48)-(20,50)
(20,55)-(20,57)
(21,4)-(23,51)
(21,15)-(21,22)
(21,16)-(21,17)
(21,19)-(21,21)
(22,4)-(23,51)
(22,15)-(22,69)
(22,15)-(22,27)
(22,28)-(22,48)
(22,29)-(22,41)
(22,30)-(22,38)
(22,39)-(22,40)
(22,45)-(22,47)
(22,49)-(22,69)
(22,50)-(22,62)
(22,51)-(22,59)
(22,60)-(22,61)
(22,66)-(22,68)
(23,4)-(23,51)
(23,18)-(23,44)
(23,18)-(23,32)
(23,33)-(23,34)
(23,35)-(23,39)
(23,40)-(23,44)
(23,48)-(23,51)
(24,2)-(24,34)
(24,2)-(24,12)
(24,13)-(24,34)
(24,14)-(24,17)
(24,18)-(24,33)
(24,19)-(24,26)
(24,27)-(24,29)
(24,30)-(24,32)
*)
