
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = failwith "to be implemented" in
    let args = failwith "to be implemented" in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2)) List.combine (padZero [9; 9] [1; 0; 0; 2]);;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (list1,list2) ->
          (match list1 with
           | [] -> (match x with | (h1,h2) -> (((h1 + h2) :: list1), list2))) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,25)-(14,44)
match a with
| (list1 , list2) -> match list1 with
                     | [] -> match x with
                             | (h1 , h2) -> ((h1 + h2) :: list1 , list2)
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

(15,4)-(17,51)
a
VarG

(15,4)-(17,51)
list1
VarG

(15,4)-(17,51)
x
VarG

(15,4)-(17,51)
h1
VarG

(15,4)-(17,51)
h2
VarG

(15,4)-(17,51)
list1
VarG

(15,4)-(17,51)
list2
VarG

(15,4)-(17,51)
h1 + h2
BopG VarG VarG

(15,4)-(17,51)
match list1 with
| [] -> match x with
        | (h1 , h2) -> ((h1 + h2) :: list1 , list2)
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

(15,4)-(17,51)
match x with
| (h1 , h2) -> ((h1 + h2) :: list1 , list2)
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(15,4)-(17,51)
((h1 + h2) :: list1 , list2)
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG,BopG VarG VarG]))) Nothing])

(15,4)-(17,51)
(h1 + h2) :: list1
ConAppG (Just (TupleG (fromList [VarG,BopG VarG VarG]))) Nothing

(15,24)-(15,43)
([] , [])
TupleG (fromList [ListG EmptyG Nothing])

(16,4)-(17,51)
[]
ListG EmptyG Nothing

(16,4)-(17,51)
[]
ListG EmptyG Nothing

(16,24)-(16,43)
List.combine l1 l2
AppG (fromList [VarG])

(17,4)-(17,51)
List.combine
VarG

(17,4)-(17,51)
l1
VarG

(17,4)-(17,51)
l2
VarG

(18,2)-(18,77)
removeZero (add (padZero l1
                         l2))
AppG (fromList [AppG (fromList [EmptyG])])

*)
