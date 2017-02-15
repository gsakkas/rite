
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
      | (a,b) ->
          if (((fst x) + (snd x)) + a) > 9
          then (1, ((((fst x) + (snd x)) + a) mod 10))
          else (0, ((((fst x) + (snd x)) + a) mod 10))
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
(18,6)-(26,48)
(20,36)-(20,37)
(21,19)-(21,53)
(21,43)-(21,44)
(22,15)-(22,54)
(22,19)-(22,53)
(22,43)-(22,44)
(22,50)-(22,52)
(24,10)-(26,48)
(24,13)-(24,32)
(24,13)-(24,36)
(24,14)-(24,21)
(24,15)-(24,18)
(24,19)-(24,20)
(24,24)-(24,31)
(24,25)-(24,28)
(24,29)-(24,30)
(24,35)-(24,36)
(25,15)-(25,48)
(25,16)-(25,17)
(25,19)-(25,47)
(25,20)-(25,39)
(25,20)-(25,46)
(25,21)-(25,28)
(25,22)-(25,25)
(25,26)-(25,27)
(25,31)-(25,38)
(25,32)-(25,35)
(25,36)-(25,37)
(26,15)-(26,48)
(26,19)-(26,47)
(26,20)-(26,39)
(26,20)-(26,46)
(26,21)-(26,28)
(26,22)-(26,25)
(26,26)-(26,27)
(26,31)-(26,38)
(26,44)-(26,46)
(27,4)-(29,51)
*)

(* type error slice
(17,4)-(29,51)
(17,10)-(26,48)
(17,12)-(26,48)
(18,6)-(26,48)
(18,6)-(26,48)
(20,10)-(22,54)
(21,15)-(21,54)
(21,19)-(21,53)
(24,10)-(26,48)
(25,15)-(25,48)
(25,19)-(25,47)
(27,4)-(29,51)
(27,15)-(27,22)
(27,19)-(27,21)
(29,18)-(29,32)
(29,18)-(29,44)
(29,33)-(29,34)
(29,35)-(29,39)
*)
