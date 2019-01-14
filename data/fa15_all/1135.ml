
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      match a with
      | (c,d) ->
          if ((i + j) + c) > 9
          then (1, ((((i + j) + c) mod 10) :: d))
          else (0, ((((i + j) + c) mod 10) :: d)) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i > 0 then bigAdd l (mulByDigit (i - 1) l) else [];;

let bigMul l1 l2 =
  let f a x =
    let (s,t) = x in
    match a with
    | (r,v) ->
        let sum = int_of_string (mulByDigit (int_of_string l1) s) in
        if (sum + r) > 9
        then (((sum + r) / 10), (((sum + r) mod 10) :: v))
        else (0, (((sum + r) mod 10) :: v)) in
  let base = (0, []) in
  let args = List.rev (List.combine l2 l2) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      match a with
      | (c,d) ->
          if ((i + j) + c) > 9
          then (1, ((((i + j) + c) mod 10) :: d))
          else (0, ((((i + j) + c) mod 10) :: d)) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let intListToInt l = int_of_string (sepConcat "" (List.map string_of_int l));;

let rec mulByDigit i l =
  if i > 0 then bigAdd l (mulByDigit (i - 1) l) else [];;

let bigMul l1 l2 =
  let f a x =
    let (s,t) = x in
    match a with
    | (r,v) ->
        let sum = intListToInt (mulByDigit (intListToInt l1) [s]) in
        if (sum + r) > 9
        then (((sum + r) / 10), (((sum + r) mod 10) :: v))
        else (0, (((sum + r) mod 10) :: v)) in
  let base = (0, []) in
  let args = List.combine l2 l2 in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(29,19)-(30,55)
sl
VarG

(29,19)-(30,55)
a
VarG

(29,19)-(30,55)
(^)
VarG

(29,19)-(30,55)
sep
VarG

(29,19)-(30,55)
(^)
VarG

(29,19)-(30,55)
x
VarG

(29,19)-(30,55)
h
VarG

(29,19)-(30,55)
t
VarG

(29,19)-(30,55)
List.fold_left
VarG

(29,19)-(30,55)
f
VarG

(29,19)-(30,55)
base
VarG

(29,19)-(30,55)
l
VarG

(29,19)-(30,55)
int_of_string
VarG

(29,19)-(30,55)
sepConcat
VarG

(29,19)-(30,55)
List.map
VarG

(29,19)-(30,55)
string_of_int
VarG

(29,19)-(30,55)
l
VarG

(29,19)-(30,55)
fun sep ->
  fun sl ->
    match sl with
    | [] -> ""
    | h :: t -> (let f =
                   fun a ->
                     fun x -> a ^ (sep ^ x) in
                 let base = h in
                 let l = t in
                 List.fold_left f base l)
LamG (LamG EmptyG)

(29,19)-(30,55)
fun sl ->
  match sl with
  | [] -> ""
  | h :: t -> (let f =
                 fun a ->
                   fun x -> a ^ (sep ^ x) in
               let base = h in
               let l = t in
               List.fold_left f base l)
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(29,19)-(30,55)
fun a ->
  fun x -> a ^ (sep ^ x)
LamG (LamG EmptyG)

(29,19)-(30,55)
fun x -> a ^ (sep ^ x)
LamG (AppG (fromList [EmptyG]))

(29,19)-(30,55)
fun l ->
  int_of_string (sepConcat ""
                           (List.map string_of_int l))
LamG (AppG (fromList [EmptyG]))

(29,19)-(30,55)
a ^ (sep ^ x)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(29,19)-(30,55)
sep ^ x
AppG (fromList [VarG])

(29,19)-(30,55)
List.fold_left f base l
AppG (fromList [VarG])

(29,19)-(30,55)
int_of_string (sepConcat ""
                         (List.map string_of_int l))
AppG (fromList [AppG (fromList [EmptyG])])

(29,19)-(30,55)
sepConcat ""
          (List.map string_of_int l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(29,19)-(30,55)
List.map string_of_int l
AppG (fromList [VarG])

(29,19)-(30,55)
""
LitG

(29,19)-(30,55)
""
LitG

(29,19)-(30,55)
let f =
  fun a ->
    fun x -> a ^ (sep ^ x) in
let base = h in
let l = t in
List.fold_left f base l
LetG NonRec (fromList [LamG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(29,19)-(30,55)
let base = h in
let l = t in
List.fold_left f base l
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(29,19)-(30,55)
let l = t in
List.fold_left f base l
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

(29,19)-(30,55)
match sl with
| [] -> ""
| h :: t -> (let f =
               fun a ->
                 fun x -> a ^ (sep ^ x) in
             let base = h in
             let l = t in
             List.fold_left f base l)
CaseG VarG (fromList [(Nothing,LitG),(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])

(37,18)-(37,31)
intListToInt
VarG

(37,45)-(37,58)
intListToInt
VarG

(37,63)-(37,64)
[s]
ListG VarG Nothing

*)
