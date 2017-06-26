
let rec clone x n = if n > 0 then List.append [x] (clone x (n - 1)) else [];;

let padZero l1 l2 =
  ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1),
    (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | _ -> let h::t = l in (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (a1,a2)::t' = a in
      match x with
      | [] -> if a1 = 0 then [] else [0. a1]
      | (x1,x2)::t ->
          let value = (a1 + x1) + x2 in
          if value > 9 then [(1, (value - 10))] @ a else (0, value) :: a in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then List.append [x] (clone x (n - 1)) else [];;

let padZero l1 l2 =
  ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1),
    (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | _ -> let h::t = l in (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (a1,a2) = a in
      let (x1,x2) = x in
      let val1 = (a1 + x1) + x2 in
      let val2 = (x1 + x2) / 10 in (val2, (val1 :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,6)-(21,72)
(17,6)-(21,72)
(18,14)-(18,44)
(18,17)-(18,19)
(18,17)-(18,23)
(18,22)-(18,23)
(18,29)-(18,31)
(18,37)-(18,44)
(18,38)-(18,40)
(18,38)-(18,43)
(18,41)-(18,43)
(20,10)-(21,72)
(21,10)-(21,72)
(21,13)-(21,18)
(21,13)-(21,22)
(21,21)-(21,22)
(21,28)-(21,47)
(21,28)-(21,51)
(21,29)-(21,46)
(21,30)-(21,31)
(21,33)-(21,45)
(21,34)-(21,39)
(21,42)-(21,44)
(21,48)-(21,49)
(21,50)-(21,51)
(21,57)-(21,67)
(21,57)-(21,72)
(21,61)-(21,66)
(21,71)-(21,72)
(22,4)-(24,51)
*)

(* type error slice
(15,4)-(24,51)
(15,10)-(21,72)
(15,12)-(21,72)
(17,6)-(21,72)
(17,12)-(17,13)
(18,38)-(18,40)
(18,38)-(18,43)
(23,4)-(24,51)
(23,15)-(23,23)
(23,15)-(23,44)
(23,24)-(23,44)
(23,25)-(23,37)
(24,18)-(24,32)
(24,18)-(24,44)
(24,33)-(24,34)
(24,40)-(24,44)
*)

(* all spans
(2,14)-(2,75)
(2,16)-(2,75)
(2,20)-(2,75)
(2,23)-(2,28)
(2,23)-(2,24)
(2,27)-(2,28)
(2,34)-(2,67)
(2,34)-(2,45)
(2,46)-(2,49)
(2,47)-(2,48)
(2,50)-(2,67)
(2,51)-(2,56)
(2,57)-(2,58)
(2,59)-(2,66)
(2,60)-(2,61)
(2,64)-(2,65)
(2,73)-(2,75)
(4,12)-(6,69)
(4,15)-(6,69)
(5,2)-(6,69)
(5,3)-(5,67)
(5,4)-(5,15)
(5,16)-(5,63)
(5,17)-(5,22)
(5,23)-(5,24)
(5,25)-(5,62)
(5,26)-(5,42)
(5,27)-(5,38)
(5,39)-(5,41)
(5,45)-(5,61)
(5,46)-(5,57)
(5,58)-(5,60)
(5,64)-(5,66)
(6,4)-(6,68)
(6,5)-(6,16)
(6,17)-(6,64)
(6,18)-(6,23)
(6,24)-(6,25)
(6,26)-(6,63)
(6,27)-(6,43)
(6,28)-(6,39)
(6,40)-(6,42)
(6,46)-(6,62)
(6,47)-(6,58)
(6,59)-(6,61)
(6,65)-(6,67)
(8,19)-(11,68)
(9,2)-(11,68)
(9,8)-(9,9)
(10,10)-(10,12)
(11,9)-(11,68)
(11,20)-(11,21)
(11,25)-(11,68)
(11,32)-(11,33)
(11,46)-(11,58)
(11,46)-(11,56)
(11,57)-(11,58)
(11,66)-(11,67)
(13,11)-(25,34)
(13,14)-(25,34)
(14,2)-(25,34)
(14,11)-(24,51)
(15,4)-(24,51)
(15,10)-(21,72)
(15,12)-(21,72)
(16,6)-(21,72)
(16,24)-(16,25)
(17,6)-(21,72)
(17,12)-(17,13)
(18,14)-(18,44)
(18,17)-(18,23)
(18,17)-(18,19)
(18,22)-(18,23)
(18,29)-(18,31)
(18,37)-(18,44)
(18,38)-(18,43)
(18,38)-(18,40)
(18,41)-(18,43)
(20,10)-(21,72)
(20,22)-(20,36)
(20,22)-(20,31)
(20,23)-(20,25)
(20,28)-(20,30)
(20,34)-(20,36)
(21,10)-(21,72)
(21,13)-(21,22)
(21,13)-(21,18)
(21,21)-(21,22)
(21,28)-(21,51)
(21,48)-(21,49)
(21,28)-(21,47)
(21,29)-(21,46)
(21,30)-(21,31)
(21,33)-(21,45)
(21,34)-(21,39)
(21,42)-(21,44)
(21,50)-(21,51)
(21,57)-(21,72)
(21,57)-(21,67)
(21,58)-(21,59)
(21,61)-(21,66)
(21,71)-(21,72)
(22,4)-(24,51)
(22,15)-(22,17)
(23,4)-(24,51)
(23,15)-(23,44)
(23,15)-(23,23)
(23,24)-(23,44)
(23,25)-(23,37)
(23,38)-(23,40)
(23,41)-(23,43)
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
