
let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then (((clone 0 (- n)) @ l1), l2) else (l1, ((clone 0 n) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if ((a1 + x1) + x2) >= 10
      then (1, ((((a1 + x1) + x2) - 10) :: a2))
      else (0, (((a1 + x1) + x2) :: a2)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0 then 0 else if i = 1 then l else mulByDigit (i - 1) (bigAdd l l);;


(* fix

let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then (((clone 0 (- n)) @ l1), l2) else (l1, ((clone 0 n) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if ((a1 + x1) + x2) >= 10
      then (1, ((((a1 + x1) + x2) - 10) :: a2))
      else (0, (((a1 + x1) + x2) :: a2)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0 then [0] else if i = 1 then l else mulByDigit (i - 1) (bigAdd l l);;

*)

(* changed spans
(26,16)-(26,17)
*)

(* type error slice
(5,3)-(7,76)
(5,12)-(7,74)
(7,17)-(7,39)
(7,34)-(7,35)
(7,36)-(7,38)
(12,3)-(23,36)
(12,11)-(23,34)
(23,18)-(23,33)
(23,19)-(23,26)
(23,27)-(23,29)
(26,2)-(26,75)
(26,16)-(26,17)
(26,23)-(26,75)
(26,37)-(26,38)
(26,63)-(26,75)
(26,64)-(26,70)
(26,71)-(26,72)
*)

(* all spans
(2,14)-(3,71)
(2,16)-(3,71)
(3,2)-(3,71)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(3,17)-(3,19)
(3,25)-(3,71)
(3,28)-(3,33)
(3,28)-(3,29)
(3,32)-(3,33)
(3,39)-(3,42)
(3,40)-(3,41)
(3,48)-(3,71)
(3,52)-(3,53)
(3,48)-(3,51)
(3,49)-(3,50)
(3,54)-(3,71)
(3,55)-(3,60)
(3,61)-(3,62)
(3,63)-(3,70)
(3,64)-(3,65)
(3,68)-(3,69)
(5,12)-(7,74)
(5,15)-(7,74)
(6,2)-(7,74)
(6,10)-(6,45)
(6,10)-(6,26)
(6,11)-(6,22)
(6,23)-(6,25)
(6,29)-(6,45)
(6,30)-(6,41)
(6,42)-(6,44)
(7,2)-(7,74)
(7,5)-(7,10)
(7,5)-(7,6)
(7,9)-(7,10)
(7,16)-(7,44)
(7,17)-(7,39)
(7,34)-(7,35)
(7,18)-(7,33)
(7,19)-(7,24)
(7,25)-(7,26)
(7,27)-(7,32)
(7,30)-(7,31)
(7,36)-(7,38)
(7,41)-(7,43)
(7,50)-(7,74)
(7,51)-(7,53)
(7,55)-(7,73)
(7,68)-(7,69)
(7,56)-(7,67)
(7,57)-(7,62)
(7,63)-(7,64)
(7,65)-(7,66)
(7,70)-(7,72)
(9,19)-(10,69)
(10,2)-(10,69)
(10,8)-(10,9)
(10,23)-(10,25)
(10,36)-(10,69)
(10,39)-(10,44)
(10,39)-(10,40)
(10,43)-(10,44)
(10,50)-(10,62)
(10,50)-(10,60)
(10,61)-(10,62)
(10,68)-(10,69)
(12,11)-(23,34)
(12,14)-(23,34)
(13,2)-(23,34)
(13,11)-(22,51)
(14,4)-(22,51)
(14,10)-(19,40)
(14,12)-(19,40)
(15,6)-(19,40)
(15,20)-(15,21)
(16,6)-(19,40)
(16,20)-(16,21)
(17,6)-(19,40)
(17,9)-(17,31)
(17,9)-(17,25)
(17,10)-(17,19)
(17,11)-(17,13)
(17,16)-(17,18)
(17,22)-(17,24)
(17,29)-(17,31)
(18,11)-(18,47)
(18,12)-(18,13)
(18,15)-(18,46)
(18,16)-(18,39)
(18,17)-(18,33)
(18,18)-(18,27)
(18,19)-(18,21)
(18,24)-(18,26)
(18,30)-(18,32)
(18,36)-(18,38)
(18,43)-(18,45)
(19,11)-(19,40)
(19,12)-(19,13)
(19,15)-(19,39)
(19,16)-(19,32)
(19,17)-(19,26)
(19,18)-(19,20)
(19,23)-(19,25)
(19,29)-(19,31)
(19,36)-(19,38)
(20,4)-(22,51)
(20,15)-(20,22)
(20,16)-(20,17)
(20,19)-(20,21)
(21,4)-(22,51)
(21,15)-(21,69)
(21,15)-(21,27)
(21,28)-(21,48)
(21,29)-(21,37)
(21,38)-(21,47)
(21,39)-(21,40)
(21,44)-(21,46)
(21,49)-(21,69)
(21,50)-(21,58)
(21,59)-(21,68)
(21,60)-(21,61)
(21,65)-(21,67)
(22,4)-(22,51)
(22,18)-(22,44)
(22,18)-(22,32)
(22,33)-(22,34)
(22,35)-(22,39)
(22,40)-(22,44)
(22,48)-(22,51)
(23,2)-(23,34)
(23,2)-(23,12)
(23,13)-(23,34)
(23,14)-(23,17)
(23,18)-(23,33)
(23,19)-(23,26)
(23,27)-(23,29)
(23,30)-(23,32)
(25,19)-(26,75)
(25,21)-(26,75)
(26,2)-(26,75)
(26,5)-(26,10)
(26,5)-(26,6)
(26,9)-(26,10)
(26,16)-(26,17)
(26,23)-(26,75)
(26,26)-(26,31)
(26,26)-(26,27)
(26,30)-(26,31)
(26,37)-(26,38)
(26,44)-(26,75)
(26,44)-(26,54)
(26,55)-(26,62)
(26,56)-(26,57)
(26,60)-(26,61)
(26,63)-(26,75)
(26,64)-(26,70)
(26,71)-(26,72)
(26,73)-(26,74)
*)
