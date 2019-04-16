
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
(30,13)-(36,32)
match a with
| (len , []) -> (len , [sum])
| (len , x' :: xs') -> if x' = (-1)
                       then if sum = 9
                            then (len , (-1) :: (0 :: xs'))
                            else (len , (sum + 1) :: xs')
                       else (len , sum :: (x' :: xs'))
CaseG VarG (fromList [(TuplePatG (fromList [VarPatG,ConsPatG EmptyPatG EmptyPatG]),Nothing,IteG EmptyG EmptyG EmptyG),(TuplePatG (fromList [VarPatG,ConPatG Nothing]),Nothing,TupleG (fromList [EmptyG]))])

(38,13)-(43,49)
match a with
| (len , []) -> (len , [(-1) ; sum mod 10])
| (len , x' :: xs') -> if x' = (-1)
                       then (len , (-1) :: (((sum mod 10) + 1) :: xs'))
                       else (len , (-1) :: ((sum mod 10) :: (x' :: xs')))
CaseG VarG (fromList [(TuplePatG (fromList [VarPatG,ConsPatG EmptyPatG EmptyPatG]),Nothing,IteG EmptyG EmptyG EmptyG),(TuplePatG (fromList [VarPatG,ConPatG Nothing]),Nothing,TupleG (fromList [EmptyG]))])

(44,16)-(44,18)
(List.length l1 , [])
TupleG (fromList [AppG (fromList [EmptyG]),ListG (fromList [])])

(46,20)-(46,61)
List.rev l1
AppG (fromList [VarG])

(47,9)-(47,51)
List.rev l2
AppG (fromList [VarG])

*)

(* type error slice
(24,5)-(48,52)
(24,11)-(43,49)
(24,13)-(43,49)
(25,7)-(43,49)
(25,13)-(25,14)
(27,21)-(27,26)
(27,25)-(27,26)
(45,5)-(48,52)
(46,7)-(46,19)
(46,7)-(47,51)
(47,9)-(47,51)
(47,10)-(47,22)
(48,19)-(48,33)
(48,19)-(48,45)
(48,34)-(48,35)
(48,41)-(48,45)
*)
