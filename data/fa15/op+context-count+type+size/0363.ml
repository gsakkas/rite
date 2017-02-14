
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
(19,16)-(19,34)
(19,17)-(19,24)
(19,18)-(19,19)
(19,26)-(19,33)
(19,31)-(19,32)
(20,4)-(21,68)
(20,15)-(20,21)
(20,16)-(20,17)
(20,19)-(20,20)
(21,4)-(21,68)
(21,15)-(21,17)
(21,21)-(21,68)
(21,35)-(21,49)
(21,35)-(21,61)
(21,50)-(21,51)
(21,52)-(21,56)
(21,57)-(21,61)
(21,65)-(21,68)
(22,2)-(22,12)
(22,2)-(22,34)
(22,13)-(22,34)
(22,14)-(22,17)
(22,18)-(22,33)
(22,19)-(22,26)
(22,30)-(22,32)
*)

(* type error slice
(19,4)-(21,68)
(19,10)-(19,34)
(19,12)-(19,34)
(19,16)-(19,34)
(19,17)-(19,24)
(19,18)-(19,19)
(21,35)-(21,49)
(21,35)-(21,61)
(21,50)-(21,51)
*)
