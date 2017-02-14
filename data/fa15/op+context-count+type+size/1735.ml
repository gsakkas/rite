
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
          let sum = ((fst x) + (snd x)) + (fst h) in
          ((sum / 10), (sum mod 10)) :: t in
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
(2,16)-(8,17)
(4,7)-(4,14)
(4,7)-(4,27)
(4,15)-(4,24)
(4,16)-(4,17)
(4,21)-(4,23)
(4,25)-(4,27)
(7,9)-(7,16)
(7,9)-(7,29)
(7,20)-(7,29)
(7,21)-(7,22)
(7,26)-(7,28)
(8,9)-(8,17)
(14,2)-(22,34)
(15,4)-(21,74)
(16,6)-(19,41)
(16,12)-(16,13)
(18,10)-(19,41)
(18,20)-(18,49)
(18,42)-(18,49)
(18,43)-(18,46)
(18,47)-(18,48)
(19,10)-(19,36)
(19,10)-(19,41)
(19,12)-(19,15)
(19,18)-(19,20)
(19,23)-(19,35)
(19,24)-(19,27)
(19,40)-(19,41)
(20,4)-(21,74)
(20,15)-(20,17)
(21,4)-(21,74)
(21,15)-(21,23)
(21,15)-(21,44)
(21,24)-(21,44)
(21,25)-(21,37)
(21,38)-(21,40)
(21,41)-(21,43)
(21,48)-(21,62)
(21,48)-(21,74)
(21,63)-(21,64)
(21,65)-(21,69)
(21,70)-(21,74)
(22,2)-(22,12)
(22,2)-(22,34)
(22,13)-(22,34)
(22,14)-(22,17)
(22,18)-(22,33)
(22,19)-(22,26)
(22,27)-(22,29)
(22,30)-(22,32)
*)

(* type error slice
(11,2)-(11,69)
(11,2)-(11,69)
(11,39)-(11,40)
(11,39)-(11,44)
(11,39)-(11,44)
(11,43)-(11,44)
(11,50)-(11,60)
(11,50)-(11,62)
(11,61)-(11,62)
(14,2)-(22,34)
(14,11)-(21,74)
(15,4)-(21,74)
(15,4)-(21,74)
(15,10)-(19,41)
(16,6)-(19,41)
(16,6)-(19,41)
(16,12)-(16,13)
(18,42)-(18,49)
(18,43)-(18,46)
(18,47)-(18,48)
(20,4)-(21,74)
(21,4)-(21,74)
(21,48)-(21,62)
(21,48)-(21,74)
(21,63)-(21,64)
(22,2)-(22,12)
(22,2)-(22,34)
(22,13)-(22,34)
(22,14)-(22,17)
*)
