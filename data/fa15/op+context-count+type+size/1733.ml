
let rec padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then padZero (0 :: l1) l2
  else
    if (List.length l1) > (List.length l2)
    then padZero l1 (0 :: l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | h::t ->
          let sum = ((fst x) + (snd x)) + (fst h) in ((sum / 10) ::
            (sum mod 10)) :: t in
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
      let b = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + b) / 10) :: ((h + b) mod 10) :: t
      | _ -> [b / 10; b mod 10] in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(2,17)-(8,17)
(4,8)-(4,15)
(4,8)-(4,28)
(4,17)-(4,18)
(4,17)-(4,24)
(4,22)-(4,24)
(4,26)-(4,28)
(7,10)-(7,17)
(7,10)-(7,29)
(7,22)-(7,23)
(7,22)-(7,29)
(7,27)-(7,29)
(8,11)-(8,17)
(14,3)-(22,33)
(15,5)-(21,75)
(16,7)-(19,31)
(16,13)-(16,14)
(18,11)-(19,31)
(18,23)-(18,49)
(18,44)-(18,47)
(18,44)-(18,49)
(18,48)-(18,49)
(18,56)-(18,59)
(18,56)-(19,24)
(18,56)-(19,31)
(18,62)-(18,64)
(19,14)-(19,17)
(19,14)-(19,24)
(19,30)-(19,31)
(20,5)-(21,75)
(20,16)-(20,18)
(21,5)-(21,75)
(21,16)-(21,24)
(21,16)-(21,44)
(21,26)-(21,38)
(21,26)-(21,44)
(21,39)-(21,41)
(21,42)-(21,44)
(21,49)-(21,63)
(21,49)-(21,75)
(21,64)-(21,65)
(21,66)-(21,70)
(21,71)-(21,75)
(22,3)-(22,13)
(22,3)-(22,33)
(22,15)-(22,18)
(22,15)-(22,33)
(22,20)-(22,27)
(22,20)-(22,33)
(22,28)-(22,30)
(22,31)-(22,33)
*)

(* type error slice
(16,7)-(19,31)
(16,7)-(19,31)
(18,44)-(18,47)
(18,44)-(18,49)
(18,48)-(18,49)
(18,56)-(19,24)
(18,56)-(19,24)
(18,56)-(19,31)
(18,56)-(19,31)
(19,14)-(19,24)
(19,30)-(19,31)
*)
