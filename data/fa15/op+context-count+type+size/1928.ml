
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len = (List.length l1) - (List.length l2) in
  if len <= 0
  then (((clone 0 ((-1) * len)) @ l1), l2)
  else (l1, ((clone 0 len) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | x::l' -> (match x with | 0 -> removeZero l' | _ -> x :: l');;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (o,r) = a in
      ((((x1 + x2) + o) / 10), ((((x1 + x2) + o) mod 10) :: r)) in
    let base = (0, []) in
    let args =
      List.rev (List.combine ((clone 0 1) :: l1) ((clone 0 1) :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len = (List.length l1) - (List.length l2) in
  if len <= 0
  then (((clone 0 ((-1) * len)) @ l1), l2)
  else (l1, ((clone 0 len) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | x::l' -> (match x with | 0 -> removeZero l' | _ -> x :: l');;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (o,r) = a in
      ((((x1 + x2) + o) / 10), ((((x1 + x2) + o) mod 10) :: r)) in
    let base = (0, []) in
    let args = List.rev ((0, 0) :: (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,17)-(23,29)
(23,17)-(23,68)
(23,32)-(23,37)
(23,32)-(23,41)
(23,40)-(23,41)
(23,46)-(23,48)
(23,52)-(23,57)
(23,52)-(23,61)
(23,52)-(23,68)
(23,60)-(23,61)
(23,66)-(23,68)
(24,5)-(24,52)
*)

(* type error slice
(2,44)-(2,64)
(2,50)-(2,55)
(2,50)-(2,64)
(4,4)-(8,36)
(4,13)-(8,32)
(4,16)-(8,32)
(5,3)-(8,32)
(6,3)-(8,32)
(7,11)-(7,42)
(7,40)-(7,42)
(8,15)-(8,20)
(8,15)-(8,26)
(8,15)-(8,32)
(8,28)-(8,29)
(8,30)-(8,32)
(16,3)-(25,33)
(16,12)-(24,52)
(17,5)-(24,52)
(17,11)-(20,62)
(17,13)-(20,62)
(18,7)-(20,62)
(18,21)-(18,22)
(20,11)-(20,18)
(20,16)-(20,18)
(22,5)-(24,52)
(23,7)-(23,15)
(23,7)-(23,68)
(23,17)-(23,29)
(23,17)-(23,68)
(23,52)-(23,57)
(23,52)-(23,61)
(23,52)-(23,68)
(23,52)-(23,68)
(23,52)-(23,68)
(23,66)-(23,68)
(24,19)-(24,33)
(24,19)-(24,45)
(24,34)-(24,35)
(24,41)-(24,45)
(25,15)-(25,18)
(25,15)-(25,33)
(25,20)-(25,27)
(25,20)-(25,33)
*)
