
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t when h == 0 -> removeZero t | h::t -> h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((w,b),(y,z)) -> ((((w + y) + z) / 10), (((y + z) mod 10) :: b)) in
    let base = (0, []) in
    let args = List.rev ((List.combine 0) :: (l1 0) :: l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t when h == 0 -> removeZero t | h::t -> h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((w,b),(y,z)) -> ((((w + y) + z) / 10), (((y + z) mod 10) :: b)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,24)-(20,58)
(20,25)-(20,41)
(20,39)-(20,40)
(20,45)-(20,51)
(20,45)-(20,57)
*)

(* type error slice
(16,4)-(21,51)
(16,10)-(18,72)
(16,12)-(18,72)
(17,6)-(18,72)
(17,12)-(17,18)
(17,16)-(17,17)
(20,4)-(21,51)
(20,15)-(20,23)
(20,15)-(20,58)
(20,24)-(20,58)
(20,25)-(20,41)
(20,26)-(20,38)
(20,39)-(20,40)
(21,18)-(21,32)
(21,18)-(21,44)
(21,33)-(21,34)
(21,40)-(21,44)
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
(4,12)-(9,43)
(4,15)-(9,43)
(5,2)-(9,43)
(5,13)-(5,27)
(5,13)-(5,24)
(5,25)-(5,27)
(6,2)-(9,43)
(6,13)-(6,27)
(6,13)-(6,24)
(6,25)-(6,27)
(7,2)-(9,43)
(7,5)-(7,16)
(7,5)-(7,9)
(7,12)-(7,16)
(8,7)-(8,43)
(8,8)-(8,10)
(8,12)-(8,42)
(8,37)-(8,38)
(8,13)-(8,36)
(8,14)-(8,19)
(8,20)-(8,21)
(8,22)-(8,35)
(8,23)-(8,27)
(8,30)-(8,34)
(8,39)-(8,41)
(9,7)-(9,43)
(9,8)-(9,38)
(9,33)-(9,34)
(9,9)-(9,32)
(9,10)-(9,15)
(9,16)-(9,17)
(9,18)-(9,31)
(9,19)-(9,23)
(9,26)-(9,30)
(9,35)-(9,37)
(9,40)-(9,42)
(11,19)-(12,77)
(12,2)-(12,77)
(12,8)-(12,9)
(12,38)-(12,44)
(12,38)-(12,39)
(12,43)-(12,44)
(12,23)-(12,25)
(12,48)-(12,60)
(12,48)-(12,58)
(12,59)-(12,60)
(12,71)-(12,77)
(12,71)-(12,72)
(12,76)-(12,77)
(14,11)-(22,34)
(14,14)-(22,34)
(15,2)-(22,34)
(15,11)-(21,51)
(16,4)-(21,51)
(16,10)-(18,72)
(16,12)-(18,72)
(17,6)-(18,72)
(17,12)-(17,18)
(17,13)-(17,14)
(17,16)-(17,17)
(18,25)-(18,72)
(18,26)-(18,46)
(18,27)-(18,40)
(18,28)-(18,35)
(18,29)-(18,30)
(18,33)-(18,34)
(18,38)-(18,39)
(18,43)-(18,45)
(18,48)-(18,71)
(18,49)-(18,65)
(18,50)-(18,57)
(18,51)-(18,52)
(18,55)-(18,56)
(18,62)-(18,64)
(18,69)-(18,70)
(19,4)-(21,51)
(19,15)-(19,22)
(19,16)-(19,17)
(19,19)-(19,21)
(20,4)-(21,51)
(20,15)-(20,58)
(20,15)-(20,23)
(20,24)-(20,58)
(20,25)-(20,41)
(20,26)-(20,38)
(20,39)-(20,40)
(20,45)-(20,57)
(20,45)-(20,51)
(20,46)-(20,48)
(20,49)-(20,50)
(20,55)-(20,57)
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
