
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
      match a with
      | (c,(d1,d2)::ds) -> ((d1 + (d2 mod 10)), ((d1 + d2) :: x)) in
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
(24,6)-(25,65)
(24,12)-(24,13)
(25,27)-(25,65)
(25,34)-(25,45)
(25,42)-(25,44)
(25,62)-(25,63)
(26,4)-(28,51)
(26,15)-(26,22)
(27,4)-(28,51)
(28,4)-(28,51)
*)

(* type error slice
(23,4)-(28,51)
(23,10)-(25,65)
(23,12)-(25,65)
(24,6)-(25,65)
(24,6)-(25,65)
(24,6)-(25,65)
(24,12)-(24,13)
(25,27)-(25,65)
(25,48)-(25,64)
(25,48)-(25,64)
(25,49)-(25,58)
(28,18)-(28,32)
(28,18)-(28,44)
(28,33)-(28,34)
*)
