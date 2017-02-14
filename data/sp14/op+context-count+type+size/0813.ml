
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
    let args = [(l1, l2)] in let (_,res) = List.fold_left f base args in res in
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
(13,17)-(13,25)
(13,17)-(13,28)
(13,26)-(13,28)
(14,5)-(15,77)
(14,17)-(14,18)
(14,17)-(14,21)
(14,20)-(14,21)
(15,5)-(15,77)
(15,16)-(15,26)
(15,18)-(15,20)
(15,18)-(15,24)
(15,22)-(15,24)
(15,30)-(15,77)
(15,44)-(15,58)
(15,44)-(15,70)
(15,59)-(15,60)
(15,61)-(15,65)
(15,66)-(15,70)
(15,74)-(15,77)
(16,3)-(16,13)
(16,3)-(16,33)
(16,15)-(16,18)
(16,15)-(16,33)
(16,20)-(16,27)
(16,20)-(16,33)
(16,28)-(16,30)
(16,31)-(16,33)
*)

(* type error slice
(9,3)-(9,69)
(9,3)-(9,69)
(9,50)-(9,60)
(9,50)-(9,62)
(9,61)-(9,62)
(12,3)-(16,33)
(12,12)-(15,77)
(13,5)-(15,77)
(14,5)-(15,77)
(14,5)-(15,77)
(14,17)-(14,21)
(14,20)-(14,21)
(15,5)-(15,77)
(15,30)-(15,77)
(15,30)-(15,77)
(15,44)-(15,58)
(15,44)-(15,70)
(15,61)-(15,65)
(15,74)-(15,77)
(16,3)-(16,13)
(16,3)-(16,33)
(16,15)-(16,18)
(16,15)-(16,33)
*)
