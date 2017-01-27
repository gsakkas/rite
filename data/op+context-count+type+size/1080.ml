
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
      | (d,(b,c)) ->
          let sum = b + c in
          if sum < 10
          then
            (match a with
             | [] -> sum :: a
             | x'::xs' ->
                 if x' = (-1)
                 then
                   (if sum = 9 then (-1) :: 0 :: xs' else (sum + 1) :: xs')
                 else sum :: a)
          else
            (match a with
             | [] -> (-1) :: (sum mod 10) :: a
             | x'::xs' ->
                 if x' = (-1)
                 then (-1) :: (sum mod 10) :: a
                 else (-1) :: (sum mod 10) :: a) in
    let base = ((List.length l1), []) in
    let args =
      List.combine (clone (List.length l1) (List.length l1))
        (List.combine (List.rev l1) (List.rev l2)) in
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
(25,7)-(43,48)
(30,14)-(36,31)
(31,22)-(31,25)
(31,22)-(31,30)
(31,29)-(31,30)
(35,38)-(35,53)
(35,60)-(35,75)
(36,23)-(36,31)
(36,30)-(36,31)
(38,14)-(43,48)
(38,20)-(38,21)
(39,23)-(39,25)
(39,31)-(39,47)
(39,46)-(39,47)
(42,24)-(42,48)
(42,32)-(42,42)
(42,47)-(42,48)
(43,24)-(43,48)
(43,47)-(43,48)
(44,5)-(48,52)
(46,21)-(46,26)
(46,21)-(46,59)
(46,28)-(46,39)
(46,40)-(46,42)
(46,45)-(46,56)
(46,45)-(46,59)
(46,57)-(46,59)
(47,10)-(47,22)
(47,10)-(47,49)
(47,24)-(47,35)
(49,15)-(49,18)
(49,20)-(49,27)
(49,20)-(49,33)
(49,28)-(49,30)
(49,31)-(49,33)
*)

(* type error slice
(2,4)-(8,22)
(2,15)-(8,19)
(2,17)-(8,19)
(3,3)-(8,19)
(3,6)-(3,7)
(3,6)-(3,11)
(3,10)-(3,11)
(4,8)-(4,10)
(24,5)-(48,52)
(24,11)-(43,48)
(24,13)-(43,48)
(25,7)-(43,48)
(25,13)-(25,14)
(27,11)-(43,48)
(27,21)-(27,22)
(27,21)-(27,26)
(27,25)-(27,26)
(28,11)-(43,48)
(30,14)-(36,31)
(31,22)-(31,25)
(31,22)-(31,30)
(31,29)-(31,30)
(44,5)-(48,52)
(44,18)-(44,29)
(44,18)-(44,32)
(44,18)-(44,37)
(44,30)-(44,32)
(44,35)-(44,37)
(45,5)-(48,52)
(46,7)-(46,19)
(46,7)-(47,49)
(46,21)-(46,26)
(46,21)-(46,59)
(46,28)-(46,39)
(46,28)-(46,42)
(46,40)-(46,42)
(46,45)-(46,56)
(46,45)-(46,59)
(46,57)-(46,59)
(47,10)-(47,22)
(47,10)-(47,49)
(47,24)-(47,32)
(47,24)-(47,35)
(47,33)-(47,35)
(47,38)-(47,46)
(47,38)-(47,49)
(47,47)-(47,49)
(48,19)-(48,33)
(48,19)-(48,45)
(48,34)-(48,35)
(48,36)-(48,40)
(48,41)-(48,45)
*)
