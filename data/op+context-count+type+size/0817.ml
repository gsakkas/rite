
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
(13,17)-(13,25)
(13,17)-(13,28)
(13,26)-(13,28)
(14,17)-(14,18)
(14,17)-(14,21)
(14,20)-(14,21)
(15,5)-(15,75)
(15,17)-(15,19)
(15,21)-(15,23)
(15,28)-(15,75)
(15,42)-(15,56)
(15,42)-(15,68)
(15,57)-(15,58)
(15,59)-(15,63)
(15,64)-(15,68)
(15,72)-(15,75)
(16,3)-(16,13)
(16,15)-(16,18)
(16,15)-(16,33)
(16,20)-(16,27)
(16,20)-(16,33)
(16,28)-(16,30)
(16,31)-(16,33)
*)

(* type error slice
(13,5)-(15,75)
(13,11)-(13,28)
(13,13)-(13,28)
(14,5)-(15,75)
(14,17)-(14,18)
(14,17)-(14,21)
(14,20)-(14,21)
(15,5)-(15,75)
(15,17)-(15,19)
(15,17)-(15,23)
(15,21)-(15,23)
(15,42)-(15,56)
(15,42)-(15,68)
(15,57)-(15,58)
(15,59)-(15,63)
(15,64)-(15,68)
*)
