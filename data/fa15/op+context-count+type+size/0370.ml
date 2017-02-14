
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  if difference2 > 0
  then (((clone 0 difference2) @ l1), l2)
  else
    if difference1 > 0 then (l1, ((clone 0 difference1) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> if h = 0 then removeZero t else h :: (removeZero t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + x in
    let base = [] in
    let args = l1 l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  if difference2 > 0
  then (((clone 0 difference2) @ l1), l2)
  else
    if difference1 > 0 then (l1, ((clone 0 difference1) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> if h = 0 then removeZero t else h :: (removeZero t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,temp) = a in
      let s = (x1 + x2) + carry in
      let carry' = s / 10 in
      let rem = s mod 10 in
      let acc = rem :: temp in
      if (List.length acc) = (List.length l1)
      then (0, (carry' :: acc))
      else (carry', acc) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,17)-(19,18)
(19,17)-(19,22)
(20,5)-(21,72)
(20,16)-(20,18)
(21,5)-(21,72)
(21,16)-(21,18)
(21,16)-(21,21)
(21,19)-(21,21)
(21,25)-(21,72)
(21,39)-(21,53)
(21,39)-(21,65)
(21,54)-(21,55)
(21,56)-(21,60)
(21,61)-(21,65)
(21,69)-(21,72)
(22,3)-(22,13)
(22,15)-(22,18)
(22,15)-(22,33)
(22,20)-(22,27)
(22,20)-(22,33)
(22,28)-(22,30)
(22,31)-(22,33)
*)

(* type error slice
(4,4)-(10,79)
(4,13)-(10,76)
(4,16)-(10,76)
(5,3)-(10,76)
(6,3)-(10,76)
(7,3)-(10,76)
(8,11)-(8,36)
(8,11)-(8,41)
(8,32)-(8,33)
(18,3)-(22,33)
(18,12)-(21,72)
(19,5)-(21,72)
(19,11)-(19,22)
(19,17)-(19,18)
(19,17)-(19,22)
(20,5)-(21,72)
(20,16)-(20,18)
(21,16)-(21,18)
(21,16)-(21,21)
(21,39)-(21,53)
(21,39)-(21,65)
(21,54)-(21,55)
(21,56)-(21,60)
(22,15)-(22,18)
(22,15)-(22,33)
(22,20)-(22,27)
(22,20)-(22,33)
*)
