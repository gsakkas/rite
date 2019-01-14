
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) @ l1
  else (clone 0 ((List.length l1) - (List.length l2))) @ l2;;

let rec removeZero l =
  let f a x =
    if (List.length a) = 0 then (if x = 0 then [] else [x]) else a @ [x] in
  let base = [] in List.fold_left f base l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = failwith "to be implemented" in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2) (if l1 > l2 then l1 else l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) @ l1
  else (clone 0 ((List.length l1) - (List.length l2))) @ l2;;

let rec removeZero l =
  let f a x =
    if (List.length a) = 0 then (if x = 0 then [] else [x]) else a @ [x] in
  let base = [] in List.fold_left f base l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (l1e,l2e) ->
          (match a with
           | (carry,list) ->
               let num = (l1e + l2e) + carry in ((num mod 9), ([7] @ list))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add ((padZero l1 l2), l2));;

*)

(* changed spans
(16,25)-(16,44)
match x with
| (l1e , l2e) -> match a with
                 | (carry , list) -> (let num =
                                        (l1e + l2e) + carry in
                                      (num mod 9 , [7] @ list))
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

(17,4)-(19,51)
x
VarG

(17,4)-(19,51)
a
VarG

(17,4)-(19,51)
l1e
VarG

(17,4)-(19,51)
l2e
VarG

(17,4)-(19,51)
carry
VarG

(17,4)-(19,51)
num
VarG

(17,4)-(19,51)
(@)
VarG

(17,4)-(19,51)
list
VarG

(17,4)-(19,51)
[7] @ list
AppG (fromList [VarG,ListG EmptyG Nothing])

(17,4)-(19,51)
l1e + l2e
BopG VarG VarG

(17,4)-(19,51)
(l1e + l2e) + carry
BopG (BopG EmptyG EmptyG) VarG

(17,4)-(19,51)
num mod 9
BopG VarG LitG

(17,4)-(19,51)
9
LitG

(17,4)-(19,51)
7
LitG

(17,4)-(19,51)
let num =
  (l1e + l2e) + carry in
(num mod 9 , [7] @ list)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (TupleG (fromList [EmptyG]))

(17,4)-(19,51)
match a with
| (carry , list) -> (let num =
                       (l1e + l2e) + carry in
                     (num mod 9 , [7] @ list))
CaseG VarG (fromList [(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])

(17,4)-(19,51)
(num mod 9 , [7] @ list)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(17,4)-(19,51)
[7]
ListG LitG Nothing

(17,24)-(17,43)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(18,4)-(19,51)
0
LitG

(18,4)-(19,51)
[]
ListG EmptyG Nothing

(20,13)-(20,63)
add (padZero l1 l2 , l2)
AppG (fromList [TupleG (fromList [EmptyG])])

(20,18)-(20,33)
(padZero l1 l2 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)
