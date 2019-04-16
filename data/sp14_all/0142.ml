
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
      if addit >= 10 then 1 else (0, (num @ [addit mod 10])) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
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
    let args = List.combine l1 l2 in
    let (car,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,7)-(17,61)
(if addit >= 10
 then 1
 else 0 , num @ [addit mod 10])
TupleG (fromList [AppG (fromList [EmptyG]),IteG EmptyG EmptyG EmptyG])

*)

(* type error slice
(17,7)-(17,61)
(17,27)-(17,28)
(17,34)-(17,61)
*)
