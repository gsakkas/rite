
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
      match x with
      | (x1,x2)::t ->
          let ha::ht = a in
          let (a1,a2) = ha in
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
(20,6)-(26,15)
let (x1 , x2) = x in
let (a1 , a2) = a in
let h :: _ = a1 in
let tens =
  (x1 + x2) + (h / 10) in
let ones =
  (x1 + x2) + (h mod 10) in
(tens :: a1 , ones :: a2)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(23,24)-(23,26)
a
VarG

(24,10)-(25,66)
a1
VarG

(24,10)-(25,66)
let h :: _ = a1 in
let tens =
  (x1 + x2) + (h / 10) in
let ones =
  (x1 + x2) + (h mod 10) in
(tens :: a1 , ones :: a2)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(24,34)-(24,36)
h
VarG

(25,34)-(25,36)
h
VarG

(25,54)-(25,58)
tens :: a1
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(25,60)-(25,64)
a1
VarG

(25,60)-(25,64)
ones :: a2
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(26,14)-(26,15)
a2
VarG

(27,20)-(27,21)
[]
ListG EmptyG Nothing

(28,4)-(29,51)
[]
ListG EmptyG Nothing

(28,15)-(28,42)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(28,24)-(28,36)
List.combine l1 l2
AppG (fromList [VarG])

*)
