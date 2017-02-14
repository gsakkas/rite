
let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then (((clone 0 (- n)) @ l1), l2) else (l1, ((clone 0 n) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (x1,x2) = x in (x1 + x2) :: a in
    let base = [] in
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
(14,17)-(14,50)
(14,37)-(14,39)
(14,37)-(14,50)
(14,49)-(14,50)
(15,5)-(17,52)
(15,16)-(15,18)
(16,5)-(17,52)
(16,16)-(16,34)
(17,5)-(17,52)
(17,19)-(17,33)
(17,19)-(17,45)
(17,34)-(17,35)
(17,36)-(17,40)
(17,41)-(17,45)
(17,49)-(17,52)
(18,3)-(18,13)
(18,3)-(18,33)
(18,15)-(18,18)
(18,20)-(18,27)
(18,20)-(18,33)
(18,28)-(18,30)
(18,31)-(18,33)
*)

(* type error slice
(14,5)-(17,52)
(14,11)-(14,50)
(14,37)-(14,50)
(14,49)-(14,50)
(17,5)-(17,52)
(17,19)-(17,33)
(17,19)-(17,45)
(17,34)-(17,35)
*)
