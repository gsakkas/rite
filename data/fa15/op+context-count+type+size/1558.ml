
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
      match x with
      | h::t ->
          (match a with
           | hd::tl -> ((((fst h) + (snd h)) + hd) / 10) ::
               ((((fst h) + (snd h)) + hd) mod 10) :: tl) in
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
      match a with
      | hd::tl -> ((((fst x) + (snd x)) + hd) / 10) ::
          ((((fst x) + (snd x)) + hd) mod 10) :: tl in
    let base = [] in
    let args = List.combine l1 l2 in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,6)-(22,57)
(18,12)-(18,13)
(21,31)-(21,32)
(21,41)-(21,42)
(22,23)-(22,24)
(22,33)-(22,34)
(23,4)-(24,74)
(24,4)-(24,74)
(24,15)-(24,23)
(24,15)-(24,44)
(25,19)-(25,26)
*)

(* type error slice
(17,4)-(24,74)
(17,10)-(22,57)
(17,12)-(22,57)
(18,6)-(22,57)
(18,6)-(22,57)
(18,12)-(18,13)
(24,4)-(24,74)
(24,15)-(24,23)
(24,15)-(24,44)
(24,24)-(24,44)
(24,25)-(24,37)
(24,48)-(24,62)
(24,48)-(24,74)
(24,63)-(24,64)
(24,70)-(24,74)
*)
