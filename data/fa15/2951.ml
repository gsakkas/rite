
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
      let b = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + b) / 10) :: ((h + b) mod 10) :: t
      | _ -> [b / 10; b mod 10] in
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
(17,6)-(20,31)
(17,14)-(17,21)
(17,14)-(17,31)
(17,15)-(17,18)
(17,19)-(17,20)
(17,24)-(17,31)
(17,25)-(17,28)
(18,6)-(20,31)
(19,16)-(19,30)
(19,16)-(19,55)
(19,18)-(19,19)
(19,22)-(19,23)
(19,27)-(19,29)
(19,34)-(19,50)
(19,34)-(19,55)
(19,36)-(19,37)
(19,40)-(19,41)
(19,47)-(19,49)
(19,54)-(19,55)
(20,13)-(20,31)
(20,14)-(20,15)
(20,14)-(20,20)
(20,22)-(20,23)
(20,22)-(20,30)
(21,4)-(23,51)
(21,15)-(21,17)
*)

(* type error slice
(16,4)-(23,51)
(16,10)-(20,31)
(18,6)-(20,31)
(18,12)-(18,13)
(23,4)-(23,51)
(23,18)-(23,32)
(23,18)-(23,44)
(23,33)-(23,34)
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
(14,11)-(24,34)
(14,14)-(24,34)
(15,2)-(24,34)
(15,11)-(23,51)
(16,4)-(23,51)
(16,10)-(20,31)
(16,12)-(20,31)
(17,6)-(20,31)
(17,14)-(17,31)
(17,14)-(17,21)
(17,15)-(17,18)
(17,19)-(17,20)
(17,24)-(17,31)
(17,25)-(17,28)
(17,29)-(17,30)
(18,6)-(20,31)
(18,12)-(18,13)
(19,16)-(19,55)
(19,16)-(19,30)
(19,17)-(19,24)
(19,18)-(19,19)
(19,22)-(19,23)
(19,27)-(19,29)
(19,34)-(19,55)
(19,34)-(19,50)
(19,35)-(19,42)
(19,36)-(19,37)
(19,40)-(19,41)
(19,47)-(19,49)
(19,54)-(19,55)
(20,13)-(20,31)
(20,14)-(20,20)
(20,14)-(20,15)
(20,18)-(20,20)
(20,22)-(20,30)
(20,22)-(20,23)
(20,28)-(20,30)
(21,4)-(23,51)
(21,15)-(21,17)
(22,4)-(23,51)
(22,15)-(22,44)
(22,15)-(22,23)
(22,24)-(22,44)
(22,25)-(22,37)
(22,38)-(22,40)
(22,41)-(22,43)
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
