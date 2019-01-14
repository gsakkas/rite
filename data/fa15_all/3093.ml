
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth <= 0
  then let x = rand (1, 2) in (if x = 1 then buildX () else buildY ());;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth <= 0
  then let x = rand (1, 2) in (if x = 1 then buildX () else buildY ())
  else
    (let subtreeSize1 = if depth = 1 then 0 else rand (1, (depth - 1)) in
     let subtreeSize2 = if depth = 1 then 0 else rand (1, (depth - 1)) in
     let subtreeSize3 = if depth = 1 then 0 else rand (1, (depth - 1)) in
     let subtreeeSize4 = if depth = 1 then 0 else rand (1, (depth - 1)) in
     let x = rand (1, 5) in
     match x with | _ -> buildSine (build (rand, subtreeSize1)));;

*)

(* changed spans
(11,11)-(11,20)
e
VarG

(11,11)-(11,20)
fun e -> Sine e
LamG (ConAppG (Just VarG) Nothing)

(11,11)-(11,20)
Sine e
ConAppG (Just VarG) Nothing

(16,2)-(17,70)
let subtreeSize1 =
  if depth = 1
  then 0
  else rand (1 , depth - 1) in
let subtreeSize2 =
  if depth = 1
  then 0
  else rand (1 , depth - 1) in
let subtreeSize3 =
  if depth = 1
  then 0
  else rand (1 , depth - 1) in
let subtreeeSize4 =
  if depth = 1
  then 0
  else rand (1 , depth - 1) in
let x = rand (1 , 5) in
match x with
| _ -> buildSine (build (rand , subtreeSize1))
LetG NonRec (fromList [IteG EmptyG EmptyG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)
