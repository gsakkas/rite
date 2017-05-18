
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      if let (y,z) = x in (y + z) > 9
      then (1, (let (y,z) = x in [(y + z) / 10] @ a))
      else (0, ((let (y,z) = x in [y + z] @ a))) in
    let base = [] in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      if let (carry,ans) = a in let (y,z) = x in ((y + z) + carry) > 9
      then
        let (carry,ans) = a in
        (1, (let (y,z) = x in [((y + z) + carry) mod 10] @ ans))
      else
        (let (carry,ans) = a in
         (0, (let (y,z) = x in [(y + z) + carry] @ ans))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,9)-(15,37)
(15,27)-(15,28)
(15,36)-(15,37)
(16,11)-(16,53)
(16,34)-(16,46)
(16,35)-(16,36)
(16,44)-(16,46)
(16,50)-(16,51)
(17,35)-(17,36)
(17,44)-(17,45)
(18,4)-(20,51)
(18,15)-(18,17)
*)

(* type error slice
(14,4)-(20,51)
(14,10)-(17,48)
(14,12)-(17,48)
(15,6)-(17,48)
(16,11)-(16,53)
(16,33)-(16,51)
(16,48)-(16,49)
(16,50)-(16,51)
(20,18)-(20,32)
(20,18)-(20,44)
(20,33)-(20,34)
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
(6,8)-(6,62)
(6,57)-(6,58)
(6,9)-(6,56)
(6,10)-(6,15)
(6,16)-(6,17)
(6,18)-(6,55)
(6,19)-(6,35)
(6,20)-(6,31)
(6,32)-(6,34)
(6,38)-(6,54)
(6,39)-(6,50)
(6,51)-(6,53)
(6,59)-(6,61)
(6,64)-(6,66)
(7,7)-(7,67)
(7,8)-(7,10)
(7,12)-(7,66)
(7,61)-(7,62)
(7,13)-(7,60)
(7,14)-(7,19)
(7,20)-(7,21)
(7,22)-(7,59)
(7,23)-(7,39)
(7,24)-(7,35)
(7,36)-(7,38)
(7,42)-(7,58)
(7,43)-(7,54)
(7,55)-(7,57)
(7,63)-(7,65)
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
(12,11)-(21,34)
(12,14)-(21,34)
(13,2)-(21,34)
(13,11)-(20,51)
(14,4)-(20,51)
(14,10)-(17,48)
(14,12)-(17,48)
(15,6)-(17,48)
(15,9)-(15,37)
(15,21)-(15,22)
(15,26)-(15,37)
(15,26)-(15,33)
(15,27)-(15,28)
(15,31)-(15,32)
(15,36)-(15,37)
(16,11)-(16,53)
(16,12)-(16,13)
(16,15)-(16,52)
(16,28)-(16,29)
(16,33)-(16,51)
(16,48)-(16,49)
(16,33)-(16,47)
(16,34)-(16,46)
(16,34)-(16,41)
(16,35)-(16,36)
(16,39)-(16,40)
(16,44)-(16,46)
(16,50)-(16,51)
(17,11)-(17,48)
(17,12)-(17,13)
(17,15)-(17,47)
(17,29)-(17,30)
(17,34)-(17,45)
(17,42)-(17,43)
(17,34)-(17,41)
(17,35)-(17,40)
(17,35)-(17,36)
(17,39)-(17,40)
(17,44)-(17,45)
(18,4)-(20,51)
(18,15)-(18,17)
(19,4)-(20,51)
(19,15)-(19,33)
(19,15)-(19,27)
(19,28)-(19,30)
(19,31)-(19,33)
(20,4)-(20,51)
(20,18)-(20,44)
(20,18)-(20,32)
(20,33)-(20,34)
(20,35)-(20,39)
(20,40)-(20,44)
(20,48)-(20,51)
(21,2)-(21,34)
(21,2)-(21,12)
(21,13)-(21,34)
(21,14)-(21,17)
(21,18)-(21,33)
(21,19)-(21,26)
(21,27)-(21,29)
(21,30)-(21,32)
*)
