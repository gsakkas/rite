
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
      match x with
      | ([],[]) -> (0, (if carry > 0 then carry :: num else num))
      | (l1,l2) ->
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
(15,6)-(19,75)
(16,19)-(16,65)
(16,20)-(16,21)
(16,23)-(16,64)
(16,27)-(16,32)
(16,27)-(16,36)
(16,35)-(16,36)
(16,42)-(16,47)
(16,42)-(16,54)
(16,51)-(16,54)
(16,60)-(16,63)
(18,10)-(19,75)
(18,23)-(18,35)
(18,24)-(18,31)
(18,32)-(18,34)
(18,38)-(18,50)
(18,39)-(18,46)
(18,47)-(18,49)
(18,54)-(18,59)
(20,4)-(22,51)
(21,4)-(22,51)
(22,4)-(22,51)
(22,48)-(22,51)
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
(12,2)-(23,34)
(12,11)-(22,51)
(13,4)-(22,51)
(13,10)-(19,75)
(13,12)-(19,75)
(15,6)-(19,75)
(15,12)-(15,13)
(18,38)-(18,50)
(18,39)-(18,46)
(18,47)-(18,49)
(21,4)-(22,51)
(21,15)-(21,27)
(21,15)-(21,33)
(21,31)-(21,33)
(22,18)-(22,32)
(22,18)-(22,44)
(22,33)-(22,34)
(22,40)-(22,44)
(23,13)-(23,34)
(23,14)-(23,17)
(23,18)-(23,33)
(23,19)-(23,26)
*)
