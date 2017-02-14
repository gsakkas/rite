
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | ([],[]) ->
          let (carry,num) = x in
          (0, (if carry > 0 then carry :: num else num))
      | (l1,l2) ->
          let (carry,num) = x in
          let addit = ((List.hd l1) + (List.hd l2)) + carry in
          ((if addit > 10 then addit mod 10 else 0), ((addit / 10) :: x)) in
    let base = (0, 0) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
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
      ((if addit > 10 then addit mod 10 else 0), ((addit / 10) :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,6)-(21,73)
(16,10)-(17,56)
(16,28)-(16,29)
(17,10)-(17,56)
(17,11)-(17,12)
(17,14)-(17,55)
(17,18)-(17,23)
(17,18)-(17,27)
(17,26)-(17,27)
(17,33)-(17,38)
(17,33)-(17,45)
(17,42)-(17,45)
(17,51)-(17,54)
(19,10)-(21,73)
(20,10)-(21,73)
(20,23)-(20,35)
(20,24)-(20,31)
(20,32)-(20,34)
(20,38)-(20,50)
(20,39)-(20,46)
(20,47)-(20,49)
(20,54)-(20,59)
(21,70)-(21,71)
(22,4)-(24,51)
(22,15)-(22,21)
(22,19)-(22,20)
(23,4)-(24,51)
(23,15)-(23,33)
(24,4)-(24,51)
(25,2)-(25,34)
*)

(* type error slice
(13,4)-(24,51)
(13,10)-(21,73)
(13,12)-(21,73)
(14,6)-(21,73)
(14,6)-(21,73)
(14,12)-(14,13)
(16,10)-(17,56)
(16,10)-(17,56)
(16,28)-(16,29)
(17,10)-(17,56)
(17,11)-(17,12)
(20,23)-(20,35)
(20,24)-(20,31)
(20,32)-(20,34)
(21,53)-(21,72)
(21,70)-(21,71)
(24,18)-(24,32)
(24,18)-(24,44)
(24,33)-(24,34)
*)
