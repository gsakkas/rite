
let l1 = [0; 0; 9; 9];;

let l2 = [1; 0; 0; 2];;

let x = (3, 3) :: (List.rev (List.combine l1 l2));;

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else x :: xs;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with | (c,(d1,d2)::ds) -> ((d1 + (d2 mod 10)), (d1 + d2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let l1 = [0; 0; 9; 9];;

let l2 = [1; 0; 0; 2];;

let x = (3, 3) :: (List.rev (List.combine l1 l2));;

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else x :: xs;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (d1,d2) ->
          ((d1 + d2), ((d1 + d2) :: ((match a with | (a1,a2) -> a2)))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(6,10)-(6,11)
(6,13)-(6,14)
(24,7)-(24,70)
(24,13)-(24,14)
(24,43)-(24,70)
(24,49)-(24,58)
(24,56)-(24,58)
(25,5)-(27,52)
*)

(* type error slice
(23,5)-(27,52)
(23,11)-(24,70)
(23,13)-(24,70)
(24,7)-(24,70)
(24,13)-(24,14)
(24,43)-(24,58)
(24,43)-(24,70)
(24,63)-(24,70)
(25,5)-(27,52)
(25,17)-(25,18)
(25,17)-(25,22)
(25,20)-(25,22)
(26,5)-(27,52)
(26,16)-(26,24)
(26,16)-(26,44)
(26,26)-(26,38)
(26,26)-(26,44)
(26,39)-(26,41)
(26,42)-(26,44)
(27,19)-(27,33)
(27,19)-(27,45)
(27,34)-(27,35)
(27,36)-(27,40)
(27,41)-(27,45)
*)
