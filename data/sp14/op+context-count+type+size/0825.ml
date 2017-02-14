
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,num) = a in
      let (l1',l2') = x in
      let addit = (l1' + l2') + carry in
      ((if addit >= 10 then 1 else 0), (num @ [addit mod 10])) in
    let base = (0, []) in
    let args = List.combine [0; l1] [0; l2] in
    let (car,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,num) = a in
      let (l1',l2') = x in
      let addit = (l1' + l2') + carry in
      ((if addit >= 10 then 1 else 0), (num @ [addit mod 10])) in
    let base = (0, []) in
    let args = List.combine ([0] @ l1) ([0] @ l2) in
    let (car,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,28)-(19,35)
(19,29)-(19,30)
(19,36)-(19,43)
(19,37)-(19,38)
(21,19)-(21,26)
(21,27)-(21,29)
(21,30)-(21,32)
*)

(* type error slice
(4,3)-(6,54)
(4,12)-(6,52)
(4,15)-(6,52)
(5,2)-(6,52)
(6,2)-(6,52)
(6,26)-(6,51)
(6,46)-(6,47)
(12,2)-(21,34)
(12,11)-(20,53)
(19,36)-(19,43)
(19,36)-(19,43)
(19,37)-(19,38)
(19,40)-(19,42)
(21,13)-(21,34)
(21,14)-(21,17)
(21,18)-(21,33)
(21,19)-(21,26)
*)
