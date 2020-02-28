
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Arctan of expr
  | Strange of expr* expr* expr;;

let buildArctan e1 = Arctan e1;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildStrange (e1,e2,e3) = Strange (e1, e2, e3);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then
    let result = rand (0, 2) in
    match result with | 0 -> buildX () | _ -> buildY ()
  else
    (let result = rand (0, 7) in
     let build1 = build (rand, (depth - 1)) in
     let build2 = build (rand, (depth - 1)) in
     let build3 = build (rand, (depth - 1)) in
     let build4 = build (rand, (depth - 1)) in
     match result with
     | 0 -> buildSine build1
     | 1 -> buildCosine build1
     | 2 -> buildAverage (build1, build2)
     | 3 -> buildTimes (build1, build2)
     | 4 -> buildThresh (build1, build2, build3, build4)
     | 5 -> buildArctan (build1, build2)
     | 6 -> buildStrange (build1, build2, build3));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Arctan of expr
  | Strange of expr* expr* expr;;

let buildArctan e1 = Arctan e1;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildStrange (e1,e2,e3) = Strange (e1, e2, e3);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then
    let result = rand (0, 2) in
    match result with | 0 -> buildX () | _ -> buildY ()
  else
    (let result = rand (0, 7) in
     let build1 = build (rand, (depth - 1)) in
     let build2 = build (rand, (depth - 1)) in
     let build3 = build (rand, (depth - 1)) in
     let build4 = build (rand, (depth - 1)) in
     match result with
     | 0 -> buildSine build1
     | 1 -> buildCosine build1
     | 2 -> buildAverage (build1, build2)
     | 3 -> buildTimes (build1, build2)
     | 4 -> buildThresh (build1, build2, build3, build4)
     | 5 -> buildArctan build1
     | 6 -> buildStrange (build1, build2, build3));;

*)

(* changed spans
(48,25)-(48,41)
build1
VarG

*)

(* type error slice
(13,4)-(13,33)
(13,17)-(13,31)
(13,22)-(13,31)
(13,29)-(13,31)
(48,13)-(48,24)
(48,13)-(48,41)
(48,25)-(48,41)
*)
