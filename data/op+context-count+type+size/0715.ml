
let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = (x + 1) :: a in
    let base = [] in
    let args = (l1, l2) in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a in
    let base = ([], []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,18)-(19,19)
(19,18)-(19,23)
(19,18)-(19,29)
(19,22)-(19,23)
(20,16)-(20,18)
(21,5)-(21,75)
(21,17)-(21,19)
(21,17)-(21,23)
*)

(* type error slice
(19,5)-(21,75)
(19,11)-(19,29)
(19,13)-(19,29)
(19,18)-(19,19)
(19,18)-(19,23)
(19,18)-(19,29)
(19,28)-(19,29)
(20,5)-(21,75)
(20,16)-(20,18)
(21,5)-(21,75)
(21,17)-(21,19)
(21,17)-(21,23)
(21,21)-(21,23)
(21,42)-(21,56)
(21,42)-(21,68)
(21,57)-(21,58)
(21,59)-(21,63)
(21,64)-(21,68)
*)
