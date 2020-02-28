
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (list1,list2) ->
          (match x with
           | (h1,h2) -> (((h1 + h2) / 10), (((h1 + h2) mod 10) :: list2))) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (list1,list2) ->
          (match x with
           | (h1,h2) ->
               ((((h1 + h2) / 10) :: list1), (((h1 + h2) mod 10) :: list2))) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,26)-(18,42)
((h1 + h2) / 10) :: list1
AppG [BopG EmptyG EmptyG,VarG]

*)

(* type error slice
(14,5)-(21,52)
(14,11)-(18,75)
(14,13)-(18,75)
(15,7)-(18,75)
(17,11)-(18,75)
(18,25)-(18,74)
(18,26)-(18,42)
(19,5)-(21,52)
(19,16)-(19,24)
(19,17)-(19,19)
(21,19)-(21,33)
(21,19)-(21,45)
(21,34)-(21,35)
(21,36)-(21,40)
*)
