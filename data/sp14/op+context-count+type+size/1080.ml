
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
    let base = [] in
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
(25,6)-(43,48)
(30,12)-(36,31)
(31,21)-(31,24)
(31,21)-(31,29)
(31,28)-(31,29)
(35,36)-(35,52)
(35,58)-(35,74)
(36,22)-(36,30)
(36,29)-(36,30)
(38,12)-(43,48)
(38,19)-(38,20)
(39,21)-(39,25)
(39,29)-(39,46)
(39,45)-(39,46)
(42,22)-(42,47)
(42,30)-(42,42)
(42,46)-(42,47)
(43,22)-(43,47)
(43,46)-(43,47)
(44,4)-(48,51)
(44,15)-(44,17)
(45,4)-(48,51)
(46,6)-(46,18)
(46,6)-(47,50)
(46,19)-(46,60)
(46,20)-(46,25)
(46,26)-(46,42)
(46,27)-(46,38)
(46,39)-(46,41)
(46,43)-(46,59)
(47,8)-(47,50)
(49,2)-(49,12)
(49,13)-(49,34)
(49,14)-(49,17)
(49,18)-(49,33)
(49,19)-(49,26)
(49,27)-(49,29)
(49,30)-(49,32)
*)

(* type error slice
(24,4)-(48,51)
(24,10)-(43,48)
(31,21)-(31,29)
(31,28)-(31,29)
(48,4)-(48,51)
(48,18)-(48,32)
(48,18)-(48,44)
(48,33)-(48,34)
*)
