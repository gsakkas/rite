
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diffsize = (List.length l1) - (List.length l2) in
  if diffsize > 0
  then (l1, (List.append (clone 0 diffsize) l2))
  else ((List.append (clone 0 ((-1) * diffsize)) l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (h1::t1,h2::t2) ->
          ([], (((h1 + h2) / 10) :: ((h1 + h2) mod 10) :: a))
      | _ -> ([], a) in
    let base = [0] in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diffsize = (List.length l1) - (List.length l2) in
  if diffsize > 0
  then (l1, (List.append (clone 0 diffsize) l2))
  else ((List.append (clone 0 ((-1) * diffsize)) l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (h1,h2) -> ((h1 + h2) / 10) :: ((h1 + h2) mod 10) :: a
      | _ -> a in
    let base = [] in
    let args = List.combine l1 l2 in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,6)-(19,20)
(18,10)-(18,61)
(18,11)-(18,13)
(19,13)-(19,20)
(19,14)-(19,16)
(20,15)-(20,18)
(20,16)-(20,17)
(22,4)-(22,51)
*)

(* type error slice
(15,4)-(22,51)
(15,10)-(19,20)
(15,12)-(19,20)
(16,6)-(19,20)
(18,10)-(18,61)
(18,36)-(18,59)
(18,58)-(18,59)
(22,18)-(22,32)
(22,18)-(22,44)
(22,33)-(22,34)
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
(4,16)-(8,57)
(4,19)-(8,57)
(5,2)-(8,57)
(5,17)-(5,52)
(5,17)-(5,33)
(5,18)-(5,29)
(5,30)-(5,32)
(5,36)-(5,52)
(5,37)-(5,48)
(5,49)-(5,51)
(6,2)-(8,57)
(6,5)-(6,17)
(6,5)-(6,13)
(6,16)-(6,17)
(7,7)-(7,48)
(7,8)-(7,10)
(7,12)-(7,47)
(7,13)-(7,24)
(7,25)-(7,43)
(7,26)-(7,31)
(7,32)-(7,33)
(7,34)-(7,42)
(7,44)-(7,46)
(8,7)-(8,57)
(8,8)-(8,52)
(8,9)-(8,20)
(8,21)-(8,48)
(8,22)-(8,27)
(8,28)-(8,29)
(8,30)-(8,47)
(8,31)-(8,35)
(8,38)-(8,46)
(8,49)-(8,51)
(8,54)-(8,56)
(10,19)-(11,74)
(11,2)-(11,74)
(11,8)-(11,9)
(11,23)-(11,25)
(11,36)-(11,74)
(11,39)-(11,44)
(11,39)-(11,40)
(11,43)-(11,44)
(11,50)-(11,62)
(11,50)-(11,60)
(11,61)-(11,62)
(11,68)-(11,74)
(11,68)-(11,69)
(11,73)-(11,74)
(13,11)-(23,34)
(13,14)-(23,34)
(14,2)-(23,34)
(14,11)-(22,51)
(15,4)-(22,51)
(15,10)-(19,20)
(15,12)-(19,20)
(16,6)-(19,20)
(16,12)-(16,13)
(18,10)-(18,61)
(18,11)-(18,13)
(18,15)-(18,60)
(18,16)-(18,32)
(18,17)-(18,26)
(18,18)-(18,20)
(18,23)-(18,25)
(18,29)-(18,31)
(18,36)-(18,59)
(18,36)-(18,54)
(18,37)-(18,46)
(18,38)-(18,40)
(18,43)-(18,45)
(18,51)-(18,53)
(18,58)-(18,59)
(19,13)-(19,20)
(19,14)-(19,16)
(19,18)-(19,19)
(20,4)-(22,51)
(20,15)-(20,18)
(20,16)-(20,17)
(21,4)-(22,51)
(21,15)-(21,33)
(21,15)-(21,27)
(21,28)-(21,30)
(21,31)-(21,33)
(22,4)-(22,51)
(22,18)-(22,44)
(22,18)-(22,32)
(22,33)-(22,34)
(22,35)-(22,39)
(22,40)-(22,44)
(22,48)-(22,51)
(23,2)-(23,34)
(23,2)-(23,12)
(23,13)-(23,34)
(23,14)-(23,17)
(23,18)-(23,33)
(23,19)-(23,26)
(23,27)-(23,29)
(23,30)-(23,32)
*)
