
let rec clone x n = if n <= 0 then [] else List.append [x] (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then (l1, (List.append (clone 0 (x - y)) l2))
  else if x < y then ((List.append (clone 0 (y - x)) l1), l2) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | [] -> a
      | (r,s) -> (((List.hd r) + (List.hd s)) mod 10) :: a in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else List.append [x] (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then (l1, (List.append (clone 0 (x - y)) l2))
  else if x < y then ((List.append (clone 0 (y - x)) l1), l2) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (lh1,lh2) = x in
      let (carry,res) = a in
      let num = (lh1 + lh2) + carry in ((num / 10), ((num mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,6)-(19,58)
(18,14)-(18,15)
(19,17)-(19,58)
(19,18)-(19,45)
(19,19)-(19,30)
(19,20)-(19,27)
(19,28)-(19,29)
(19,33)-(19,44)
(19,34)-(19,41)
(19,42)-(19,43)
(19,57)-(19,58)
(20,15)-(20,17)
*)

(* type error slice
(17,6)-(19,58)
(17,6)-(19,58)
(17,6)-(19,58)
*)

(* all spans
(2,14)-(2,76)
(2,16)-(2,76)
(2,20)-(2,76)
(2,23)-(2,29)
(2,23)-(2,24)
(2,28)-(2,29)
(2,35)-(2,37)
(2,43)-(2,76)
(2,43)-(2,54)
(2,55)-(2,58)
(2,56)-(2,57)
(2,59)-(2,76)
(2,60)-(2,65)
(2,66)-(2,67)
(2,68)-(2,75)
(2,69)-(2,70)
(2,73)-(2,74)
(4,12)-(9,75)
(4,15)-(9,75)
(5,2)-(9,75)
(5,10)-(5,24)
(5,10)-(5,21)
(5,22)-(5,24)
(6,2)-(9,75)
(6,10)-(6,24)
(6,10)-(6,21)
(6,22)-(6,24)
(7,2)-(9,75)
(7,5)-(7,10)
(7,5)-(7,6)
(7,9)-(7,10)
(8,7)-(8,47)
(8,8)-(8,10)
(8,12)-(8,46)
(8,13)-(8,24)
(8,25)-(8,42)
(8,26)-(8,31)
(8,32)-(8,33)
(8,34)-(8,41)
(8,35)-(8,36)
(8,39)-(8,40)
(8,43)-(8,45)
(9,7)-(9,75)
(9,10)-(9,15)
(9,10)-(9,11)
(9,14)-(9,15)
(9,21)-(9,61)
(9,22)-(9,56)
(9,23)-(9,34)
(9,35)-(9,52)
(9,36)-(9,41)
(9,42)-(9,43)
(9,44)-(9,51)
(9,45)-(9,46)
(9,49)-(9,50)
(9,53)-(9,55)
(9,58)-(9,60)
(9,67)-(9,75)
(9,68)-(9,70)
(9,72)-(9,74)
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
(14,11)-(23,34)
(14,14)-(23,34)
(15,2)-(23,34)
(15,11)-(22,51)
(16,4)-(22,51)
(16,10)-(19,58)
(16,12)-(19,58)
(17,6)-(19,58)
(17,12)-(17,13)
(18,14)-(18,15)
(19,17)-(19,58)
(19,17)-(19,53)
(19,18)-(19,45)
(19,19)-(19,30)
(19,20)-(19,27)
(19,28)-(19,29)
(19,33)-(19,44)
(19,34)-(19,41)
(19,42)-(19,43)
(19,50)-(19,52)
(19,57)-(19,58)
(20,4)-(22,51)
(20,15)-(20,17)
(21,4)-(22,51)
(21,15)-(21,44)
(21,15)-(21,23)
(21,24)-(21,44)
(21,25)-(21,37)
(21,38)-(21,40)
(21,41)-(21,43)
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