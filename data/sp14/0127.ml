
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
(14,7)-(21,74)
let (carry , num) = a in
let (l1' , l2') = x in
let addit =
  (l1' + l2') + carry in
(if addit > 10
 then addit mod 10
 else 0 , (addit / 10) :: num)
LetG NonRec [(TuplePatG (fromList [EmptyPatG]),VarG)] (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

(22,20)-(22,21)
[]
ListG []

*)

(* type error slice
(13,5)-(24,52)
(13,11)-(21,74)
(14,7)-(21,74)
(14,13)-(14,14)
(16,11)-(17,57)
(16,29)-(16,30)
(17,34)-(17,46)
(17,43)-(17,46)
(21,54)-(21,73)
(21,71)-(21,72)
(22,5)-(24,52)
(22,16)-(22,22)
(22,20)-(22,21)
(24,19)-(24,33)
(24,19)-(24,45)
(24,34)-(24,35)
(24,36)-(24,40)
*)
