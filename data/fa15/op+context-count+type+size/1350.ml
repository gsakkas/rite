
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = match x with | (x1,x2) -> x1 + x2 in if sum < 10 then x :: a in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match a with | (o,[]) -> (o, [x]) | (o,l) -> (o, (x :: l)) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      List.map combine (List.rev (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,7)-(19,77)
(19,17)-(19,50)
(19,23)-(19,24)
(19,43)-(19,45)
(19,43)-(19,50)
(19,48)-(19,50)
(19,54)-(19,77)
(19,57)-(19,60)
(19,57)-(19,65)
(19,63)-(19,65)
(19,71)-(19,77)
(19,76)-(19,77)
(20,5)-(22,52)
(20,16)-(20,18)
(21,5)-(22,52)
(21,16)-(21,44)
(22,5)-(22,52)
(23,15)-(23,18)
(23,20)-(23,27)
(23,20)-(23,33)
(23,28)-(23,30)
(23,31)-(23,33)
*)

(* type error slice
(18,5)-(22,52)
(18,11)-(19,77)
(19,54)-(19,77)
(19,54)-(19,77)
(19,54)-(19,77)
(19,71)-(19,77)
(19,71)-(19,77)
(19,76)-(19,77)
(22,5)-(22,52)
(22,19)-(22,33)
(22,19)-(22,45)
(22,34)-(22,35)
*)
