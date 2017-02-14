
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
          else (0, ((((fst x) + (snd x)) + c) mod 10)) in
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
(18,6)-(22,54)
(21,19)-(21,53)
(22,15)-(22,54)
(22,19)-(22,53)
(23,4)-(25,51)
(26,19)-(26,26)
(26,27)-(26,29)
(26,30)-(26,32)
*)

(* type error slice
(17,4)-(25,51)
(17,10)-(22,54)
(17,12)-(22,54)
(18,6)-(22,54)
(20,10)-(22,54)
(21,15)-(21,54)
(21,19)-(21,53)
(23,4)-(25,51)
(23,15)-(23,22)
(23,19)-(23,21)
(25,18)-(25,32)
(25,18)-(25,44)
(25,33)-(25,34)
(25,35)-(25,39)
*)
