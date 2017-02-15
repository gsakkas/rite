
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
    let f a x = x + a in
    let base = (0, 0) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
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
(19,16)-(19,21)
(19,20)-(19,21)
(20,4)-(22,51)
(20,15)-(20,21)
(20,16)-(20,17)
(20,19)-(20,20)
(21,4)-(22,51)
(21,15)-(21,27)
(21,15)-(21,33)
(21,28)-(21,30)
(21,31)-(21,33)
(22,4)-(22,51)
(22,18)-(22,32)
(22,18)-(22,44)
(22,33)-(22,34)
(22,35)-(22,39)
(22,40)-(22,44)
(22,48)-(22,51)
(23,2)-(23,12)
(23,2)-(23,34)
(23,13)-(23,34)
(23,14)-(23,17)
(23,18)-(23,33)
(23,19)-(23,26)
(23,27)-(23,29)
(23,30)-(23,32)
*)

(* type error slice
(19,4)-(22,51)
(19,10)-(19,21)
(19,16)-(19,21)
(19,20)-(19,21)
(20,4)-(22,51)
(20,15)-(20,21)
(22,18)-(22,32)
(22,18)-(22,44)
(22,33)-(22,34)
(22,35)-(22,39)
*)
