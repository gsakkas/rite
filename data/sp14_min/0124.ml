
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
          (match x with
           | (carry,num) ->
               let addit = ((List.hd l1) + (List.hd l2)) + carry in
               if addit > 10 then addit mod 10 else (0, ((addit / 10) :: x))) in
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
(14,7)-(22,78)
let (carry , num) = a in
let (l1' , l2') = x in
let addit =
  (l1' + l2') + carry in
(if addit > 10
 then addit mod 10
 else 0 , (addit / 10) :: num)
LetG NonRec [(TuplePatG (fromList [EmptyPatG]),VarG)] (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

(23,20)-(23,21)
[]
ListG []

*)

(* type error slice
(13,5)-(25,52)
(13,11)-(22,78)
(13,13)-(22,78)
(14,7)-(22,78)
(14,13)-(14,14)
(16,11)-(17,57)
(16,29)-(16,30)
(17,11)-(17,57)
(17,12)-(17,13)
(21,29)-(21,41)
(21,30)-(21,37)
(21,38)-(21,40)
(22,16)-(22,77)
(22,35)-(22,47)
(22,53)-(22,77)
(22,57)-(22,76)
(22,74)-(22,75)
(25,19)-(25,33)
(25,19)-(25,45)
(25,34)-(25,35)
*)
