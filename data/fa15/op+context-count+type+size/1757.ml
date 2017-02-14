
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
      match a with
      | (c,d) ->
          if (((fst x) + (snd x)) + c) > 9
          then (1, ((((fst x) + (snd x)) + c) mod 10))
          else (0, ((((fst x) + (snd x)) + c) mod 10))
      | _ ->
          if ((fst x) + (snd x)) > 9
          then (1, [((fst x) + (snd x)) mod 10])
          else (0, [((fst x) + (snd x)) mod 10]) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
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
      match a with
      | (c,h::t) ->
          if (((fst x) + (snd x)) + c) > 9
          then (1, (((((fst x) + (snd x)) + c) mod 10) :: t))
          else (0, (((((fst x) + (snd x)) + c) mod 10) :: t)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,7)-(26,48)
(21,24)-(21,53)
(22,17)-(22,53)
(22,24)-(22,53)
(24,11)-(26,48)
(24,16)-(24,19)
(24,16)-(24,21)
(24,16)-(24,31)
(24,16)-(24,37)
(24,20)-(24,21)
(24,26)-(24,29)
(24,26)-(24,31)
(24,30)-(24,31)
(24,36)-(24,37)
(25,17)-(25,18)
(25,17)-(25,48)
(25,20)-(25,48)
(25,23)-(25,26)
(25,23)-(25,28)
(25,23)-(25,38)
(25,23)-(25,47)
(25,27)-(25,28)
(25,33)-(25,36)
(25,33)-(25,38)
(25,37)-(25,38)
(25,45)-(25,47)
(26,17)-(26,48)
(26,20)-(26,48)
(26,23)-(26,26)
(26,23)-(26,28)
(26,23)-(26,38)
(26,23)-(26,47)
(26,27)-(26,28)
(26,33)-(26,38)
(26,45)-(26,47)
(27,5)-(29,52)
*)

(* type error slice
(17,5)-(29,52)
(17,11)-(26,48)
(17,13)-(26,48)
(18,7)-(26,48)
(18,7)-(26,48)
(20,11)-(22,53)
(21,17)-(21,53)
(21,24)-(21,53)
(24,11)-(26,48)
(25,17)-(25,48)
(25,20)-(25,48)
(27,5)-(29,52)
(27,17)-(27,22)
(27,20)-(27,22)
(29,19)-(29,33)
(29,19)-(29,45)
(29,34)-(29,35)
(29,36)-(29,40)
*)
