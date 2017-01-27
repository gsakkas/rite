
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (addC,resOfAdd) = a in
      let (i1,i2) = x in
      let result = (i1 + i2) + addC in
      let nextCarry = result / 10 in
      match resOfAdd with
      | [] -> (nextCarry, (nextCarry @ ([result mod 10] @ [])))
      | h::t -> (nextCarry, (nextCarry @ ([result mod 10] @ t))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (addC,resOfAdd) = a in
      let (i1,i2) = x in
      let result = (i1 + i2) + addC in
      let nextCarry = result / 10 in
      match resOfAdd with
      | [] -> (nextCarry, ([nextCarry] @ ([result mod 10] @ [])))
      | h::t -> (nextCarry, ([nextCarry] @ ([result mod 10] @ t))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,28)-(23,37)
(24,30)-(24,39)
*)

(* type error slice
(21,7)-(24,62)
(21,23)-(21,34)
(22,7)-(24,62)
(23,28)-(23,37)
(23,28)-(23,61)
(23,38)-(23,39)
(23,41)-(23,56)
(23,41)-(23,61)
(23,42)-(23,55)
(23,57)-(23,58)
(23,59)-(23,61)
(24,30)-(24,39)
(24,30)-(24,62)
(24,40)-(24,41)
(24,43)-(24,58)
(24,43)-(24,62)
(24,44)-(24,57)
(24,59)-(24,60)
(24,61)-(24,62)
*)
