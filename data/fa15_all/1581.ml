
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | h::t -> if h = 0 then removeZero t else l | _ -> [];;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + sum) / 10) :: ((h + sum) mod 10) :: t
      | _ -> [sum / 10; sum mod 10] in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | h::t -> if h = 0 then removeZero t else l | _ -> [];;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + sum) / 10) :: ((h + sum) mod 10) :: t
      | _ -> [sum / 10; sum mod 10] in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(22,16)-(22,23)
[]
ListG []

(24,5)-(24,52)
List.fold_left f base args
AppG [VarG,VarG,VarG]

*)

(* type error slice
(17,5)-(24,52)
(17,11)-(21,36)
(19,7)-(21,36)
(19,13)-(19,14)
(22,5)-(24,52)
(22,16)-(22,23)
(24,19)-(24,33)
(24,19)-(24,45)
(24,34)-(24,35)
(24,36)-(24,40)
*)
