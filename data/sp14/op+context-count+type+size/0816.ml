
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "" in
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
(13,16)-(13,24)
(13,16)-(13,27)
(13,25)-(13,27)
(14,4)-(15,74)
(14,15)-(14,21)
(14,16)-(14,17)
(14,19)-(14,20)
(15,4)-(15,74)
(15,15)-(15,23)
(15,16)-(15,18)
(15,20)-(15,22)
(15,27)-(15,74)
(15,41)-(15,55)
(15,41)-(15,67)
(15,56)-(15,57)
(15,58)-(15,62)
(15,63)-(15,67)
(15,71)-(15,74)
(16,2)-(16,12)
(16,2)-(16,34)
(16,13)-(16,34)
(16,14)-(16,17)
(16,18)-(16,33)
(16,19)-(16,26)
(16,27)-(16,29)
(16,30)-(16,32)
*)

(* type error slice
(15,4)-(15,74)
(15,15)-(15,23)
(15,41)-(15,55)
(15,41)-(15,67)
(15,63)-(15,67)
*)
