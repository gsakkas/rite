
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
(23,16)-(23,70)
(0 , 0) :: (List.combine l1
                         l2)
ConAppG (Just (TupleG (fromList [EmptyG])))

*)

(* type error slice
(2,44)-(2,66)
(2,49)-(2,66)
(2,50)-(2,55)
(4,4)-(8,36)
(4,13)-(8,34)
(4,16)-(8,34)
(5,3)-(8,34)
(6,3)-(8,34)
(8,8)-(8,34)
(8,13)-(8,33)
(8,14)-(8,27)
(8,15)-(8,20)
(8,28)-(8,29)
(16,3)-(25,35)
(16,12)-(24,52)
(17,5)-(24,52)
(17,11)-(20,64)
(17,13)-(20,64)
(18,7)-(20,64)
(18,21)-(18,22)
(20,10)-(20,19)
(20,16)-(20,18)
(22,5)-(24,52)
(23,7)-(23,15)
(23,7)-(23,70)
(23,16)-(23,70)
(23,17)-(23,29)
(23,50)-(23,69)
(23,51)-(23,62)
(23,52)-(23,57)
(23,66)-(23,68)
(24,19)-(24,33)
(24,19)-(24,45)
(24,34)-(24,35)
(24,41)-(24,45)
(25,14)-(25,35)
(25,15)-(25,18)
(25,19)-(25,34)
(25,20)-(25,27)
*)
