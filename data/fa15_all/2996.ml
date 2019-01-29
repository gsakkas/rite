
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff >= 0
  then (l1, ((clone 0 diff) @ l2))
  else (((clone 0 (abs diff)) @ l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (arg1,arg2) = x in
      match a with
      | (0,_) ->
          if (arg1 + arg2) > 9
          then (1, [(arg1 + arg2) mod 10])
          else (0, [arg1 + arg2])
      | (_,_) ->
          if ((arg1 + arg2) + 1) > 9
          then (1, ([((arg1 + arg2) + 1) mod 10] @ a))
          else (0, (((arg1 + arg2) + 1) :: a)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff >= 0
  then (l1, ((clone 0 diff) @ l2))
  else (((clone 0 (abs diff)) @ l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (arg1,arg2) = x in
      match a with
      | (0,acc) ->
          if (arg1 + arg2) > 9
          then (1, (((arg1 + arg2) mod 10) :: acc))
          else (0, ((arg1 + arg2) :: acc))
      | (0,[]) ->
          if (arg1 + arg2) > 9
          then (1, [(arg1 + arg2) mod 10])
          else (0, [arg1 + arg2])
      | (_,acc) ->
          if ((arg1 + arg2) + 1) > 9
          then (1, ((((arg1 + arg2) + 1) mod 10) :: acc))
          else (0, (((arg1 + arg2) + 1) :: acc)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,6)-(27,46)
match a with
| (0 , acc) -> if (arg1 + arg2) > 9
               then (1 , ((arg1 + arg2) mod 10) :: acc)
               else (0 , (arg1 + arg2) :: acc)
| (0 , []) -> if (arg1 + arg2) > 9
              then (1 , [(arg1 + arg2) mod 10])
              else (0 , [arg1 + arg2])
| (_ , acc) -> if ((arg1 + arg2) + 1) > 9
               then (1 , (((arg1 + arg2) + 1) mod 10) :: acc)
               else (0 , ((arg1 + arg2) + 1) :: acc)
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

(22,19)-(22,41)
arg1
VarG

(22,19)-(22,41)
arg2
VarG

(22,19)-(22,41)
acc
VarG

(22,19)-(22,41)
arg1
VarG

(22,19)-(22,41)
arg2
VarG

(22,19)-(22,41)
acc
VarG

(22,19)-(22,41)
arg1
VarG

(22,19)-(22,41)
arg2
VarG

(22,19)-(22,41)
(arg1 + arg2) mod 10
BopG (BopG EmptyG EmptyG) LitG

(22,19)-(22,41)
arg1 + arg2
BopG VarG VarG

(22,19)-(22,41)
arg1 + arg2
BopG VarG VarG

(22,19)-(22,41)
arg1 + arg2
BopG VarG VarG

(22,19)-(22,41)
(arg1 + arg2) > 9
BopG (BopG EmptyG EmptyG) LitG

(22,19)-(22,41)
10
LitG

(22,19)-(22,41)
0
LitG

(22,19)-(22,41)
9
LitG

(22,19)-(22,41)
1
LitG

(22,19)-(22,41)
if (arg1 + arg2) > 9
then (1 , [(arg1 + arg2) mod 10])
else (0 , [arg1 + arg2])
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(22,19)-(22,41)
(0 , (arg1 + arg2) :: acc)
TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,BopG VarG VarG]))) Nothing])

(22,19)-(22,41)
(1 , [(arg1 + arg2) mod 10])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(22,19)-(22,41)
((arg1 + arg2) mod 10) :: acc
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) LitG]))) Nothing

(22,19)-(22,41)
(arg1 + arg2) :: acc
ConAppG (Just (TupleG (fromList [VarG,BopG VarG VarG]))) Nothing

(26,20)-(26,48)
(((arg1 + arg2) + 1) mod 10) :: acc
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG VarG VarG) LitG) LitG]))) Nothing

(26,51)-(26,52)
acc
VarG

(27,43)-(27,44)
acc
VarG

*)
