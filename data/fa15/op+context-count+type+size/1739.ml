
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst x) + (snd x) in
      match a with
      | h::t -> (h + (sum / 10)) :: ((h + sum) mod 10) :: t
      | _ -> (((fst x) + (snd x)) / 10) :: (((fst x) + (snd x)) mod 10) in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst x) + (snd x) in
      match a with | h::t -> ((h + sum) / 10) :: ((h + sum) mod 10) :: t in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,7)-(21,71)
(20,18)-(20,31)
(20,23)-(20,31)
(21,17)-(21,20)
(21,17)-(21,22)
(21,17)-(21,32)
(21,17)-(21,39)
(21,17)-(21,71)
(21,21)-(21,22)
(21,27)-(21,30)
(21,27)-(21,32)
(21,31)-(21,32)
(21,37)-(21,39)
(21,47)-(21,50)
(21,47)-(21,52)
(21,47)-(21,62)
(21,47)-(21,71)
(21,51)-(21,52)
(21,57)-(21,60)
(21,57)-(21,62)
(21,61)-(21,62)
(21,69)-(21,71)
(22,5)-(23,75)
(23,5)-(23,75)
(23,49)-(23,75)
(24,3)-(24,33)
*)

(* type error slice
(21,17)-(21,71)
(21,47)-(21,71)
*)
