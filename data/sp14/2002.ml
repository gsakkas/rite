
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let shorter = if len1 < len2 then l1 else l2 in
  let zeros = if shorter = l1 then len2 - len1 else len1 - len2 in
  if shorter = l1
  then ((List.append (clone 0 zeros) shorter), l2)
  else (l1, (List.append (clone 0 zeros) shorter));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (m,n) -> (m + n) :: a in
    let base = [] in
    let args =
      match List.rev (List.combine l1 l2) with | [] -> (0, 0) | h::t -> h in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let shorter = if len1 < len2 then l1 else l2 in
  let zeros = if shorter = l1 then len2 - len1 else len1 - len2 in
  if shorter = l1
  then ((List.append (clone 0 zeros) shorter), l2)
  else (l1, (List.append (clone 0 zeros) shorter));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let prevN (n1,n2) = n1 in
      let prev = prevN a in
      let sumlist (p1,p2) = p2 in
      let sum = sumlist a in
      let add (m,n) = m + n in
      let digit = (add x) + prev in
      if digit > 10 then (1, ((digit - 10) :: sum)) else (0, (digit :: sum)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,16)-(18,52)
(18,22)-(18,23)
(18,40)-(18,47)
(18,40)-(18,52)
(18,51)-(18,52)
(19,4)-(22,51)
(19,15)-(19,17)
(21,6)-(21,73)
(21,55)-(21,61)
(21,56)-(21,57)
(21,59)-(21,60)
(21,72)-(21,73)
*)

(* type error slice
(20,4)-(22,51)
(21,6)-(21,73)
(21,55)-(21,61)
(22,18)-(22,32)
(22,18)-(22,44)
(22,40)-(22,44)
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
(4,12)-(11,50)
(4,15)-(11,50)
(5,2)-(11,50)
(5,13)-(5,27)
(5,13)-(5,24)
(5,25)-(5,27)
(6,2)-(11,50)
(6,13)-(6,27)
(6,13)-(6,24)
(6,25)-(6,27)
(7,2)-(11,50)
(7,16)-(7,46)
(7,19)-(7,30)
(7,19)-(7,23)
(7,26)-(7,30)
(7,36)-(7,38)
(7,44)-(7,46)
(8,2)-(11,50)
(8,14)-(8,63)
(8,17)-(8,29)
(8,17)-(8,24)
(8,27)-(8,29)
(8,35)-(8,46)
(8,35)-(8,39)
(8,42)-(8,46)
(8,52)-(8,63)
(8,52)-(8,56)
(8,59)-(8,63)
(9,2)-(11,50)
(9,5)-(9,17)
(9,5)-(9,12)
(9,15)-(9,17)
(10,7)-(10,50)
(10,8)-(10,45)
(10,9)-(10,20)
(10,21)-(10,36)
(10,22)-(10,27)
(10,28)-(10,29)
(10,30)-(10,35)
(10,37)-(10,44)
(10,47)-(10,49)
(11,7)-(11,50)
(11,8)-(11,10)
(11,12)-(11,49)
(11,13)-(11,24)
(11,25)-(11,40)
(11,26)-(11,31)
(11,32)-(11,33)
(11,34)-(11,39)
(11,41)-(11,48)
(13,19)-(14,69)
(14,2)-(14,69)
(14,8)-(14,9)
(14,23)-(14,25)
(14,36)-(14,69)
(14,39)-(14,44)
(14,39)-(14,40)
(14,43)-(14,44)
(14,50)-(14,62)
(14,50)-(14,60)
(14,61)-(14,62)
(14,68)-(14,69)
(16,11)-(23,34)
(16,14)-(23,34)
(17,2)-(23,34)
(17,11)-(22,51)
(18,4)-(22,51)
(18,10)-(18,52)
(18,12)-(18,52)
(18,16)-(18,52)
(18,22)-(18,23)
(18,40)-(18,52)
(18,40)-(18,47)
(18,41)-(18,42)
(18,45)-(18,46)
(18,51)-(18,52)
(19,4)-(22,51)
(19,15)-(19,17)
(20,4)-(22,51)
(21,6)-(21,73)
(21,12)-(21,41)
(21,12)-(21,20)
(21,21)-(21,41)
(21,22)-(21,34)
(21,35)-(21,37)
(21,38)-(21,40)
(21,55)-(21,61)
(21,56)-(21,57)
(21,59)-(21,60)
(21,72)-(21,73)
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
*)
