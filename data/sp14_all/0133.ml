
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
      | (l1',l2') ->
          let addit = (l1' + l2') + carry in
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
(15,7)-(19,76)
let (l1' , l2') = x in
let addit =
  (l1' + l2') + carry in
(if addit > 10
 then addit mod 10
 else 0 , (addit / 10) :: num)
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG]),VarG)]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(2,44)-(2,45)
(2,44)-(2,66)
(2,49)-(2,66)
(2,50)-(2,55)
(2,56)-(2,57)
(4,4)-(6,55)
(4,13)-(6,53)
(4,16)-(6,53)
(5,3)-(6,53)
(6,3)-(6,53)
(6,5)-(6,19)
(6,6)-(6,11)
(6,12)-(6,13)
(6,27)-(6,52)
(6,28)-(6,46)
(6,29)-(6,34)
(6,47)-(6,48)
(12,3)-(23,35)
(12,12)-(22,52)
(13,5)-(22,52)
(13,11)-(19,76)
(13,13)-(19,76)
(15,7)-(19,76)
(15,13)-(15,14)
(18,23)-(18,34)
(18,24)-(18,27)
(21,5)-(22,52)
(21,16)-(21,28)
(21,16)-(21,34)
(21,32)-(21,34)
(22,19)-(22,33)
(22,19)-(22,45)
(22,34)-(22,35)
(22,41)-(22,45)
(23,14)-(23,35)
(23,15)-(23,18)
(23,19)-(23,34)
(23,20)-(23,27)
*)
