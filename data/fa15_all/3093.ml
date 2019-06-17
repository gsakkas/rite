
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
(17,71)-(17,71)
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
LetG NonRec [(VarPatG,IteG EmptyG EmptyG EmptyG)] (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

*)

(* type error slice
(13,4)-(13,23)
(13,12)-(13,21)
(13,17)-(13,21)
(16,3)-(17,71)
(17,8)-(17,71)
(17,31)-(17,71)
(17,61)-(17,67)
(17,61)-(17,70)
(17,71)-(17,71)
*)
