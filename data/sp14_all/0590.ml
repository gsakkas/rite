
let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = ([0], [0]) in
    let args = (l1, l2) in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x',x'') = x in
      let (c,s) = a in
      ((((c + x') + x'') / 10), ((((c + x') + x'') mod 10) :: s)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,16)-(15,44)
x
VarG

(15,16)-(15,44)
a
VarG

(15,16)-(15,44)
c
VarG

(15,16)-(15,44)
x'
VarG

(15,16)-(15,44)
x''
VarG

(15,16)-(15,44)
c
VarG

(15,16)-(15,44)
x'
VarG

(15,16)-(15,44)
x''
VarG

(15,16)-(15,44)
s
VarG

(15,16)-(15,44)
((c + x') + x'') / 10
BopG (BopG EmptyG EmptyG) LitG

(15,16)-(15,44)
(c + x') + x''
BopG (BopG EmptyG EmptyG) VarG

(15,16)-(15,44)
c + x'
BopG VarG VarG

(15,16)-(15,44)
((c + x') + x'') mod 10
BopG (BopG EmptyG EmptyG) LitG

(15,16)-(15,44)
(c + x') + x''
BopG (BopG EmptyG EmptyG) VarG

(15,16)-(15,44)
c + x'
BopG VarG VarG

(15,16)-(15,44)
10
LitG

(15,16)-(15,44)
10
LitG

(15,16)-(15,44)
let (c , s) = a in
(((c + x') + x'') / 10 , (((c + x') + x'') mod 10) :: s)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(15,16)-(15,44)
(((c + x') + x'') / 10 , (((c + x') + x'') mod 10) :: s)
TupleG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing])

(15,16)-(15,44)
(((c + x') + x'') mod 10) :: s
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG VarG VarG) VarG) LitG]))) Nothing

(15,25)-(15,44)
let (x' , x'') = x in
let (c , s) = a in
(((c + x') + x'') / 10 , (((c + x') + x'') mod 10) :: s)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(16,22)-(16,23)
List.rev
VarG

(16,22)-(16,23)
List.combine
VarG

(16,22)-(16,23)
List.combine l1 l2
AppG (fromList [VarG])

(16,22)-(16,23)
[]
ListG EmptyG Nothing

(17,15)-(17,23)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

*)