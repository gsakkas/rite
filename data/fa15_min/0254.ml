
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let addition (x,y) = x + y;;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then (((clone 0 ((-1) * diff)) @ l1), l2)
  else if diff > 0 then (l1, ((clone 0 diff) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | hd::tl -> if hd = 0 then removeZero tl else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (m,n) = x in
      let (y,z) = a in
      ((((addition (m, n)) + y) / 10),
        ([((addition (m, n)) + y) mod 10] @ z)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (cin,res) = List.fold_left f base args in [cin] @ res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [] | 1 -> l | _ -> bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 = mulByDigit (bigAdd l1 l2);;


(* fix

let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let addition (x,y) = x + y;;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then (((clone 0 ((-1) * diff)) @ l1), l2)
  else if diff > 0 then (l1, ((clone 0 diff) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | hd::tl -> if hd = 0 then removeZero tl else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (m,n) = x in
      let (y,z) = a in
      ((((addition (m, n)) + y) / 10),
        ([((addition (m, n)) + y) mod 10] @ z)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (cin,res) = List.fold_left f base args in [cin] @ res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [] | 1 -> l | _ -> bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 = mulByDigit 9 (bigAdd l1 l2);;

*)

(* changed spans
(33,20)-(33,45)
mulByDigit 9 (bigAdd l1 l2)
AppG [LitG,AppG [EmptyG,EmptyG]]

*)

(* type error slice
(16,3)-(16,74)
(16,9)-(16,10)
(16,39)-(16,74)
(16,54)-(16,64)
(16,54)-(16,67)
(16,73)-(16,74)
(18,4)-(28,37)
(18,12)-(28,35)
(18,15)-(28,35)
(19,3)-(28,35)
(28,3)-(28,13)
(28,3)-(28,35)
(31,51)-(31,73)
(31,52)-(31,62)
(31,63)-(31,70)
(33,20)-(33,30)
(33,20)-(33,45)
(33,31)-(33,45)
(33,32)-(33,38)
*)
