
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
          else (0, (((((fst x) + (snd x)) + c) mod 10) :: t))
      | _ ->
          if ((fst x) + (snd x)) > 9
          then (1, (((fst x) + (snd x)) mod 10))
          else (0, (((fst x) + (snd x)) mod 10)) in
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
          else (0, (((((fst x) + (snd x)) + c) mod 10) :: t))
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
(25,19)-(25,47)
[(fst x + snd x) mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(26,19)-(26,47)
[(fst x + snd x) mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
