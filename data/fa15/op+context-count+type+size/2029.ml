
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
(26,17)-(26,18)
*)

(* type error slice
(5,4)-(7,77)
(5,13)-(7,73)
(7,20)-(7,39)
(7,35)-(7,36)
(7,37)-(7,39)
(10,3)-(10,70)
(10,3)-(10,70)
(10,9)-(10,10)
(10,37)-(10,70)
(10,37)-(10,70)
(10,51)-(10,61)
(10,51)-(10,63)
(10,69)-(10,70)
(12,4)-(23,37)
(12,12)-(23,33)
(12,15)-(23,33)
(13,3)-(23,33)
(23,3)-(23,13)
(23,3)-(23,33)
(23,20)-(23,27)
(23,20)-(23,33)
(23,28)-(23,30)
(25,4)-(26,78)
(25,20)-(26,75)
(25,22)-(26,75)
(26,3)-(26,75)
(26,3)-(26,75)
(26,17)-(26,18)
(26,24)-(26,75)
(26,24)-(26,75)
(26,38)-(26,39)
(26,45)-(26,55)
(26,45)-(26,75)
(26,65)-(26,71)
(26,65)-(26,75)
(26,72)-(26,73)
*)
