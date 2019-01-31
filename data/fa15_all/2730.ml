
let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match a with | [] -> [] | h::t -> [h + x] @ t in
    let base = () in
    let args = failwith "to be implemented" in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let rec addHelper (t,u) =
  match List.rev t with
  | [] -> []
  | h::t ->
      (match List.rev u with
       | [] -> []
       | h'::t' ->
           if (h + h') > 10
           then (addHelper (t, t')) @ [(1 + h') + h]
           else (addHelper (t, t')) @ [h' + h]);;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = addHelper (a, x) in
    let base = [] in let args = [] in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(4,12)-(9,43)
List.rev
VarG

(4,12)-(9,43)
t
VarG

(4,12)-(9,43)
List.rev
VarG

(4,12)-(9,43)
u
VarG

(4,12)-(9,43)
h
VarG

(4,12)-(9,43)
h'
VarG

(4,12)-(9,43)
addHelper
VarG

(4,12)-(9,43)
t
VarG

(4,12)-(9,43)
t'
VarG

(4,12)-(9,43)
(@)
VarG

(4,12)-(9,43)
h'
VarG

(4,12)-(9,43)
h
VarG

(4,12)-(9,43)
addHelper
VarG

(4,12)-(9,43)
t
VarG

(4,12)-(9,43)
t'
VarG

(4,12)-(9,43)
(@)
VarG

(4,12)-(9,43)
h'
VarG

(4,12)-(9,43)
h
VarG

(4,12)-(9,43)
fun (t , u) ->
  match List.rev t with
  | [] -> []
  | h :: t -> match List.rev u with
              | [] -> []
              | h' :: t' -> if (h + h') > 10
                            then addHelper (t , t') @ [(1 + h') + h]
                            else addHelper (t , t') @ [h' + h]
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(4,12)-(9,43)
List.rev t
AppG (fromList [VarG])

(4,12)-(9,43)
List.rev u
AppG (fromList [VarG])

(4,12)-(9,43)
addHelper (t , t')
AppG (fromList [TupleG (fromList [EmptyG])])

(4,12)-(9,43)
addHelper (t , t') @ [(1 + h') + h]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(4,12)-(9,43)
addHelper (t , t')
AppG (fromList [TupleG (fromList [EmptyG])])

(4,12)-(9,43)
addHelper (t , t') @ [h' + h]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(4,12)-(9,43)
h + h'
BopG VarG VarG

(4,12)-(9,43)
(h + h') > 10
BopG (BopG EmptyG EmptyG) LitG

(4,12)-(9,43)
1 + h'
BopG LitG VarG

(4,12)-(9,43)
(1 + h') + h
BopG (BopG EmptyG EmptyG) VarG

(4,12)-(9,43)
h' + h
BopG VarG VarG

(4,12)-(9,43)
10
LitG

(4,12)-(9,43)
1
LitG

(4,12)-(9,43)
if (h + h') > 10
then addHelper (t , t') @ [(1 + h') + h]
else addHelper (t , t') @ [h' + h]
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(4,12)-(9,43)
match List.rev t with
| [] -> []
| h :: t -> match List.rev u with
            | [] -> []
            | h' :: t' -> if (h + h') > 10
                          then addHelper (t , t') @ [(1 + h') + h]
                          else addHelper (t , t') @ [h' + h]
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)])),(Nothing,ListG EmptyG Nothing)])

(4,12)-(9,43)
match List.rev u with
| [] -> []
| h' :: t' -> if (h + h') > 10
              then addHelper (t , t') @ [(1 + h') + h]
              else addHelper (t , t') @ [h' + h]
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,ListG EmptyG Nothing)])

(4,12)-(9,43)
(t , t')
TupleG (fromList [VarG])

(4,12)-(9,43)
(t , t')
TupleG (fromList [VarG])

(4,12)-(9,43)
[]
ListG EmptyG Nothing

(4,12)-(9,43)
[]
ListG EmptyG Nothing

(4,12)-(9,43)
[(1 + h') + h]
ListG (BopG EmptyG EmptyG) Nothing

(4,12)-(9,43)
[h' + h]
ListG (BopG EmptyG EmptyG) Nothing

(16,16)-(16,61)
addHelper (a , x)
AppG (fromList [TupleG (fromList [EmptyG])])

(16,22)-(16,23)
addHelper
VarG

(16,22)-(16,23)
(a , x)
TupleG (fromList [VarG])

(17,15)-(17,17)
[]
ListG EmptyG Nothing

(19,4)-(19,51)
[]
ListG EmptyG Nothing

*)
