
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then
      (let y = (clone 0 ((List.length l1) - (List.length l2))) @ l2 in
       (l1, y))
    else
      (let z = (clone 0 ((List.length l2) - (List.length l1))) @ l1 in
       (z, l2));;

let rec removeZero l =
  match l with | x::xs -> if x = 0 then removeZero xs else l | [] -> [];;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "tba" in
    let base = [] in
    let args = failwith "to be implemented" in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then
      (let y = (clone 0 ((List.length l1) - (List.length l2))) @ l2 in
       (l1, y))
    else
      (let z = (clone 0 ((List.length l2) - (List.length l1))) @ l1 in
       (z, l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (d1,d2) ->
          (match a with
           | (carry,result) ->
               if ((d1 + d2) + carry) > 9
               then (1, ((((d1 + d2) + 1) - 10) :: result))
               else (0, ((d1 + d2) :: result))) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,2)-(17,71)
(17,26)-(17,60)
(17,29)-(17,30)
(17,51)-(17,53)
(17,69)-(17,71)
(21,16)-(21,24)
(21,16)-(21,30)
(21,25)-(21,30)
(22,4)-(24,51)
(22,15)-(22,17)
(23,4)-(24,51)
(23,15)-(23,23)
(23,15)-(23,43)
(23,24)-(23,43)
(24,4)-(24,51)
(24,18)-(24,32)
(24,18)-(24,44)
(24,33)-(24,34)
(24,35)-(24,39)
(24,40)-(24,44)
(24,48)-(24,51)
(25,2)-(25,12)
(25,2)-(25,34)
(25,13)-(25,34)
(25,14)-(25,17)
(25,18)-(25,33)
(25,19)-(25,26)
(25,27)-(25,29)
(25,30)-(25,32)
*)

(* type error slice
(22,4)-(24,51)
(22,15)-(22,17)
(24,4)-(24,51)
(24,18)-(24,32)
(24,18)-(24,44)
(24,35)-(24,39)
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
(4,12)-(14,15)
(4,15)-(14,15)
(5,2)-(14,15)
(5,5)-(5,40)
(5,5)-(5,21)
(5,6)-(5,17)
(5,18)-(5,20)
(5,24)-(5,40)
(5,25)-(5,36)
(5,37)-(5,39)
(6,7)-(6,15)
(6,8)-(6,10)
(6,12)-(6,14)
(8,4)-(14,15)
(8,7)-(8,42)
(8,7)-(8,23)
(8,8)-(8,19)
(8,20)-(8,22)
(8,26)-(8,42)
(8,27)-(8,38)
(8,39)-(8,41)
(10,6)-(11,15)
(10,15)-(10,67)
(10,63)-(10,64)
(10,15)-(10,62)
(10,16)-(10,21)
(10,22)-(10,23)
(10,24)-(10,61)
(10,25)-(10,41)
(10,26)-(10,37)
(10,38)-(10,40)
(10,44)-(10,60)
(10,45)-(10,56)
(10,57)-(10,59)
(10,65)-(10,67)
(11,7)-(11,14)
(11,8)-(11,10)
(11,12)-(11,13)
(13,6)-(14,15)
(13,15)-(13,67)
(13,63)-(13,64)
(13,15)-(13,62)
(13,16)-(13,21)
(13,22)-(13,23)
(13,24)-(13,61)
(13,25)-(13,41)
(13,26)-(13,37)
(13,38)-(13,40)
(13,44)-(13,60)
(13,45)-(13,56)
(13,57)-(13,59)
(13,65)-(13,67)
(14,7)-(14,14)
(14,8)-(14,9)
(14,11)-(14,13)
(16,19)-(17,71)
(17,2)-(17,71)
(17,8)-(17,9)
(17,26)-(17,60)
(17,29)-(17,34)
(17,29)-(17,30)
(17,33)-(17,34)
(17,40)-(17,53)
(17,40)-(17,50)
(17,51)-(17,53)
(17,59)-(17,60)
(17,69)-(17,71)
(19,11)-(25,34)
(19,14)-(25,34)
(20,2)-(25,34)
(20,11)-(24,51)
(21,4)-(24,51)
(21,10)-(21,30)
(21,12)-(21,30)
(21,16)-(21,30)
(21,16)-(21,24)
(21,25)-(21,30)
(22,4)-(24,51)
(22,15)-(22,17)
(23,4)-(24,51)
(23,15)-(23,43)
(23,15)-(23,23)
(23,24)-(23,43)
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
