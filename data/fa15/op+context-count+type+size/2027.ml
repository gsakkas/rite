
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
  if i = 0 then 0 else if i = 1 then l else mulByDigit (i - 1) (bigAdd l l);;


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
  if i = 0 then [0] else if i = 1 then l else mulByDigit (i - 1) (bigAdd l l);;

*)

(* changed spans
(26,16)-(26,17)
*)

(* type error slice
(5,3)-(7,76)
(5,12)-(7,74)
(7,17)-(7,39)
(7,34)-(7,35)
(7,36)-(7,38)
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
(23,18)-(23,33)
(23,19)-(23,26)
(23,27)-(23,29)
(25,3)-(26,77)
(25,19)-(26,75)
(25,21)-(26,75)
(26,2)-(26,75)
(26,2)-(26,75)
(26,16)-(26,17)
(26,23)-(26,75)
(26,23)-(26,75)
(26,37)-(26,38)
(26,44)-(26,54)
(26,44)-(26,75)
(26,63)-(26,75)
(26,64)-(26,70)
(26,71)-(26,72)
*)
