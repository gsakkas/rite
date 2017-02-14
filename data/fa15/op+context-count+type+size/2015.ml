
let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then (((clone 0 (- n)) @ l1), l2) else (l1, ((clone 0 n) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (x1,x2) = x in ([0], (x1 + x2)) :: a in
    let base = [(0, 0)] in
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
      ((if ((a1 + x1) + x2) >= 10 then 1 else 0), (((a1 + x1) + x2) :: a2)) in
    let base = (0, [0]) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,16)-(14,56)
(14,35)-(14,51)
(14,35)-(14,56)
(14,36)-(14,39)
(14,37)-(14,38)
(14,41)-(14,50)
(14,42)-(14,44)
(14,55)-(14,56)
(15,4)-(17,51)
(15,15)-(15,23)
(15,16)-(15,22)
(15,20)-(15,21)
(16,4)-(17,51)
(17,4)-(17,51)
(18,2)-(18,12)
(18,13)-(18,34)
(18,14)-(18,17)
(18,18)-(18,33)
(18,19)-(18,26)
(18,27)-(18,29)
(18,30)-(18,32)
*)

(* type error slice
(14,4)-(17,51)
(14,10)-(14,56)
(14,35)-(14,51)
(14,35)-(14,56)
(14,35)-(14,56)
(14,36)-(14,39)
(14,55)-(14,56)
(15,4)-(17,51)
(15,15)-(15,23)
(15,15)-(15,23)
(15,16)-(15,22)
(15,17)-(15,18)
(17,18)-(17,32)
(17,18)-(17,44)
(17,33)-(17,34)
(17,35)-(17,39)
*)
