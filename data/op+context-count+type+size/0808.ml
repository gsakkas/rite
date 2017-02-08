
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
(14,7)-(21,74)
(14,13)-(14,14)
(16,11)-(17,55)
(16,29)-(16,30)
(17,12)-(17,13)
(17,12)-(17,55)
(17,16)-(17,55)
(17,19)-(17,24)
(17,19)-(17,28)
(17,27)-(17,28)
(17,34)-(17,39)
(17,34)-(17,46)
(17,43)-(17,46)
(17,52)-(17,55)
(19,11)-(21,74)
(20,11)-(21,74)
(20,25)-(20,32)
(20,25)-(20,35)
(20,25)-(20,60)
(20,33)-(20,35)
(20,40)-(20,47)
(20,40)-(20,50)
(20,48)-(20,50)
(20,55)-(20,60)
(22,5)-(24,52)
(23,5)-(24,52)
(24,5)-(24,52)
(25,3)-(25,33)
*)

(* type error slice
(2,44)-(2,45)
(2,44)-(2,64)
(2,44)-(2,64)
(2,50)-(2,55)
(2,50)-(2,64)
(2,56)-(2,57)
(4,4)-(6,55)
(4,13)-(6,51)
(4,16)-(6,51)
(5,3)-(6,51)
(6,6)-(6,11)
(6,6)-(6,18)
(6,6)-(6,51)
(6,12)-(6,13)
(6,29)-(6,34)
(6,29)-(6,44)
(6,29)-(6,51)
(6,47)-(6,48)
(12,3)-(25,33)
(12,12)-(24,52)
(13,5)-(24,52)
(13,11)-(21,74)
(13,13)-(21,74)
(14,7)-(21,74)
(14,13)-(14,14)
(20,40)-(20,47)
(20,40)-(20,50)
(20,48)-(20,50)
(23,5)-(24,52)
(23,16)-(23,28)
(23,16)-(23,34)
(23,32)-(23,34)
(24,19)-(24,33)
(24,19)-(24,45)
(24,34)-(24,35)
(24,41)-(24,45)
(25,15)-(25,18)
(25,15)-(25,33)
(25,20)-(25,27)
(25,20)-(25,33)
*)
