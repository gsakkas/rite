
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
      | (o,l) ->
          let sum = x + o in
          if sum < 10 then (0, (sum :: l)) else (1, ((sum - 10) :: l)) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      (List.map combine (List.rev (List.combine l1 l2))) @ [0] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i >= 0 then bigAdd l l else mulByDigit (i - (1 l));;


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
      | (o,l) ->
          let sum = x + o in
          if sum < 10 then (0, (sum :: l)) else (1, ((sum - 10) :: l)) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      (List.map combine (List.rev (List.combine l1 l2))) @ [0] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i >= 0 then List.rev (mulByDigit (i - 1) l) else bigAdd l l;;

*)

(* changed spans
(31,17)-(31,23)
(31,17)-(31,27)
(31,24)-(31,25)
(31,26)-(31,27)
(31,33)-(31,43)
(31,49)-(31,54)
*)

(* type error slice
(30,3)-(31,57)
(30,19)-(31,55)
(30,21)-(31,55)
(31,2)-(31,55)
(31,33)-(31,43)
(31,33)-(31,55)
(31,49)-(31,54)
(31,50)-(31,51)
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
(16,11)-(28,34)
(16,14)-(28,34)
(17,2)-(28,34)
(17,11)-(27,51)
(18,4)-(27,51)
(18,10)-(22,70)
(18,12)-(22,70)
(19,6)-(22,70)
(19,12)-(19,13)
(21,10)-(22,70)
(21,20)-(21,25)
(21,20)-(21,21)
(21,24)-(21,25)
(22,10)-(22,70)
(22,13)-(22,21)
(22,13)-(22,16)
(22,19)-(22,21)
(22,27)-(22,42)
(22,28)-(22,29)
(22,31)-(22,41)
(22,32)-(22,35)
(22,39)-(22,40)
(22,48)-(22,70)
(22,49)-(22,50)
(22,52)-(22,69)
(22,53)-(22,63)
(22,54)-(22,57)
(22,60)-(22,62)
(22,67)-(22,68)
(23,4)-(27,51)
(23,15)-(23,22)
(23,16)-(23,17)
(23,19)-(23,21)
(24,4)-(27,51)
(25,6)-(26,62)
(25,19)-(25,31)
(25,26)-(25,31)
(25,26)-(25,27)
(25,30)-(25,31)
(26,6)-(26,62)
(26,57)-(26,58)
(26,6)-(26,56)
(26,7)-(26,15)
(26,16)-(26,23)
(26,24)-(26,55)
(26,25)-(26,33)
(26,34)-(26,54)
(26,35)-(26,47)
(26,48)-(26,50)
(26,51)-(26,53)
(26,59)-(26,62)
(26,60)-(26,61)
(27,4)-(27,51)
(27,18)-(27,44)
(27,18)-(27,32)
(27,33)-(27,34)
(27,35)-(27,39)
(27,40)-(27,44)
(27,48)-(27,51)
(28,2)-(28,34)
(28,2)-(28,12)
(28,13)-(28,34)
(28,14)-(28,17)
(28,18)-(28,33)
(28,19)-(28,26)
(28,27)-(28,29)
(28,30)-(28,32)
(30,19)-(31,55)
(30,21)-(31,55)
(31,2)-(31,55)
(31,5)-(31,11)
(31,5)-(31,6)
(31,10)-(31,11)
(31,17)-(31,27)
(31,17)-(31,23)
(31,24)-(31,25)
(31,26)-(31,27)
(31,33)-(31,55)
(31,33)-(31,43)
(31,44)-(31,55)
(31,45)-(31,46)
(31,49)-(31,54)
(31,50)-(31,51)
(31,52)-(31,53)
*)
