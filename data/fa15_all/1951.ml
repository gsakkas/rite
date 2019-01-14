
let rec helper x = if x = 0 then 1 else 10 * (helper (x - 1));;

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in [carry] @ res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    let carry = i * x in
    match a with
    | h::t -> ((h + carry) / 10) :: ((h + carry) mod 10) :: t
    | _ -> [carry / 10; carry mod 10] in
  let base = [] in removeZero (List.fold_left f base (List.rev l));;

let rec tenEx x y =
  match y with | [] -> [] | h::t -> (tenEx (x + 1) t) @ [(helper x) * h];;

let bigMul l1 l2 =
  let f a x =
    let (carry,res) = a in
    match x with | [] -> [] | h::t -> bigAdd (mulByDigit h l1) res in
  let base = (0, []) in
  let args = tenEx 0 l2 in
  let (carry,res) = List.fold_left f base args in [carry] @ res;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in [carry] @ res in
  removeZero (add (padZero l1 l2));;

let rec helper l1 l2 =
  match l1 with | [] -> [] | h::t -> (h, l2) :: (helper t l2);;

let rec mulByDigit i l =
  let f a x =
    let carry = i * x in
    match a with
    | h::t -> ((h + carry) / 10) :: ((h + carry) mod 10) :: t
    | _ -> [carry / 10; carry mod 10] in
  let base = [] in removeZero (List.fold_left f base (List.rev l));;

let bigMul l1 l2 =
  let f a x =
    let (x1,x2) = x in
    let (carry,res) = a in
    ((carry @ [0]), (bigAdd ((mulByDigit x1 x2) @ carry) res)) in
  let base = ([], []) in
  let args = List.rev (helper l1 l2) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(28,19)-(34,66)
l1
VarG

(28,19)-(34,66)
h
VarG

(28,19)-(34,66)
l2
VarG

(28,19)-(34,66)
helper
VarG

(28,19)-(34,66)
t
VarG

(28,19)-(34,66)
l2
VarG

(28,19)-(34,66)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
LamG (LamG EmptyG)

(28,19)-(34,66)
fun l2 ->
  match l1 with
  | [] -> []
  | h :: t -> (h , l2) :: (helper t
                                  l2)
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(28,19)-(34,66)
helper t l2
AppG (fromList [VarG])

(28,19)-(34,66)
match l1 with
| [] -> []
| h :: t -> (h , l2) :: (helper t
                                l2)
CaseG VarG (fromList [(Nothing,ConAppG (Just EmptyG) Nothing),(Nothing,ListG EmptyG Nothing)])

(28,19)-(34,66)
(h , l2)
TupleG (fromList [VarG])

(28,19)-(34,66)
(h , l2) :: (helper t l2)
ConAppG (Just (TupleG (fromList [AppG (fromList [VarG]),TupleG (fromList [VarG])]))) Nothing

(28,19)-(34,66)
[]
ListG EmptyG Nothing

(41,4)-(42,66)
x
VarG

(41,4)-(42,66)
let (x1 , x2) = x in
let (carry , res) = a in
(carry @ [0] , bigAdd (mulByDigit x1
                                  x2 @ carry) res)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(42,25)-(42,27)
(carry @ [0] , bigAdd (mulByDigit x1
                                  x2 @ carry) res)
TupleG (fromList [AppG (fromList [EmptyG])])

(42,38)-(42,44)
carry
VarG

(42,38)-(42,44)
(@)
VarG

(42,38)-(42,44)
bigAdd (mulByDigit x1
                   x2 @ carry) res
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(42,38)-(42,44)
0
LitG

(42,38)-(42,44)
[0]
ListG LitG Nothing

(42,46)-(42,56)
(@)
VarG

(42,46)-(42,56)
mulByDigit x1 x2
AppG (fromList [VarG])

(42,59)-(42,61)
x1
VarG

(42,63)-(42,66)
x2
VarG

(42,63)-(42,66)
carry
VarG

(44,2)-(45,63)
[]
ListG EmptyG Nothing

(44,13)-(44,23)
List.rev
VarG

(44,13)-(44,23)
List.rev (helper l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(44,19)-(44,20)
helper
VarG

(44,21)-(44,23)
l1
VarG

(45,2)-(45,63)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

*)
