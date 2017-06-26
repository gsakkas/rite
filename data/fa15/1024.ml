
let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (l1, ((clone 0 z) @ l2))
  else (let z = y - x in (((clone 0 z) @ l1), l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (y,z) = x in
      let (r,s) = a in let m = (r + s) + y in ((m / 10), ((m mod 10) :: z)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (l1, ((clone 0 z) @ l2))
  else (let z = y - x in (((clone 0 z) @ l1), l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (y,z) = a in
      let (r,s) = x in let m = (r + s) + y in ((m / 10), ((m mod 10) :: z)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,18)-(20,19)
(21,6)-(21,75)
*)

(* type error slice
(19,4)-(24,51)
(19,10)-(21,75)
(19,12)-(21,75)
(20,6)-(21,75)
(21,6)-(21,75)
(21,18)-(21,19)
(21,23)-(21,75)
(21,31)-(21,38)
(21,36)-(21,37)
(21,46)-(21,75)
(21,57)-(21,74)
(24,18)-(24,32)
(24,18)-(24,44)
(24,33)-(24,34)
*)

(* all spans
(2,14)-(3,66)
(2,16)-(3,66)
(3,2)-(3,66)
(3,8)-(3,9)
(3,24)-(3,30)
(3,24)-(3,25)
(3,29)-(3,30)
(3,34)-(3,36)
(3,44)-(3,66)
(3,44)-(3,45)
(3,49)-(3,66)
(3,50)-(3,55)
(3,56)-(3,57)
(3,58)-(3,65)
(3,59)-(3,60)
(3,63)-(3,64)
(5,12)-(10,50)
(5,15)-(10,50)
(6,2)-(10,50)
(6,10)-(6,24)
(6,10)-(6,21)
(6,22)-(6,24)
(7,2)-(10,50)
(7,10)-(7,24)
(7,10)-(7,21)
(7,22)-(7,24)
(8,2)-(10,50)
(8,5)-(8,10)
(8,5)-(8,6)
(8,9)-(8,10)
(9,7)-(9,48)
(9,15)-(9,20)
(9,15)-(9,16)
(9,19)-(9,20)
(9,24)-(9,48)
(9,25)-(9,27)
(9,29)-(9,47)
(9,42)-(9,43)
(9,30)-(9,41)
(9,31)-(9,36)
(9,37)-(9,38)
(9,39)-(9,40)
(9,44)-(9,46)
(10,7)-(10,50)
(10,16)-(10,21)
(10,16)-(10,17)
(10,20)-(10,21)
(10,25)-(10,49)
(10,26)-(10,44)
(10,39)-(10,40)
(10,27)-(10,38)
(10,28)-(10,33)
(10,34)-(10,35)
(10,36)-(10,37)
(10,41)-(10,43)
(10,46)-(10,48)
(12,19)-(15,60)
(13,2)-(15,60)
(13,8)-(13,9)
(14,10)-(14,12)
(15,12)-(15,60)
(15,19)-(15,20)
(15,33)-(15,45)
(15,33)-(15,43)
(15,44)-(15,45)
(15,53)-(15,59)
(15,53)-(15,54)
(15,58)-(15,59)
(17,11)-(25,34)
(17,14)-(25,34)
(18,2)-(25,34)
(18,11)-(24,51)
(19,4)-(24,51)
(19,10)-(21,75)
(19,12)-(21,75)
(20,6)-(21,75)
(20,18)-(20,19)
(21,6)-(21,75)
(21,18)-(21,19)
(21,23)-(21,75)
(21,31)-(21,42)
(21,31)-(21,38)
(21,32)-(21,33)
(21,36)-(21,37)
(21,41)-(21,42)
(21,46)-(21,75)
(21,47)-(21,55)
(21,48)-(21,49)
(21,52)-(21,54)
(21,57)-(21,74)
(21,58)-(21,68)
(21,59)-(21,60)
(21,65)-(21,67)
(21,72)-(21,73)
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
