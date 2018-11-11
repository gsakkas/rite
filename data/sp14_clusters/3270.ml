
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = x in
    let base = 0 in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


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
(14,16)-(14,17)
a
VarG

(14,16)-(14,17)
list1
VarG

(14,16)-(14,17)
match a with
| (list1 , list2) -> match list1 with
                     | [] -> match x with
                             | (h1 , h2) -> ((h1 + h2) :: list1 , list2)
CaseG VarG [(Nothing,CaseG EmptyG [(Nothing,EmptyG)])]

(14,16)-(14,17)
match list1 with
| [] -> match x with
        | (h1 , h2) -> ((h1 + h2) :: list1 , list2)
CaseG VarG [(Nothing,CaseG EmptyG [(Nothing,EmptyG)])]

(14,16)-(14,17)
match x with
| (h1 , h2) -> ((h1 + h2) :: list1 , list2)
CaseG VarG [(Nothing,TupleG [EmptyG,EmptyG])]

(15,4)-(16,77)
h1
VarG

(15,4)-(16,77)
h2
VarG

(15,4)-(16,77)
list1
VarG

(15,4)-(16,77)
list2
VarG

(15,4)-(16,77)
h1 + h2
BopG VarG VarG

(15,4)-(16,77)
((h1 + h2) :: list1 , list2)
TupleG [ConAppG (Just (TupleG [BopG VarG VarG,VarG])) Nothing,VarG]

(15,4)-(16,77)
(h1 + h2) :: list1
ConAppG (Just (TupleG [BopG VarG VarG,VarG])) Nothing

(15,15)-(15,16)
([] , [])
TupleG [ListG EmptyG Nothing,ListG EmptyG Nothing]

(16,4)-(16,77)
[]
ListG EmptyG Nothing

(16,4)-(16,77)
[]
ListG EmptyG Nothing

(16,15)-(16,23)
List.combine l1 l2
AppG [VarG,VarG]

(16,24)-(16,26)
List.combine
VarG

(16,24)-(16,26)
l1
VarG

*)
