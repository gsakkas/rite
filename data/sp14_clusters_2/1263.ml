
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
(23,27)-(23,36)
[nextCarry]
ListG VarG Nothing

(24,29)-(24,38)
[nextCarry]
ListG VarG Nothing

*)
