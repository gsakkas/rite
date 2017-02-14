
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
      | h::t ->
          if (((fst x) + (snd x)) + h) > 9
          then (1, (((((fst x) + (snd x)) + h) mod 10) :: t))
          else (0, (((((fst x) + (snd x)) + h) mod 10) :: t))
      | _ ->
          if ((fst x) + (snd x)) > 9
          then (1, ((((fst x) + (snd x)) mod 10) :: a))
          else (0, ((((fst x) + (snd x)) mod 10) :: a)) in
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
      | (a,b) ->
          if (((fst x) + (snd x)) + a) > 9
          then (1, (((((fst x) + (snd x)) + a) mod 10) :: b))
          else (0, (((((fst x) + (snd x)) + a) mod 10) :: b))
      | _ ->
          if ((fst x) + (snd x)) > 9
          then (1, [((fst x) + (snd x)) mod 10])
          else (0, [((fst x) + (snd x)) mod 10]) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,7)-(26,54)
(20,37)-(20,38)
(21,45)-(21,46)
(21,59)-(21,60)
(22,45)-(22,46)
(22,59)-(22,60)
(25,24)-(25,54)
(25,53)-(25,54)
(26,24)-(26,54)
(26,53)-(26,54)
*)

(* type error slice
(17,5)-(29,52)
(17,11)-(26,54)
(17,13)-(26,54)
(18,7)-(26,54)
(20,11)-(22,60)
(21,17)-(21,60)
(25,24)-(25,54)
(25,53)-(25,54)
(29,19)-(29,33)
(29,19)-(29,45)
(29,34)-(29,35)
*)
