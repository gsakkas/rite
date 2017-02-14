
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
(23,15)-(23,69)
(23,16)-(23,28)
(23,30)-(23,41)
(23,31)-(23,36)
(23,39)-(23,40)
(23,45)-(23,47)
(23,49)-(23,68)
(23,50)-(23,61)
(23,51)-(23,56)
(23,59)-(23,60)
(23,65)-(23,67)
(24,4)-(24,51)
*)

(* type error slice
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,54)
(4,3)-(8,35)
(4,12)-(8,33)
(4,15)-(8,33)
(5,2)-(8,33)
(6,2)-(8,33)
(7,7)-(7,42)
(7,39)-(7,41)
(8,12)-(8,32)
(8,13)-(8,26)
(8,14)-(8,19)
(8,27)-(8,28)
(8,29)-(8,31)
(16,2)-(25,34)
(16,11)-(24,51)
(17,4)-(24,51)
(17,10)-(20,63)
(17,12)-(20,63)
(18,6)-(20,63)
(18,20)-(18,21)
(20,9)-(20,18)
(20,15)-(20,17)
(22,4)-(24,51)
(23,6)-(23,14)
(23,6)-(23,69)
(23,15)-(23,69)
(23,16)-(23,28)
(23,49)-(23,68)
(23,49)-(23,68)
(23,49)-(23,68)
(23,50)-(23,61)
(23,51)-(23,56)
(23,65)-(23,67)
(24,18)-(24,32)
(24,18)-(24,44)
(24,33)-(24,34)
(24,40)-(24,44)
(25,13)-(25,34)
(25,14)-(25,17)
(25,18)-(25,33)
(25,19)-(25,26)
*)
