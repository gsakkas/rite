
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (x,y) -> x in
      match x with
      | (d1,d2) ->
          let new_carry = ((a + d1) + d2) / 10 in
          let digit = ((a + d1) + d2) mod 10 in
          (match a with | (x,y) -> (new_carry, (digit :: y))) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (x,y) -> x in
      match x with
      | (d1,d2) ->
          let new_carry = ((carry + d1) + d2) / 10 in
          let digit = ((carry + d1) + d2) mod 10 in
          (match a with | (x,y) -> (new_carry, (digit :: y))) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,28)-(18,29)
(19,24)-(19,25)
*)

(* type error slice
(15,18)-(15,43)
(15,24)-(15,25)
(18,27)-(18,35)
(18,28)-(18,29)
(19,23)-(19,31)
(19,24)-(19,25)
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
(4,12)-(7,67)
(4,15)-(7,67)
(5,2)-(7,67)
(5,5)-(5,40)
(5,5)-(5,21)
(5,6)-(5,17)
(5,18)-(5,20)
(5,24)-(5,40)
(5,25)-(5,36)
(5,37)-(5,39)
(6,7)-(6,67)
(6,8)-(6,10)
(6,12)-(6,66)
(6,61)-(6,62)
(6,13)-(6,60)
(6,14)-(6,19)
(6,20)-(6,21)
(6,22)-(6,59)
(6,23)-(6,39)
(6,24)-(6,35)
(6,36)-(6,38)
(6,42)-(6,58)
(6,43)-(6,54)
(6,55)-(6,57)
(6,63)-(6,65)
(7,7)-(7,67)
(7,8)-(7,62)
(7,57)-(7,58)
(7,9)-(7,56)
(7,10)-(7,15)
(7,16)-(7,17)
(7,18)-(7,55)
(7,19)-(7,35)
(7,20)-(7,31)
(7,32)-(7,34)
(7,38)-(7,54)
(7,39)-(7,50)
(7,51)-(7,53)
(7,59)-(7,61)
(7,64)-(7,66)
(9,19)-(10,74)
(10,2)-(10,74)
(10,8)-(10,9)
(10,23)-(10,25)
(10,36)-(10,74)
(10,39)-(10,44)
(10,39)-(10,40)
(10,43)-(10,44)
(10,50)-(10,62)
(10,50)-(10,60)
(10,61)-(10,62)
(10,68)-(10,74)
(10,68)-(10,69)
(10,73)-(10,74)
(12,11)-(24,34)
(12,14)-(24,34)
(13,2)-(24,34)
(13,11)-(23,51)
(14,4)-(23,51)
(14,10)-(20,61)
(14,12)-(20,61)
(15,6)-(20,61)
(15,18)-(15,43)
(15,24)-(15,25)
(15,42)-(15,43)
(16,6)-(20,61)
(16,12)-(16,13)
(18,10)-(20,61)
(18,26)-(18,46)
(18,26)-(18,41)
(18,27)-(18,35)
(18,28)-(18,29)
(18,32)-(18,34)
(18,38)-(18,40)
(18,44)-(18,46)
(19,10)-(20,61)
(19,22)-(19,44)
(19,22)-(19,37)
(19,23)-(19,31)
(19,24)-(19,25)
(19,28)-(19,30)
(19,34)-(19,36)
(19,42)-(19,44)
(20,10)-(20,61)
(20,17)-(20,18)
(20,35)-(20,60)
(20,36)-(20,45)
(20,47)-(20,59)
(20,48)-(20,53)
(20,57)-(20,58)
(21,4)-(23,51)
(21,15)-(21,22)
(21,16)-(21,17)
(21,19)-(21,21)
(22,4)-(23,51)
(22,15)-(22,69)
(22,15)-(22,27)
(22,28)-(22,48)
(22,29)-(22,37)
(22,38)-(22,47)
(22,39)-(22,40)
(22,44)-(22,46)
(22,49)-(22,69)
(22,50)-(22,58)
(22,59)-(22,68)
(22,60)-(22,61)
(22,65)-(22,67)
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