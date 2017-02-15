
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
    let f a x = let (h::t,b) = a in a = (l1, []) in
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
    let f a x = let (h::t,b) = a in (t, ((x + h) :: b)) in
    let base = ((List.rev l1), []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,36)-(19,37)
(19,36)-(19,48)
(19,41)-(19,43)
(19,45)-(19,47)
(20,4)-(21,68)
*)

(* type error slice
(19,4)-(21,68)
(19,10)-(19,48)
(19,12)-(19,48)
(19,16)-(19,48)
(19,36)-(19,37)
(19,36)-(19,48)
(19,36)-(19,48)
(19,36)-(19,48)
(19,40)-(19,48)
(21,35)-(21,49)
(21,35)-(21,61)
(21,50)-(21,51)
*)
