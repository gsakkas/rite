
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
          ((((fst x) + (snd x)) + hd) mod 10) :: tl
      | _ -> (((fst x) + (snd x)) / 10) :: (((fst x) + (snd x)) mod 10) :: a in
    let base = [] in
    let args = List.combine l1 l2 in
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
      | hd::tl -> ((((fst x) + (snd x)) + hd) / 10) ::
          ((((fst x) + (snd x)) + hd) mod 10) :: tl
      | _ -> (((fst x) + (snd x)) / 10) :: (((fst x) + (snd x)) mod 10) :: a in
    let base = [] in
    let args = List.combine l1 l2 in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(24,4)-(24,51)
(24,48)-(24,51)
*)

(* type error slice
(17,4)-(24,51)
(17,10)-(21,76)
(21,43)-(21,76)
(21,75)-(21,76)
(24,4)-(24,51)
(24,18)-(24,32)
(24,18)-(24,44)
(24,33)-(24,34)
*)
