
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
    let f a x = ((a + x), (a + x)) in
    let base = (0, 0) in
    let args = l1 in let (_,res) = List.fold_left f base args in res in
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
(19,19)-(19,20)
(19,19)-(19,24)
(19,19)-(19,33)
(19,28)-(19,33)
(19,32)-(19,33)
(20,5)-(21,69)
(20,17)-(20,18)
(20,17)-(20,21)
(20,20)-(20,21)
(21,5)-(21,69)
(21,16)-(21,18)
(21,22)-(21,69)
(21,36)-(21,50)
(21,36)-(21,62)
(21,51)-(21,52)
(21,53)-(21,57)
(21,58)-(21,62)
(21,66)-(21,69)
(22,3)-(22,13)
(22,3)-(22,33)
(22,15)-(22,18)
(22,15)-(22,33)
(22,20)-(22,27)
(22,20)-(22,33)
(22,31)-(22,33)
*)

(* type error slice
(19,5)-(21,69)
(19,11)-(19,33)
(19,13)-(19,33)
(19,19)-(19,20)
(19,19)-(19,24)
(19,19)-(19,33)
(21,36)-(21,50)
(21,36)-(21,62)
(21,51)-(21,52)
*)
