
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (a1,a2) = a in
      match x with
      | (x1,x2)::t ->
          let tens = (x1 + x2) + (a1 / 10) in
          let ones = (x1 + x2) + (a1 mod 10) in a @ [(tens, ones)]
      | [] -> a in
    let base = [(0, 0)] in
    let args = List.rev List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let h::_ = a1 in
      let tens = (x1 + x2) + (h / 10) in
      let ones = (x1 + x2) + (h mod 10) in ((tens :: a1), (ones :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,6)-(25,15)
x
VarG

(20,6)-(25,15)
let (x1 , x2) = x in
let (a1 , a2) = a in
let h :: _ = a1 in
let tens =
  (x1 + x2) + (h / 10) in
let ones =
  (x1 + x2) + (h mod 10) in
(tens :: a1 , ones :: a2)
LetG NonRec [VarG] (LetG NonRec [EmptyG] EmptyG)

(21,12)-(21,13)
let h :: _ = a1 in
let tens =
  (x1 + x2) + (h / 10) in
let ones =
  (x1 + x2) + (h mod 10) in
(tens :: a1 , ones :: a2)
LetG NonRec [VarG] (LetG NonRec [EmptyG] EmptyG)

(23,10)-(24,66)
a1
VarG

(23,34)-(23,36)
h
VarG

(24,34)-(24,36)
h
VarG

(24,54)-(24,58)
tens :: a1
ConAppG (Just (TupleG [VarG,VarG])) Nothing

(24,60)-(24,64)
a1
VarG

(24,60)-(24,64)
ones :: a2
ConAppG (Just (TupleG [VarG,VarG])) Nothing

(25,14)-(25,15)
a2
VarG

(26,20)-(26,21)
[]
ListG EmptyG Nothing

(27,4)-(28,51)
[]
ListG EmptyG Nothing

(27,15)-(27,42)
List.rev (List.combine l1 l2)
AppG [AppG [EmptyG,EmptyG]]

(27,24)-(27,36)
List.combine l1 l2
AppG [VarG,VarG]

*)
