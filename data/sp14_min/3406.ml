
let rec clone x n =
  if n < 1
  then []
  else
    (let rec helper acc f x =
       match x with | 0 -> acc | _ -> helper (f :: acc) f (x - 1) in
     helper [] x n);;

let padZero l1 l2 =
  let x = (List.length l1) - (List.length l2) in
  if x != 0
  then
    (if x < 0
     then (((clone 0 (abs x)) @ l1), l2)
     else (l1, ((clone 0 (abs x)) @ l2)))
  else (l1, l2);;

let rec removeZero l =
  match l with | x::xs -> if x = 0 then removeZero xs else l | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (b,c) ->
          let sum = b + c in
          if sum < 10
          then
            (match a with
             | (len,[]) -> (len, [sum])
             | (len,x'::xs') ->
                 if x' = (-1)
                 then
                   (if sum = 9
                    then (len, ((-1) :: 0 :: xs'))
                    else (len, ((sum + 1) :: xs')))
                 else (len, (sum :: a)))
          else
            (match a with
             | (len,[]) -> (len, [(-1); sum mod 10])
             | (len,x'::xs') ->
                 if x' = (-1)
                 then (-1) :: ((sum mod 10) + 1) :: a
                 else (len, ((-1) :: (sum mod 10) :: x' :: xs'))) in
    let base = ((List.length l1), []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n < 1
  then []
  else
    (let rec helper acc f x =
       match x with | 0 -> acc | _ -> helper (f :: acc) f (x - 1) in
     helper [] x n);;

let padZero l1 l2 =
  let x = (List.length l1) - (List.length l2) in
  if x != 0
  then
    (if x < 0
     then (((clone 0 (abs x)) @ l1), l2)
     else (l1, ((clone 0 (abs x)) @ l2)))
  else (l1, l2);;

let rec removeZero l =
  match l with | x::xs -> if x = 0 then removeZero xs else l | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (b,c) ->
          let sum = b + c in
          if sum < 10
          then
            (match a with
             | (len,[]) -> (len, [sum])
             | (len,x'::xs') ->
                 if x' = (-1)
                 then
                   (if sum = 9
                    then (len, ((-1) :: 0 :: xs'))
                    else (len, ((sum + 1) :: xs')))
                 else (len, (sum :: x' :: xs')))
          else
            (match a with
             | (len,[]) -> (len, [(-1); sum mod 10])
             | (len,x'::xs') ->
                 if x' = (-1)
                 then (len, ((-1) :: ((sum mod 10) + 1) :: xs'))
                 else (len, ((-1) :: (sum mod 10) :: x' :: xs'))) in
    let base = ((List.length l1), []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(38,37)-(38,38)
x' :: xs'
AppG [VarG,VarG]

(44,23)-(44,54)
(len , (-1) :: (((sum mod 10) + 1) :: xs'))
TupleG [VarG,AppG [EmptyG,EmptyG]]

*)

(* type error slice
(24,5)-(48,52)
(24,11)-(45,66)
(24,13)-(45,66)
(25,7)-(45,66)
(27,11)-(45,66)
(28,11)-(45,66)
(30,13)-(38,41)
(30,20)-(30,21)
(38,29)-(38,39)
(38,37)-(38,38)
(40,13)-(45,66)
(40,20)-(40,21)
(41,28)-(41,53)
(43,18)-(45,65)
(44,23)-(44,54)
(45,23)-(45,65)
(48,19)-(48,33)
(48,19)-(48,45)
(48,34)-(48,35)
*)
