
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
      then (1, ((((a1 + x1) + x2) - 10) :: a2))
      else (0, (((a1 + x1) + x2) :: a2)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0
  then [0]
  else if i = 1 then l else (mulByDigit (i - 1) l) + (bigAdd l l);;


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
      then (1, ((((a1 + x1) + x2) - 10) :: a2))
      else (0, (((a1 + x1) + x2) :: a2)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0 then [0] else if i = 1 then l else bigAdd (mulByDigit (i - 1) l) l;;

*)

(* changed spans
(28,28)-(28,65)
(28,29)-(28,39)
(28,53)-(28,65)
(28,54)-(28,60)
(28,63)-(28,64)
*)

(* type error slice
(10,2)-(10,69)
(10,2)-(10,69)
(10,8)-(10,9)
(10,36)-(10,69)
(10,36)-(10,69)
(10,50)-(10,60)
(10,50)-(10,62)
(10,68)-(10,69)
(12,3)-(23,36)
(12,11)-(23,34)
(12,14)-(23,34)
(13,2)-(23,34)
(23,2)-(23,12)
(23,2)-(23,34)
(25,3)-(28,67)
(25,19)-(28,65)
(25,21)-(28,65)
(26,2)-(28,65)
(27,7)-(27,10)
(28,28)-(28,50)
(28,28)-(28,65)
(28,28)-(28,65)
(28,29)-(28,39)
(28,53)-(28,65)
(28,54)-(28,60)
*)
