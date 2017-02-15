
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | ([],[]) ->
          let (carry,num) = a in
          (0, (if carry > 0 then carry :: num else num))
      | (l1,l2) ->
          let (carry,num) = a in
          let addit = ((List.hd l1) + (List.hd l2)) + carry in
          ((if addit > 10 then addit mod 10 else 0), ((addit / 10) :: num)) in
    let base = (0, []) in
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
(14,6)-(21,75)
(14,12)-(14,13)
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
(19,10)-(21,75)
(20,10)-(21,75)
(20,22)-(20,59)
(20,23)-(20,35)
(20,24)-(20,31)
(20,32)-(20,34)
(20,38)-(20,50)
(20,39)-(20,46)
(20,47)-(20,49)
(20,54)-(20,59)
(22,4)-(24,51)
(23,4)-(24,51)
(24,4)-(24,51)
(24,18)-(24,32)
(24,18)-(24,44)
*)

(* type error slice
(2,43)-(2,44)
(2,43)-(2,65)
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(4,3)-(6,54)
(4,12)-(6,52)
(4,15)-(6,52)
(5,2)-(6,52)
(6,2)-(6,52)
(6,4)-(6,18)
(6,5)-(6,10)
(6,11)-(6,12)
(6,26)-(6,51)
(6,27)-(6,45)
(6,28)-(6,33)
(6,46)-(6,47)
(12,2)-(25,34)
(12,11)-(24,51)
(13,4)-(24,51)
(13,10)-(21,75)
(13,12)-(21,75)
(14,6)-(21,75)
(14,12)-(14,13)
(20,38)-(20,50)
(20,39)-(20,46)
(20,47)-(20,49)
(23,4)-(24,51)
(23,15)-(23,27)
(23,15)-(23,33)
(23,31)-(23,33)
(24,18)-(24,32)
(24,18)-(24,44)
(24,33)-(24,34)
(24,40)-(24,44)
(25,13)-(25,34)
(25,14)-(25,17)
(25,18)-(25,33)
(25,19)-(25,26)
*)
