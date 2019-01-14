
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
(25,6)-(43,48)
match x with
| (b , c) -> (let sum =
                b + c in
              if sum < 10
              then (match a with
                    | (len , []) -> (len , [sum])
                    | (len , x' :: xs') -> if x' = (-1)
                                           then if sum = 9
                                                then (len , (-1) :: (0 :: xs'))
                                                else (len , (sum + 1) :: xs')
                                           else (len , sum :: (x' :: xs')))
              else (match a with
                    | (len , []) -> (len , [(-1) ; sum mod 10])
                    | (len , x' :: xs') -> if x' = (-1)
                                           then (len , (-1) :: (((sum mod 10) + 1) :: xs'))
                                           else (len , (-1) :: ((sum mod 10) :: (x' :: xs')))))
CaseG VarG (fromList [(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])

(30,12)-(36,31)
match a with
| (len , []) -> (len , [sum])
| (len , x' :: xs') -> if x' = (-1)
                       then if sum = 9
                            then (len , (-1) :: (0 :: xs'))
                            else (len , (sum + 1) :: xs')
                       else (len , sum :: (x' :: xs'))
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,TupleG (fromList [EmptyG]))])

(31,21)-(31,24)
len
VarG

(31,21)-(31,24)
[sum]
ListG VarG Nothing

(31,21)-(31,29)
(len , [sum])
TupleG (fromList [VarG,ListG EmptyG Nothing])

(35,36)-(35,52)
len
VarG

(35,36)-(35,52)
(len , (-1) :: (0 :: xs'))
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,LitG]))) Nothing]))) Nothing])

(35,58)-(35,74)
len
VarG

(35,58)-(35,74)
(len , (sum + 1) :: xs')
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing])

(36,22)-(36,30)
len
VarG

(36,22)-(36,30)
(len , sum :: (x' :: xs'))
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG]))) Nothing]))) Nothing])

(39,21)-(39,25)
x'
VarG

(39,21)-(39,25)
xs'
VarG

(39,21)-(39,25)
a
VarG

(39,21)-(39,25)
len
VarG

(39,21)-(39,25)
match a with
| (len , []) -> (len , [(-1) ; sum mod 10])
| (len , x' :: xs') -> if x' = (-1)
                       then (len , (-1) :: (((sum mod 10) + 1) :: xs'))
                       else (len , (-1) :: ((sum mod 10) :: (x' :: xs')))
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,TupleG (fromList [EmptyG]))])

(39,21)-(39,25)
(len , [(-1) ; sum mod 10])
TupleG (fromList [VarG,ListG EmptyG Nothing])

(39,21)-(39,25)
[(-1) ; sum mod 10]
ListG LitG Nothing

(42,22)-(42,47)
len
VarG

(42,22)-(42,47)
(len , (-1) :: (((sum mod 10) + 1) :: xs'))
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG LitG) LitG]))) Nothing]))) Nothing])

(42,30)-(42,42)
(sum mod 10) + 1
BopG (BopG EmptyG EmptyG) LitG

(42,46)-(42,47)
1
LitG

(43,22)-(43,47)
xs'
VarG

(43,22)-(43,47)
len
VarG

(43,22)-(43,47)
(len , (-1) :: ((sum mod 10) :: (x' :: xs')))
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [BopG VarG LitG,ConAppG (Just (TupleG (fromList [VarG]))) Nothing]))) Nothing]))) Nothing])

(43,46)-(43,47)
x' :: xs'
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(44,4)-(48,51)
x'
VarG

(44,4)-(48,51)
xs'
VarG

*)
