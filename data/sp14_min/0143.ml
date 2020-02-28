
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
(19,29)-(19,36)
[0] @ l1
AppG [ListG [EmptyG],VarG]

(19,37)-(19,44)
[0] @ l2
AppG [ListG [EmptyG],VarG]

*)

(* type error slice
(4,4)-(6,55)
(4,13)-(6,53)
(4,16)-(6,53)
(5,3)-(6,53)
(6,3)-(6,53)
(6,27)-(6,52)
(6,47)-(6,48)
(12,3)-(21,35)
(12,12)-(20,54)
(19,37)-(19,44)
(19,38)-(19,39)
(19,41)-(19,43)
(21,14)-(21,35)
(21,15)-(21,18)
(21,19)-(21,34)
(21,20)-(21,27)
*)
