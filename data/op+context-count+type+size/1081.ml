
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
(40,14)-(45,63)
(44,24)-(44,54)
(44,53)-(44,54)
(49,20)-(49,27)
(49,28)-(49,30)
(49,31)-(49,33)
*)

(* type error slice
(24,5)-(48,52)
(24,11)-(45,63)
(24,13)-(45,63)
(25,7)-(45,63)
(25,13)-(25,14)
(27,11)-(45,63)
(27,21)-(27,22)
(27,21)-(27,26)
(27,25)-(27,26)
(28,11)-(45,63)
(30,14)-(38,38)
(30,20)-(30,21)
(31,29)-(31,32)
(31,29)-(31,39)
(31,34)-(31,39)
(31,35)-(31,38)
(38,30)-(38,33)
(38,30)-(38,38)
(38,37)-(38,38)
(40,14)-(45,63)
(40,20)-(40,21)
(41,29)-(41,32)
(41,29)-(41,52)
(41,34)-(41,52)
(41,36)-(41,38)
(43,18)-(45,63)
(44,24)-(44,54)
(45,24)-(45,27)
(45,24)-(45,63)
(45,31)-(45,63)
(46,5)-(48,52)
(46,18)-(46,29)
(46,18)-(46,32)
(46,18)-(46,37)
(46,30)-(46,32)
(46,35)-(46,37)
(47,5)-(48,52)
(47,16)-(47,28)
(47,16)-(47,55)
(47,30)-(47,38)
(47,30)-(47,41)
(47,39)-(47,41)
(47,44)-(47,52)
(47,44)-(47,55)
(47,53)-(47,55)
(48,19)-(48,33)
(48,19)-(48,45)
(48,34)-(48,35)
(48,36)-(48,40)
(48,41)-(48,45)
*)
