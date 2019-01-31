
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Abs of expr
  | Flip of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine q -> sin (pi *. (eval (q, x, y)))
  | Cosine q -> cos (pi *. (eval (q, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y)
  | Abs v ->
      if (eval (v, x, y)) < 0.0
      then (eval (v, x, y)) *. (-1.0)
      else eval (v, x, y)
  | Flip (a,b,c) ->
      if (eval (a, x, y)) > (eval (b, x, y))
      then eval ((c *. (-1)), x, y)
      else eval (c, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Mid of expr* expr
  | Flip of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine q -> sin (pi *. (eval (q, x, y)))
  | Cosine q -> cos (pi *. (eval (q, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y)
  | Mid (p,q) ->
      let diff =
        if ((eval (p, x, y)) -. (eval (q, x, y))) < 0.0
        then (eval (p, x, y)) -. ((eval (q, x, y)) *. (-1.0))
        else (eval (p, x, y)) -. (eval (q, x, y)) in
      diff /. 2.0
  | Flip (a,b,c) ->
      if (eval (a, x, y)) > (eval (b, x, y))
      then (eval (c, x, y)) *. (-1.0)
      else eval (c, x, y);;

*)

(* changed spans
(16,2)-(34,25)
match e with
| VarX -> x
| VarY -> y
| Sine q -> sin (pi *. eval (q , x , y))
| Cosine q -> cos (pi *. eval (q , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
| Thresh (a , b , a_less , b_less) -> if eval (a , x , y) < eval (b , x , y)
                                      then eval (a_less , x , y)
                                      else eval (b_less , x , y)
| Mid (p , q) -> (let diff =
                    if (eval (p , x , y) -. eval (q , x , y)) < 0.0
                    then eval (p , x , y) -. (eval (q , x , y) *. (- 1.0))
                    else eval (p , x , y) -. eval (q , x , y) in
                  diff /. 2.0)
| Flip (a , b , c) -> if eval (a , x , y) > eval (b , x , y)
                      then eval (c , x , y) *. (- 1.0)
                      else eval (c , x , y)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG),(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG)])

(28,6)-(30,25)
let diff =
  if (eval (p , x , y) -. eval (q , x , y)) < 0.0
  then eval (p , x , y) -. (eval (q , x , y) *. (- 1.0))
  else eval (p , x , y) -. eval (q , x , y) in
diff /. 2.0
LetG NonRec (fromList [IteG EmptyG EmptyG EmptyG]) (BopG EmptyG EmptyG)

(28,9)-(28,25)
eval (p , x , y) -. eval (q , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(28,16)-(28,17)
p
VarG

(28,28)-(28,31)
eval
VarG

(28,28)-(28,31)
q
VarG

(28,28)-(28,31)
x
VarG

(28,28)-(28,31)
y
VarG

(28,28)-(28,31)
eval (q , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(28,28)-(28,31)
(q , x , y)
TupleG (fromList [VarG])

(29,11)-(29,37)
eval
VarG

(29,11)-(29,37)
p
VarG

(29,11)-(29,37)
x
VarG

(29,11)-(29,37)
y
VarG

(29,11)-(29,37)
eval (p , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(29,11)-(29,37)
eval (p , x , y) -. (eval (q , x , y) *. (- 1.0))
BopG (AppG (fromList [EmptyG])) (BopG EmptyG EmptyG)

(29,11)-(29,37)
(p , x , y)
TupleG (fromList [VarG])

(29,18)-(29,19)
q
VarG

(30,11)-(30,25)
eval (p , x , y) -. eval (q , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(30,17)-(30,18)
p
VarG

(32,6)-(34,25)
eval
VarG

(32,6)-(34,25)
q
VarG

(32,6)-(34,25)
x
VarG

(32,6)-(34,25)
y
VarG

(32,6)-(34,25)
diff
VarG

(32,6)-(34,25)
eval (q , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(32,6)-(34,25)
diff /. 2.0
BopG VarG LitG

(32,6)-(34,25)
2.0
LitG

(32,6)-(34,25)
(q , x , y)
TupleG (fromList [VarG])

(33,11)-(33,35)
eval (c , x , y) *. (- 1.0)
BopG (AppG (fromList [EmptyG])) (UopG EmptyG)

(34,11)-(34,25)
(- 1.0)
UopG LitG

(34,11)-(34,25)
1.0
LitG

*)
