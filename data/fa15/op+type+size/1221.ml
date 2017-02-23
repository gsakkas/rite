
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (0,[]) -> if x < 10 then (0, x) else (1, (x mod 10))
      | (0,l) -> if x < 10 then (0, (x :: l)) else (1, ((x mod 10) :: l))
      | (1,l) ->
          if (x + 1) < 10
          then (0, ((x + 1) :: l))
          else (1, ((x + (1 mod 10)) :: l)) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      List.map combine (List.rev (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (0,[]) -> if x < 10 then (0, [x]) else (1, [x mod 10])
      | (0,l) -> if x < 10 then (0, (x :: l)) else (1, ((x mod 10) :: l))
      | (1,l) ->
          if (x + 1) < 10
          then (0, ((x + 1) :: l))
          else (1, ((x + (1 mod 10)) :: l)) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      List.map combine (List.rev (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,37)-(20,38)
(20,49)-(20,59)
*)

(* type error slice
(18,4)-(30,51)
(18,10)-(25,43)
(18,12)-(25,43)
(19,6)-(25,43)
(19,6)-(25,43)
(19,6)-(25,43)
(19,6)-(25,43)
(19,12)-(19,13)
(20,18)-(20,60)
(20,21)-(20,22)
(20,21)-(20,27)
(20,21)-(20,27)
(20,25)-(20,27)
(20,33)-(20,39)
(20,37)-(20,38)
(21,17)-(21,73)
(21,32)-(21,45)
(21,36)-(21,44)
(21,36)-(21,44)
(21,36)-(21,44)
(21,37)-(21,38)
(21,42)-(21,43)
(23,10)-(25,43)
(24,15)-(24,34)
(24,19)-(24,33)
(30,18)-(30,32)
(30,18)-(30,44)
(30,33)-(30,34)
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
(4,12)-(11,17)
(4,15)-(11,17)
(5,2)-(11,17)
(5,19)-(5,54)
(5,19)-(5,35)
(5,20)-(5,31)
(5,32)-(5,34)
(5,38)-(5,54)
(5,39)-(5,50)
(5,51)-(5,53)
(6,2)-(11,17)
(6,5)-(6,19)
(6,5)-(6,15)
(6,18)-(6,19)
(7,7)-(7,40)
(7,8)-(7,10)
(7,12)-(7,39)
(7,34)-(7,35)
(7,13)-(7,33)
(7,14)-(7,19)
(7,20)-(7,21)
(7,22)-(7,32)
(7,36)-(7,38)
(9,4)-(11,17)
(9,7)-(9,21)
(9,7)-(9,17)
(9,20)-(9,21)
(10,9)-(10,51)
(10,10)-(10,46)
(10,41)-(10,42)
(10,11)-(10,40)
(10,12)-(10,17)
(10,18)-(10,19)
(10,20)-(10,39)
(10,21)-(10,25)
(10,28)-(10,38)
(10,43)-(10,45)
(10,48)-(10,50)
(11,9)-(11,17)
(11,10)-(11,12)
(11,14)-(11,16)
(13,19)-(14,73)
(14,2)-(14,73)
(14,8)-(14,9)
(14,23)-(14,24)
(14,35)-(14,73)
(14,38)-(14,43)
(14,38)-(14,39)
(14,42)-(14,43)
(14,49)-(14,61)
(14,49)-(14,59)
(14,60)-(14,61)
(14,67)-(14,73)
(14,67)-(14,68)
(14,72)-(14,73)
(16,11)-(31,34)
(16,14)-(31,34)
(17,2)-(31,34)
(17,11)-(30,51)
(18,4)-(30,51)
(18,10)-(25,43)
(18,12)-(25,43)
(19,6)-(25,43)
(19,12)-(19,13)
(20,18)-(20,60)
(20,21)-(20,27)
(20,21)-(20,22)
(20,25)-(20,27)
(20,33)-(20,39)
(20,34)-(20,35)
(20,37)-(20,38)
(20,45)-(20,60)
(20,46)-(20,47)
(20,49)-(20,59)
(20,50)-(20,51)
(20,56)-(20,58)
(21,17)-(21,73)
(21,20)-(21,26)
(21,20)-(21,21)
(21,24)-(21,26)
(21,32)-(21,45)
(21,33)-(21,34)
(21,36)-(21,44)
(21,37)-(21,38)
(21,42)-(21,43)
(21,51)-(21,73)
(21,52)-(21,53)
(21,55)-(21,72)
(21,56)-(21,66)
(21,57)-(21,58)
(21,63)-(21,65)
(21,70)-(21,71)
(23,10)-(25,43)
(23,13)-(23,25)
(23,13)-(23,20)
(23,14)-(23,15)
(23,18)-(23,19)
(23,23)-(23,25)
(24,15)-(24,34)
(24,16)-(24,17)
(24,19)-(24,33)
(24,20)-(24,27)
(24,21)-(24,22)
(24,25)-(24,26)
(24,31)-(24,32)
(25,15)-(25,43)
(25,16)-(25,17)
(25,19)-(25,42)
(25,20)-(25,36)
(25,21)-(25,22)
(25,25)-(25,35)
(25,26)-(25,27)
(25,32)-(25,34)
(25,40)-(25,41)
(26,4)-(30,51)
(26,15)-(26,22)
(26,16)-(26,17)
(26,19)-(26,21)
(27,4)-(30,51)
(28,6)-(29,54)
(28,19)-(28,31)
(28,26)-(28,31)
(28,26)-(28,27)
(28,30)-(28,31)
(29,6)-(29,54)
(29,6)-(29,14)
(29,15)-(29,22)
(29,23)-(29,54)
(29,24)-(29,32)
(29,33)-(29,53)
(29,34)-(29,46)
(29,47)-(29,49)
(29,50)-(29,52)
(30,4)-(30,51)
(30,18)-(30,44)
(30,18)-(30,32)
(30,33)-(30,34)
(30,35)-(30,39)
(30,40)-(30,44)
(30,48)-(30,51)
(31,2)-(31,34)
(31,2)-(31,12)
(31,13)-(31,34)
(31,14)-(31,17)
(31,18)-(31,33)
(31,19)-(31,26)
(31,27)-(31,29)
(31,30)-(31,32)
*)
