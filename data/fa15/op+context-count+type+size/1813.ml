
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
(18,15)-(18,46)
(18,16)-(18,18)
(18,22)-(18,45)
(19,15)-(19,39)
(19,16)-(19,18)
(19,22)-(19,38)
(23,19)-(23,26)
(23,27)-(23,29)
(23,30)-(23,32)
*)

(* type error slice
(14,4)-(22,51)
(14,10)-(19,40)
(14,12)-(19,40)
(15,6)-(19,40)
(16,6)-(19,40)
(16,6)-(19,40)
(16,20)-(16,21)
(17,6)-(19,40)
(18,11)-(18,47)
(18,15)-(18,46)
(18,15)-(18,46)
(18,15)-(18,46)
(18,16)-(18,18)
(18,22)-(18,45)
(19,15)-(19,39)
(19,22)-(19,38)
(22,18)-(22,32)
(22,18)-(22,44)
(22,33)-(22,34)
*)
