
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
      match x with
      | (y,z) ->
          let sum = y + z in
          (match a with
           | h::t -> ((sum + h) / 10) :: ((sum + h) mod 10) :: t
           | [] -> [sum / 10; sum mod 10]) in
    let base = [] in
    let args = List.combine (l1 l2) in
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
      match x with
      | (y,z) ->
          let sum = y + z in
          (match a with
           | h::t -> ((sum + h) / 10) :: ((sum + h) mod 10) :: t
           | _ -> [sum / 10; sum mod 10]) in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,10)-(20,42)
(22,15)-(22,27)
(22,28)-(22,35)
(23,4)-(23,51)
(23,48)-(23,51)
*)

(* type error slice
(4,3)-(7,69)
(4,12)-(7,67)
(4,15)-(7,67)
(5,2)-(7,67)
(6,38)-(6,54)
(6,39)-(6,50)
(6,51)-(6,53)
(7,7)-(7,67)
(7,8)-(7,10)
(13,2)-(24,34)
(13,11)-(23,51)
(22,4)-(23,51)
(22,15)-(22,27)
(22,15)-(22,35)
(22,28)-(22,35)
(22,29)-(22,31)
(23,18)-(23,32)
(23,18)-(23,44)
(23,40)-(23,44)
(24,13)-(24,34)
(24,14)-(24,17)
(24,18)-(24,33)
(24,19)-(24,26)
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
(12,11)-(24,34)
(12,14)-(24,34)
(13,2)-(24,34)
(13,11)-(23,51)
(14,4)-(23,51)
(14,10)-(20,42)
(14,12)-(20,42)
(15,6)-(20,42)
(15,12)-(15,13)
(17,10)-(20,42)
(17,20)-(17,25)
(17,20)-(17,21)
(17,24)-(17,25)
(18,10)-(20,42)
(18,17)-(18,18)
(19,21)-(19,64)
(19,21)-(19,37)
(19,22)-(19,31)
(19,23)-(19,26)
(19,29)-(19,30)
(19,34)-(19,36)
(19,41)-(19,64)
(19,41)-(19,59)
(19,42)-(19,51)
(19,43)-(19,46)
(19,49)-(19,50)
(19,56)-(19,58)
(19,63)-(19,64)
(20,19)-(20,41)
(20,20)-(20,28)
(20,20)-(20,23)
(20,26)-(20,28)
(20,30)-(20,40)
(20,30)-(20,33)
(20,38)-(20,40)
(21,4)-(23,51)
(21,15)-(21,17)
(22,4)-(23,51)
(22,15)-(22,35)
(22,15)-(22,27)
(22,28)-(22,35)
(22,29)-(22,31)
(22,32)-(22,34)
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
