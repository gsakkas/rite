
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

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let bigMul l1 l2 =
  let f a x =
    let (s,t) = x in
    match a with
    | (r,v) ->
        let sum = mulByDigit (int_of_string (sepConcat "" l1)) s in
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
(39,11)-(50,49)
int_of_string
VarG

(39,11)-(50,49)
sepConcat
VarG

(39,11)-(50,49)
List.map
VarG

(39,11)-(50,49)
string_of_int
VarG

(39,11)-(50,49)
l
VarG

(39,11)-(50,49)
i
VarG

(39,11)-(50,49)
bigAdd
VarG

(39,11)-(50,49)
l
VarG

(39,11)-(50,49)
mulByDigit
VarG

(39,11)-(50,49)
i
VarG

(39,11)-(50,49)
l
VarG

(39,11)-(50,49)
fun l ->
  int_of_string (sepConcat ""
                           (List.map string_of_int l))
LamG (AppG (fromList [EmptyG]))

(39,11)-(50,49)
fun i ->
  fun l ->
    if i > 0
    then bigAdd l
                (mulByDigit (i - 1) l)
    else []
LamG (LamG EmptyG)

(39,11)-(50,49)
fun l ->
  if i > 0
  then bigAdd l
              (mulByDigit (i - 1) l)
  else []
LamG (IteG EmptyG EmptyG EmptyG)

(39,11)-(50,49)
int_of_string (sepConcat ""
                         (List.map string_of_int l))
AppG (fromList [AppG (fromList [EmptyG])])

(39,11)-(50,49)
sepConcat ""
          (List.map string_of_int l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(39,11)-(50,49)
List.map string_of_int l
AppG (fromList [VarG])

(39,11)-(50,49)
bigAdd l (mulByDigit (i - 1)
                     l)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(39,11)-(50,49)
mulByDigit (i - 1) l
AppG (fromList [VarG,BopG EmptyG EmptyG])

(39,11)-(50,49)
i > 0
BopG VarG LitG

(39,11)-(50,49)
i - 1
BopG VarG LitG

(39,11)-(50,49)
""
LitG

(39,11)-(50,49)
0
LitG

(39,11)-(50,49)
1
LitG

(39,11)-(50,49)
if i > 0
then bigAdd l
            (mulByDigit (i - 1) l)
else []
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (ListG EmptyG Nothing)

(39,11)-(50,49)
[]
ListG EmptyG Nothing

(44,18)-(44,64)
intListToInt
VarG

(44,18)-(44,64)
intListToInt (mulByDigit (intListToInt l1)
                         [s])
AppG (fromList [AppG (fromList [EmptyG])])

(44,55)-(44,57)
intListToInt
VarG

(44,63)-(44,64)
[s]
ListG VarG Nothing

*)
