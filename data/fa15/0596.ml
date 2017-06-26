
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
      let t1 = List.tl l1 in
      let t2 = List.tl l2 in
      if (t1 + t2) > 9 then (1, [(t1 + t2) - 10]) else (0, [t1 + t2]) in
    let base = (0, []) in
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
      let t1 = List.nth l1 (List.length l1) in
      let t2 = List.nth l2 (List.length l2) in
      if (t1 + t2) > 9 then (1, [(t1 + t2) - 10]) else (0, [t1 + t2]) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,15)-(16,22)
(16,15)-(16,25)
(17,15)-(17,22)
(17,15)-(17,25)
*)

(* type error slice
(16,6)-(18,69)
(16,15)-(16,22)
(16,15)-(16,25)
(17,6)-(18,69)
(17,15)-(17,22)
(17,15)-(17,25)
(18,9)-(18,18)
(18,10)-(18,12)
(18,15)-(18,17)
(18,33)-(18,42)
(18,34)-(18,36)
(18,39)-(18,41)
(18,60)-(18,62)
(18,60)-(18,67)
(18,65)-(18,67)
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
(13,11)-(22,34)
(13,14)-(22,34)
(14,2)-(22,34)
(14,11)-(21,51)
(15,4)-(21,51)
(15,10)-(18,69)
(15,12)-(18,69)
(16,6)-(18,69)
(16,15)-(16,25)
(16,15)-(16,22)
(16,23)-(16,25)
(17,6)-(18,69)
(17,15)-(17,25)
(17,15)-(17,22)
(17,23)-(17,25)
(18,6)-(18,69)
(18,9)-(18,22)
(18,9)-(18,18)
(18,10)-(18,12)
(18,15)-(18,17)
(18,21)-(18,22)
(18,28)-(18,49)
(18,29)-(18,30)
(18,32)-(18,48)
(18,33)-(18,47)
(18,33)-(18,42)
(18,34)-(18,36)
(18,39)-(18,41)
(18,45)-(18,47)
(18,55)-(18,69)
(18,56)-(18,57)
(18,59)-(18,68)
(18,60)-(18,67)
(18,60)-(18,62)
(18,65)-(18,67)
(19,4)-(21,51)
(19,15)-(19,22)
(19,16)-(19,17)
(19,19)-(19,21)
(20,4)-(21,51)
(20,15)-(20,44)
(20,15)-(20,23)
(20,24)-(20,44)
(20,25)-(20,37)
(20,38)-(20,40)
(20,41)-(20,43)
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
