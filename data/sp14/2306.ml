
let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (h::t,_) = a in [[0]; [0]] :: a in
    let base = ((List.rev l1), []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (h::t,_) = a in ([], []) in
    let base = ((List.rev l1), []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,36)-(19,46)
(19,36)-(19,51)
(19,37)-(19,40)
(19,38)-(19,39)
(19,42)-(19,45)
(19,43)-(19,44)
(19,50)-(19,51)
(20,4)-(21,68)
*)

(* type error slice
(19,4)-(21,68)
(19,10)-(19,51)
(19,12)-(19,51)
(19,16)-(19,51)
(19,31)-(19,32)
(19,36)-(19,51)
(19,50)-(19,51)
(21,35)-(21,49)
(21,35)-(21,61)
(21,50)-(21,51)
*)

(* all spans
(2,14)-(6,16)
(2,16)-(6,16)
(3,2)-(6,16)
(3,14)-(3,16)
(4,2)-(6,16)
(4,17)-(5,56)
(4,23)-(5,56)
(5,4)-(5,56)
(5,7)-(5,12)
(5,7)-(5,8)
(5,11)-(5,12)
(5,18)-(5,23)
(5,29)-(5,56)
(5,29)-(5,35)
(5,36)-(5,48)
(5,37)-(5,38)
(5,42)-(5,47)
(5,49)-(5,56)
(5,50)-(5,51)
(5,54)-(5,55)
(6,2)-(6,16)
(6,2)-(6,8)
(6,9)-(6,14)
(6,15)-(6,16)
(8,12)-(12,75)
(8,15)-(12,75)
(9,2)-(12,75)
(9,14)-(9,50)
(9,15)-(9,31)
(9,16)-(9,27)
(9,28)-(9,30)
(9,33)-(9,49)
(9,34)-(9,45)
(9,46)-(9,48)
(10,2)-(12,75)
(10,5)-(10,10)
(10,5)-(10,6)
(10,9)-(10,10)
(11,7)-(11,47)
(11,8)-(11,42)
(11,9)-(11,20)
(11,21)-(11,38)
(11,22)-(11,27)
(11,28)-(11,29)
(11,30)-(11,37)
(11,31)-(11,32)
(11,35)-(11,36)
(11,39)-(11,41)
(11,44)-(11,46)
(12,7)-(12,75)
(12,10)-(12,15)
(12,10)-(12,11)
(12,14)-(12,15)
(12,21)-(12,61)
(12,22)-(12,24)
(12,26)-(12,60)
(12,27)-(12,38)
(12,39)-(12,56)
(12,40)-(12,45)
(12,46)-(12,47)
(12,48)-(12,55)
(12,49)-(12,50)
(12,53)-(12,54)
(12,57)-(12,59)
(12,67)-(12,75)
(12,68)-(12,70)
(12,72)-(12,74)
(14,19)-(15,69)
(15,2)-(15,69)
(15,8)-(15,9)
(15,23)-(15,25)
(15,36)-(15,69)
(15,39)-(15,44)
(15,39)-(15,40)
(15,43)-(15,44)
(15,50)-(15,62)
(15,50)-(15,60)
(15,61)-(15,62)
(15,68)-(15,69)
(17,11)-(22,34)
(17,14)-(22,34)
(18,2)-(22,34)
(18,11)-(21,68)
(19,4)-(21,68)
(19,10)-(19,51)
(19,12)-(19,51)
(19,16)-(19,51)
(19,31)-(19,32)
(19,36)-(19,51)
(19,36)-(19,46)
(19,37)-(19,40)
(19,38)-(19,39)
(19,42)-(19,45)
(19,43)-(19,44)
(19,50)-(19,51)
(20,4)-(21,68)
(20,15)-(20,34)
(20,16)-(20,29)
(20,17)-(20,25)
(20,26)-(20,28)
(20,31)-(20,33)
(21,4)-(21,68)
(21,15)-(21,17)
(21,21)-(21,68)
(21,35)-(21,61)
(21,35)-(21,49)
(21,50)-(21,51)
(21,52)-(21,56)
(21,57)-(21,61)
(21,65)-(21,68)
(22,2)-(22,34)
(22,2)-(22,12)
(22,13)-(22,34)
(22,14)-(22,17)
(22,18)-(22,33)
(22,19)-(22,26)
(22,27)-(22,29)
(22,30)-(22,32)
*)
