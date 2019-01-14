
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  match diff with
  | diff when diff > 0 -> (l1, (List.append (clone 0 diff) l2))
  | diff when diff < 0 -> ((List.append (clone 0 (0 - diff)) l1), l2)
  | 0 -> (l1, l2)
  | _ -> ([], []);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = [] in
    let args = failwith "to be implemented" in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  match diff with
  | diff when diff > 0 -> (l1, (List.append (clone 0 diff) l2))
  | diff when diff < 0 -> ((List.append (clone 0 (0 - diff)) l1), l2)
  | 0 -> (l1, l2)
  | _ -> ([], []);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      (((x1 + x2) / 10), ((((a1 + x1) + x2) mod 10) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,4)-(20,51)
x
VarG

(17,4)-(20,51)
a
VarG

(17,4)-(20,51)
x1
VarG

(17,4)-(20,51)
x2
VarG

(17,4)-(20,51)
a1
VarG

(17,4)-(20,51)
x1
VarG

(17,4)-(20,51)
x2
VarG

(17,4)-(20,51)
a2
VarG

(17,4)-(20,51)
(x1 + x2) / 10
BopG (BopG EmptyG EmptyG) LitG

(17,4)-(20,51)
x1 + x2
BopG VarG VarG

(17,4)-(20,51)
((a1 + x1) + x2) mod 10
BopG (BopG EmptyG EmptyG) LitG

(17,4)-(20,51)
(a1 + x1) + x2
BopG (BopG EmptyG EmptyG) VarG

(17,4)-(20,51)
a1 + x1
BopG VarG VarG

(17,4)-(20,51)
10
LitG

(17,4)-(20,51)
10
LitG

(17,4)-(20,51)
let (a1 , a2) = a in
((x1 + x2) / 10 , (((a1 + x1) + x2) mod 10) :: a2)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(17,4)-(20,51)
((x1 + x2) / 10 , (((a1 + x1) + x2) mod 10) :: a2)
TupleG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing])

(17,4)-(20,51)
(((a1 + x1) + x2) mod 10) :: a2
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG VarG VarG) VarG) LitG]))) Nothing

(17,10)-(17,44)
0
LitG

(17,10)-(17,44)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(17,25)-(17,44)
let (x1 , x2) = x in
let (a1 , a2) = a in
((x1 + x2) / 10 , (((a1 + x1) + x2) mod 10) :: a2)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(18,4)-(20,51)
List.combine
VarG

(18,4)-(20,51)
l1
VarG

(18,4)-(20,51)
l2
VarG

(18,4)-(20,51)
List.combine l1 l2
AppG (fromList [VarG])

(19,24)-(19,43)
List.rev
VarG

*)
