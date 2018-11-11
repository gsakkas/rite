
let rec clone x n =
  match n with | 0 -> [] | a -> if a < 0 then [] else (clone x (n - 1)) @ [x];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (h1,h2) -> [h2] in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | 0 -> [] | a -> if a < 0 then [] else (clone x (n - 1)) @ [x];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (f,g) -> f in
      let newc =
        match x with | (f,g) -> if ((f + g) + carry) > 9 then 1 else 0 in
      let digit = match x with | (f,g) -> (f + g) + (carry mod 10) in
      match a with | (o,p) -> (newc, (digit :: p)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,16)-(15,46)
let carry =
  match a with
  | (f , g) -> f in
let newc =
  match x with
  | (f , g) -> if ((f + g) + carry) > 9
               then 1
               else 0 in
let digit =
  match x with
  | (f , g) -> (f + g) + (carry mod 10) in
match a with
| (o , p) -> (newc , digit :: p)
LetG NonRec [CaseG EmptyG [(Nothing,EmptyG)]] (LetG NonRec [EmptyG] EmptyG)

(15,22)-(15,23)
a
VarG

(15,22)-(15,23)
f
VarG

(15,22)-(15,23)
let newc =
  match x with
  | (f , g) -> if ((f + g) + carry) > 9
               then 1
               else 0 in
let digit =
  match x with
  | (f , g) -> (f + g) + (carry mod 10) in
match a with
| (o , p) -> (newc , digit :: p)
LetG NonRec [CaseG EmptyG [(Nothing,EmptyG)]] (LetG NonRec [EmptyG] EmptyG)

(15,22)-(15,23)
match a with
| (f , g) -> f
CaseG VarG [(Nothing,VarG)]

(15,22)-(15,23)
match x with
| (f , g) -> if ((f + g) + carry) > 9
             then 1
             else 0
CaseG VarG [(Nothing,IteG EmptyG EmptyG EmptyG)]

(15,43)-(15,45)
if ((f + g) + carry) > 9
then 1
else 0
IteG (BopG EmptyG EmptyG) LitG LitG

(16,4)-(18,51)
f
VarG

(16,4)-(18,51)
g
VarG

(16,4)-(18,51)
carry
VarG

(16,4)-(18,51)
x
VarG

(16,4)-(18,51)
f
VarG

(16,4)-(18,51)
g
VarG

(16,4)-(18,51)
carry
VarG

(16,4)-(18,51)
a
VarG

(16,4)-(18,51)
newc
VarG

(16,4)-(18,51)
digit
VarG

(16,4)-(18,51)
p
VarG

(16,4)-(18,51)
(f + g) + carry
BopG (BopG EmptyG EmptyG) VarG

(16,4)-(18,51)
((f + g) + carry) > 9
BopG (BopG EmptyG EmptyG) LitG

(16,4)-(18,51)
f + g
BopG VarG VarG

(16,4)-(18,51)
f + g
BopG VarG VarG

(16,4)-(18,51)
(f + g) + (carry mod 10)
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

(16,4)-(18,51)
carry mod 10
BopG VarG LitG

(16,4)-(18,51)
9
LitG

(16,4)-(18,51)
1
LitG

(16,4)-(18,51)
0
LitG

(16,4)-(18,51)
10
LitG

(16,4)-(18,51)
let digit =
  match x with
  | (f , g) -> (f + g) + (carry mod 10) in
match a with
| (o , p) -> (newc , digit :: p)
LetG NonRec [CaseG EmptyG [(Nothing,EmptyG)]] (CaseG EmptyG [(Nothing,EmptyG)])

(16,4)-(18,51)
match x with
| (f , g) -> (f + g) + (carry mod 10)
CaseG VarG [(Nothing,BopG EmptyG EmptyG)]

(16,4)-(18,51)
match a with
| (o , p) -> (newc , digit :: p)
CaseG VarG [(Nothing,TupleG [EmptyG,EmptyG])]

(16,4)-(18,51)
(newc , digit :: p)
TupleG [VarG,ConAppG (Just (TupleG [VarG,VarG])) Nothing]

(16,4)-(18,51)
digit :: p
ConAppG (Just (TupleG [VarG,VarG])) Nothing

*)
