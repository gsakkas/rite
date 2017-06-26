
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | ([],[]) ->
          let (carry,num) = a in
          (0, (if carry > 0 then carry :: num else num))
      | (l1,l2) ->
          let (carry,num) = a in
          let addit = ((List.hd l1) + (List.hd l2)) + carry in
          ((if addit > 10 then addit mod 10 else 0), ((addit / 10) :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,num) = a in
      let (l1',l2') = x in
      let addit = (l1' + l2') + carry in
      ((if addit > 10 then addit mod 10 else 0), ((addit / 10) :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,6)-(21,75)
(14,12)-(14,13)
(17,10)-(17,56)
(17,11)-(17,12)
(17,14)-(17,55)
(17,18)-(17,23)
(17,18)-(17,27)
(17,26)-(17,27)
(17,33)-(17,38)
(17,33)-(17,45)
(17,42)-(17,45)
(17,51)-(17,54)
(19,10)-(21,75)
(19,28)-(19,29)
(20,10)-(21,75)
(20,23)-(20,35)
(20,24)-(20,31)
(20,32)-(20,34)
(20,38)-(20,50)
(20,39)-(20,46)
(20,47)-(20,49)
(20,54)-(20,59)
*)

(* type error slice
(2,43)-(2,44)
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(4,3)-(6,54)
(4,12)-(6,52)
(4,15)-(6,52)
(5,2)-(6,52)
(6,2)-(6,52)
(6,4)-(6,18)
(6,5)-(6,10)
(6,11)-(6,12)
(6,26)-(6,51)
(6,27)-(6,45)
(6,28)-(6,33)
(6,46)-(6,47)
(12,2)-(25,34)
(12,11)-(24,51)
(13,4)-(24,51)
(13,10)-(21,75)
(13,12)-(21,75)
(14,6)-(21,75)
(14,12)-(14,13)
(20,38)-(20,50)
(20,39)-(20,46)
(20,47)-(20,49)
(23,4)-(24,51)
(23,15)-(23,27)
(23,15)-(23,33)
(23,31)-(23,33)
(24,18)-(24,32)
(24,18)-(24,44)
(24,33)-(24,34)
(24,40)-(24,44)
(25,13)-(25,34)
(25,14)-(25,17)
(25,18)-(25,33)
(25,19)-(25,26)
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
(4,12)-(6,52)
(4,15)-(6,52)
(5,2)-(6,52)
(5,13)-(5,48)
(5,13)-(5,29)
(5,14)-(5,25)
(5,26)-(5,28)
(5,32)-(5,48)
(5,33)-(5,44)
(5,45)-(5,47)
(6,2)-(6,52)
(6,3)-(6,24)
(6,19)-(6,20)
(6,4)-(6,18)
(6,5)-(6,10)
(6,11)-(6,12)
(6,13)-(6,17)
(6,21)-(6,23)
(6,26)-(6,51)
(6,46)-(6,47)
(6,27)-(6,45)
(6,28)-(6,33)
(6,34)-(6,35)
(6,36)-(6,44)
(6,39)-(6,43)
(6,48)-(6,50)
(8,19)-(9,68)
(9,2)-(9,68)
(9,8)-(9,9)
(9,23)-(9,24)
(9,35)-(9,68)
(9,38)-(9,43)
(9,38)-(9,39)
(9,42)-(9,43)
(9,49)-(9,61)
(9,49)-(9,59)
(9,60)-(9,61)
(9,67)-(9,68)
(11,11)-(25,34)
(11,14)-(25,34)
(12,2)-(25,34)
(12,11)-(24,51)
(13,4)-(24,51)
(13,10)-(21,75)
(13,12)-(21,75)
(14,6)-(21,75)
(14,12)-(14,13)
(16,10)-(17,56)
(16,28)-(16,29)
(17,10)-(17,56)
(17,11)-(17,12)
(17,14)-(17,55)
(17,18)-(17,27)
(17,18)-(17,23)
(17,26)-(17,27)
(17,33)-(17,45)
(17,33)-(17,38)
(17,42)-(17,45)
(17,51)-(17,54)
(19,10)-(21,75)
(19,28)-(19,29)
(20,10)-(21,75)
(20,22)-(20,59)
(20,22)-(20,51)
(20,23)-(20,35)
(20,24)-(20,31)
(20,32)-(20,34)
(20,38)-(20,50)
(20,39)-(20,46)
(20,47)-(20,49)
(20,54)-(20,59)
(21,10)-(21,75)
(21,11)-(21,51)
(21,15)-(21,25)
(21,15)-(21,20)
(21,23)-(21,25)
(21,31)-(21,43)
(21,31)-(21,36)
(21,41)-(21,43)
(21,49)-(21,50)
(21,53)-(21,74)
(21,54)-(21,66)
(21,55)-(21,60)
(21,63)-(21,65)
(21,70)-(21,73)
(22,4)-(24,51)
(22,15)-(22,22)
(22,16)-(22,17)
(22,19)-(22,21)
(23,4)-(24,51)
(23,15)-(23,33)
(23,15)-(23,27)
(23,28)-(23,30)
(23,31)-(23,33)
(24,4)-(24,51)
(24,18)-(24,44)
(24,18)-(24,32)
(24,33)-(24,34)
(24,35)-(24,39)
(24,40)-(24,44)
(24,48)-(24,51)
(25,2)-(25,34)
(25,2)-(25,12)
(25,13)-(25,34)
(25,14)-(25,17)
(25,18)-(25,33)
(25,19)-(25,26)
(25,27)-(25,29)
(25,30)-(25,32)
*)
