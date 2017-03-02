
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then (((clone 0 ((-1) * diff)) @ l1), l2)
  else if diff > 0 then (l1, ((clone 0 diff) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | hd::tl -> if hd = 0 then removeZero tl else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = List.combine padZero l1 l2 in
    let base = failwith "to be implemented" in
    let args = failwith "to be implemented" in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let addition (x,y) = x + y;;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then (((clone 0 ((-1) * diff)) @ l1), l2)
  else if diff > 0 then (l1, ((clone 0 diff) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | hd::tl -> if hd = 0 then removeZero tl else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (m,n) = x in
      let (y,z) = a in (((addition (m, n)) / 10), [(addition (m, n)) mod 10]) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(7,12)-(11,65)
(8,2)-(11,65)
(17,2)-(22,34)
(18,4)-(21,51)
(18,16)-(18,28)
(18,16)-(18,42)
(18,29)-(18,36)
(19,4)-(21,51)
(19,15)-(19,23)
(19,15)-(19,43)
(19,24)-(19,43)
(20,4)-(21,51)
(20,15)-(20,23)
(20,15)-(20,43)
(20,24)-(20,43)
(21,4)-(21,51)
*)

(* type error slice
(18,16)-(18,28)
(18,16)-(18,42)
*)

(* all spans
(2,20)-(3,54)
(2,22)-(3,54)
(2,24)-(3,54)
(3,2)-(3,54)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(3,17)-(3,18)
(3,24)-(3,54)
(3,24)-(3,35)
(3,36)-(3,37)
(3,38)-(3,45)
(3,39)-(3,40)
(3,43)-(3,44)
(3,46)-(3,54)
(3,47)-(3,48)
(3,52)-(3,53)
(5,14)-(5,60)
(5,16)-(5,60)
(5,20)-(5,60)
(5,23)-(5,28)
(5,23)-(5,24)
(5,27)-(5,28)
(5,34)-(5,36)
(5,42)-(5,60)
(5,42)-(5,53)
(5,54)-(5,55)
(5,56)-(5,57)
(5,58)-(5,60)
(7,12)-(11,65)
(7,15)-(11,65)
(8,2)-(11,65)
(8,13)-(8,48)
(8,13)-(8,29)
(8,14)-(8,25)
(8,26)-(8,28)
(8,32)-(8,48)
(8,33)-(8,44)
(8,45)-(8,47)
(9,2)-(11,65)
(9,5)-(9,13)
(9,5)-(9,9)
(9,12)-(9,13)
(10,7)-(10,43)
(10,8)-(10,38)
(10,33)-(10,34)
(10,9)-(10,32)
(10,10)-(10,15)
(10,16)-(10,17)
(10,18)-(10,31)
(10,19)-(10,23)
(10,26)-(10,30)
(10,35)-(10,37)
(10,40)-(10,42)
(11,7)-(11,65)
(11,10)-(11,18)
(11,10)-(11,14)
(11,17)-(11,18)
(11,24)-(11,51)
(11,25)-(11,27)
(11,29)-(11,50)
(11,45)-(11,46)
(11,30)-(11,44)
(11,31)-(11,36)
(11,37)-(11,38)
(11,39)-(11,43)
(11,47)-(11,49)
(11,57)-(11,65)
(11,58)-(11,60)
(11,62)-(11,64)
(13,19)-(14,73)
(14,2)-(14,73)
(14,8)-(14,9)
(14,23)-(14,25)
(14,38)-(14,73)
(14,41)-(14,47)
(14,41)-(14,43)
(14,46)-(14,47)
(14,53)-(14,66)
(14,53)-(14,63)
(14,64)-(14,66)
(14,72)-(14,73)
(16,11)-(22,34)
(16,14)-(22,34)
(17,2)-(22,34)
(17,11)-(21,51)
(18,4)-(21,51)
(18,10)-(18,42)
(18,12)-(18,42)
(18,16)-(18,42)
(18,16)-(18,28)
(18,29)-(18,36)
(18,37)-(18,39)
(18,40)-(18,42)
(19,4)-(21,51)
(19,15)-(19,43)
(19,15)-(19,23)
(19,24)-(19,43)
(20,4)-(21,51)
(20,15)-(20,43)
(20,15)-(20,23)
(20,24)-(20,43)
(21,4)-(21,51)
(21,18)-(21,44)
(21,18)-(21,32)
(21,33)-(21,34)
(21,35)-(21,39)
(21,40)-(21,44)
(21,48)-(21,51)
(22,2)-(22,34)
(22,2)-(22,12)
(22,13)-(22,34)
(22,14)-(22,17)
(22,18)-(22,33)
(22,19)-(22,26)
(22,27)-(22,29)
(22,30)-(22,32)
*)
