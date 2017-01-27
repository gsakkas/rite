
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
    let f a x = let (h::t,_) = a in [0; 0] :: a in
    let base = ((List.rev l1), []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
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
    let f a x = let (h::t,_) = a in ([], []) in
    let base = ((List.rev l1), []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,37)-(19,43)
(19,37)-(19,48)
(19,38)-(19,39)
(19,41)-(19,42)
(19,47)-(19,48)
(20,5)-(21,69)
*)

(* type error slice
(19,5)-(21,69)
(19,11)-(19,48)
(19,13)-(19,48)
(19,17)-(19,48)
(19,32)-(19,33)
(19,37)-(19,43)
(19,37)-(19,48)
(19,38)-(19,39)
(19,47)-(19,48)
(20,5)-(21,69)
(20,18)-(20,26)
(20,18)-(20,29)
(20,18)-(20,34)
(20,27)-(20,29)
(20,32)-(20,34)
(21,5)-(21,69)
(21,16)-(21,18)
(21,36)-(21,50)
(21,36)-(21,62)
(21,51)-(21,52)
(21,53)-(21,57)
(21,58)-(21,62)
*)
