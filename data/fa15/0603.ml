
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
      let lr1 = List.rev l1 in
      let lr2 = List.rev l2 in
      let h1::t1 = lr1 in
      let h2::t2 = lr2 in
      if (h1 + h2) > 9
      then (1, [(h1 + h2) - 10]) :: a
      else (0, [h1 + h2]) :: a in
    let base = [(0, [])] in
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
(16,6)-(22,30)
(16,16)-(16,24)
(16,16)-(16,27)
(16,25)-(16,27)
(17,6)-(22,30)
(17,16)-(17,24)
(17,16)-(17,27)
(17,25)-(17,27)
(18,6)-(22,30)
(18,19)-(18,22)
(19,6)-(22,30)
(19,19)-(19,22)
(20,6)-(22,30)
(20,9)-(20,18)
(20,9)-(20,22)
(20,10)-(20,12)
(20,15)-(20,17)
(20,21)-(20,22)
(21,11)-(21,32)
(21,11)-(21,37)
(21,12)-(21,13)
(21,15)-(21,31)
(21,16)-(21,30)
(21,17)-(21,19)
(21,22)-(21,24)
(21,28)-(21,30)
(21,36)-(21,37)
(22,11)-(22,30)
(22,12)-(22,13)
(22,15)-(22,24)
(22,16)-(22,18)
(22,16)-(22,23)
(22,21)-(22,23)
(22,29)-(22,30)
(23,4)-(25,51)
(23,15)-(23,24)
*)

(* type error slice
(15,4)-(25,51)
(15,10)-(22,30)
(21,11)-(21,37)
(21,36)-(21,37)
(25,4)-(25,51)
(25,18)-(25,32)
(25,18)-(25,44)
(25,33)-(25,34)
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
(13,11)-(26,34)
(13,14)-(26,34)
(14,2)-(26,34)
(14,11)-(25,51)
(15,4)-(25,51)
(15,10)-(22,30)
(15,12)-(22,30)
(16,6)-(22,30)
(16,16)-(16,27)
(16,16)-(16,24)
(16,25)-(16,27)
(17,6)-(22,30)
(17,16)-(17,27)
(17,16)-(17,24)
(17,25)-(17,27)
(18,6)-(22,30)
(18,19)-(18,22)
(19,6)-(22,30)
(19,19)-(19,22)
(20,6)-(22,30)
(20,9)-(20,22)
(20,9)-(20,18)
(20,10)-(20,12)
(20,15)-(20,17)
(20,21)-(20,22)
(21,11)-(21,37)
(21,11)-(21,32)
(21,12)-(21,13)
(21,15)-(21,31)
(21,16)-(21,30)
(21,16)-(21,25)
(21,17)-(21,19)
(21,22)-(21,24)
(21,28)-(21,30)
(21,36)-(21,37)
(22,11)-(22,30)
(22,11)-(22,25)
(22,12)-(22,13)
(22,15)-(22,24)
(22,16)-(22,23)
(22,16)-(22,18)
(22,21)-(22,23)
(22,29)-(22,30)
(23,4)-(25,51)
(23,15)-(23,24)
(23,16)-(23,23)
(23,17)-(23,18)
(23,20)-(23,22)
(24,4)-(25,51)
(24,15)-(24,44)
(24,15)-(24,23)
(24,24)-(24,44)
(24,25)-(24,37)
(24,38)-(24,40)
(24,41)-(24,43)
(25,4)-(25,51)
(25,18)-(25,44)
(25,18)-(25,32)
(25,33)-(25,34)
(25,35)-(25,39)
(25,40)-(25,44)
(25,48)-(25,51)
(26,2)-(26,34)
(26,2)-(26,12)
(26,13)-(26,34)
(26,14)-(26,17)
(26,18)-(26,33)
(26,19)-(26,26)
(26,27)-(26,29)
(26,30)-(26,32)
*)
