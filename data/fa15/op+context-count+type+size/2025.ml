
let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then (((clone 0 (- n)) @ l1), l2) else (l1, ((clone 0 n) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if ((a1 + x1) + x2) >= 10
      then (1, (a2 :: (((a1 + x1) + x2) - 10)))
      else (0, (a2 :: ((a1 + x1) + x2))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then (((clone 0 (- n)) @ l1), l2) else (l1, ((clone 0 n) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if ((a1 + x1) + x2) >= 10
      then (1, (a2 @ [((a1 + x1) + x2) - 10]))
      else (0, (a2 @ [(a1 + x1) + x2])) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,17)-(18,19)
(18,17)-(18,45)
(18,26)-(18,45)
(19,17)-(19,19)
(19,17)-(19,38)
(19,25)-(19,38)
(23,20)-(23,27)
(23,28)-(23,30)
(23,31)-(23,33)
*)

(* type error slice
(14,5)-(22,52)
(14,11)-(19,38)
(14,13)-(19,38)
(15,7)-(19,38)
(16,7)-(19,38)
(16,7)-(19,38)
(16,21)-(16,22)
(17,7)-(19,38)
(18,13)-(18,45)
(18,17)-(18,19)
(18,17)-(18,45)
(18,17)-(18,45)
(18,17)-(18,45)
(18,26)-(18,45)
(19,17)-(19,38)
(19,25)-(19,38)
(22,19)-(22,33)
(22,19)-(22,45)
(22,34)-(22,35)
*)
