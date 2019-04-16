
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = ((x / 10), 1) in
    let base = (0, 0) in
    let args = (l1, l2) in let (_,res) = List.fold_left f base args in res in
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
(13,17)-(13,30)
let (carry , num) = a in
let (l1' , l2') = x in
let addit =
  (l1' + l2') + carry in
(if addit > 10
 then addit mod 10
 else 0 , (addit / 10) :: num)
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG]),VarG)]) (LetG NonRec (fromList [(TuplePatG (fromList [EmptyPatG]),EmptyG)]) EmptyG)

(14,20)-(14,21)
[]
ListG (fromList [])

(15,16)-(15,24)
List.combine l1 l2
AppG (fromList [VarG])

*)

(* type error slice
(15,5)-(15,75)
(15,16)-(15,24)
(15,42)-(15,56)
(15,42)-(15,68)
(15,64)-(15,68)
*)
