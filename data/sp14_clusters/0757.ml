
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | DivAdd of expr* expr* expr* expr
  | TriMult of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine sin -> "sin(pi*" ^ ((exprToString sin) ^ ")")
  | Cosine cos -> "cos(pi*" ^ ((exprToString cos) ^ ")")
  | Average (n1,n2) ->
      "((" ^ ((exprToString n1) ^ ("+" ^ ((exprToString n2) ^ ")/2)")))
  | Times (t1,t2) -> (exprToString t1) ^ ("*" ^ (exprToString t2))
  | Thresh (th1,th2,th3,th4) ->
      "(" ^
        ((exprToString th1) ^
           ("<" ^
              ((exprToString th2) ^
                 ("?" ^
                    ((exprToString th3) ^ (":" ^ ((exprToString th4) ^ ")")))))))
  | DivAdd (ds1,ds2,ds3,ds4) ->
      "((" ^
        ((exprToString ds1) ^
           ("+" ^
              ((exprToString ds2) ^
                 (") / (" ^
                    ((exprToString ds3) ^ ("+" ^ ((exprToString ds4) "))")))))))
  | TriMult (tm1,tm2,tm3) ->
      "(" ^
        ((exprToString tm1) ^
           ("*" ^ ((exprToString tm2) ^ (("*" (exprToString tm3)) ^ ")"))));;


(* fix

let rec wwhile (f,b) =
  let ans = f b in
  match ans with | (num,tf) -> if tf = true then wwhile (f, num) else num;;

let collatz n =
  match n with | 1 -> 1 | _ when (n mod 2) = 0 -> n / 2 | _ -> (3 * n) + 1;;

let fixpoint (f,b) =
  wwhile
    ((let func b =
        let ans = f b in if b = ans then (ans, false) else (ans, true) in
      func), b);;

let _ = fixpoint (collatz, 9001);;

*)

(* changed spans
(35,49)-(35,74)
fun (f , b) ->
  (let ans = f b in
   match ans with
   | (num , tf) -> if tf = true
                   then wwhile (f , num)
                   else num)
LamG (LetG NonRec [EmptyG] EmptyG)

(35,50)-(35,68)
let ans = f b in
match ans with
| (num , tf) -> if tf = true
                then wwhile (f , num)
                else num
LetG NonRec [AppG [EmptyG]] (CaseG EmptyG [(Nothing,EmptyG)])

(38,9)-(38,27)
b
VarG

(38,9)-(38,27)
ans
VarG

(38,9)-(38,27)
tf
VarG

(38,9)-(38,27)
tf = true
BopG VarG LitG

(38,9)-(38,27)
true
LitG

(38,9)-(38,27)
if tf = true
then wwhile (f , num)
else num
IteG (BopG EmptyG EmptyG) (AppG [EmptyG]) VarG

(38,9)-(38,27)
match ans with
| (num , tf) -> if tf = true
                then wwhile (f , num)
                else num
CaseG VarG [(Nothing,IteG EmptyG EmptyG EmptyG)]

(38,28)-(38,29)
f
VarG

(39,19)-(39,37)
f
VarG

(39,19)-(39,37)
num
VarG

(39,19)-(39,37)
num
VarG

(39,19)-(39,37)
n
VarG

(39,19)-(39,37)
n
VarG

(39,19)-(39,37)
n
VarG

(39,19)-(39,37)
fun n ->
  match n with
  | 1 -> 1
  | _ when (n mod 2) = 0 -> n / 2
  | _ -> (3 * n) + 1
LamG (CaseG EmptyG [(Nothing,EmptyG),(Just EmptyG,EmptyG),(Nothing,EmptyG)])

(39,19)-(39,37)
fun (f , b) ->
  wwhile (let func =
            fun b ->
              (let ans = f b in
               if b = ans
               then (ans , false)
               else (ans , true)) in
          func , b)
LamG (AppG [EmptyG])

(39,19)-(39,37)
n / 2
BopG VarG LitG

(39,19)-(39,37)
3 * n
BopG LitG VarG

(39,19)-(39,37)
(3 * n) + 1
BopG (BopG EmptyG EmptyG) LitG

(39,19)-(39,37)
1
LitG

(39,19)-(39,37)
2
LitG

(39,19)-(39,37)
3
LitG

(39,19)-(39,37)
1
LitG

(39,19)-(39,37)
match n with
| 1 -> 1
| _ when (n mod 2) = 0 -> n / 2
| _ -> (3 * n) + 1
CaseG VarG [(Nothing,LitG),(Just (BopG EmptyG EmptyG),BopG EmptyG EmptyG),(Nothing,BopG EmptyG EmptyG)]

(39,19)-(39,37)
(f , num)
TupleG [VarG,VarG]

(39,38)-(39,39)
wwhile
VarG

(39,41)-(39,65)
fun b ->
  (let ans = f b in
   if b = ans
   then (ans , false)
   else (ans , true))
LamG (LetG NonRec [EmptyG] EmptyG)

(39,41)-(39,65)
let func =
  fun b ->
    (let ans = f b in
     if b = ans
     then (ans , false)
     else (ans , true)) in
func
LetG NonRec [LamG EmptyG] VarG

(39,41)-(39,65)
let ans = f b in
if b = ans
then (ans , false)
else (ans , true)
LetG NonRec [AppG [EmptyG]] (IteG EmptyG EmptyG EmptyG)

(39,41)-(39,65)
(let func =
   fun b ->
     (let ans = f b in
      if b = ans
      then (ans , false)
      else (ans , true)) in
 func , b)
TupleG [LetG NonRec [EmptyG] EmptyG,VarG]

(39,42)-(39,45)
f
VarG

(39,46)-(39,64)
b
VarG

(39,46)-(39,64)
b
VarG

(39,46)-(39,64)
ans
VarG

(39,46)-(39,64)
ans
VarG

(39,46)-(39,64)
ans
VarG

(39,46)-(39,64)
func
VarG

(39,46)-(39,64)
b
VarG

(39,46)-(39,64)
b = ans
BopG VarG VarG

(39,46)-(39,64)
false
LitG

(39,46)-(39,64)
true
LitG

(39,46)-(39,64)
if b = ans
then (ans , false)
else (ans , true)
IteG (BopG EmptyG EmptyG) (TupleG [EmptyG,EmptyG]) (TupleG [EmptyG,EmptyG])

(39,46)-(39,64)
(ans , false)
TupleG [VarG,LitG]

(39,46)-(39,64)
(ans , true)
TupleG [VarG,LitG]

(39,66)-(39,67)
wwhile
VarG

(39,68)-(39,71)
fixpoint
VarG

*)
