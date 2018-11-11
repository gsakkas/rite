
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Tangent of expr* expr
  | Square2 of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> if (rand (0, 1)) = 1 then buildX () else buildY ()
  | _ ->
      let r = rand (3, 100) in
      (match r with
       | _ when r < 20 ->
           buildAverage
             ((buildCosine (build (rand, (depth - 1)))),
               (buildSine (build (rand, (depth - 1)))))
       | _ when (r < 30) && (r > 20) ->
           buildThresh
             ((build (rand, (depth - 1))),
               (buildCosine (build (rand, (depth - 1)))))
       | _ -> buildCosine (build (rand, (depth - 1))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Tangent of expr* expr
  | Square2 of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> if (rand (0, 1)) = 1 then buildX () else buildY ()
  | _ ->
      let r = rand (3, 100) in
      (match r with
       | _ when r < 20 ->
           buildAverage
             ((buildCosine (build (rand, (depth - 1)))),
               (buildSine (build (rand, (depth - 1)))))
       | _ when (r < 30) && (r > 20) ->
           buildThresh
             ((build (rand, (depth - 1))),
               (buildCosine (build (rand, (depth - 1)))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | _ -> buildCosine (build (rand, (depth - 1))));;

*)

(* changed spans
(37,13)-(38,57)
(build (rand , depth - 1) , buildCosine (build (rand , depth - 1)) , build (rand , depth - 1) , build (rand , depth - 1))
TupleG [AppG [EmptyG],AppG [EmptyG],AppG [EmptyG],AppG [EmptyG]]

(38,15)-(38,56)
build
VarG

(38,15)-(38,56)
rand
VarG

(38,15)-(38,56)
depth
VarG

(38,15)-(38,56)
build
VarG

(38,15)-(38,56)
rand
VarG

(38,15)-(38,56)
depth
VarG

(38,15)-(38,56)
build (rand , depth - 1)
AppG [TupleG [EmptyG,EmptyG]]

(38,15)-(38,56)
buildCosine (build (rand , depth - 1))
AppG [AppG [EmptyG]]

(38,15)-(38,56)
depth - 1
BopG VarG LitG

(38,15)-(38,56)
depth - 1
BopG VarG LitG

(38,15)-(38,56)
1
LitG

(38,15)-(38,56)
1
LitG

(38,15)-(38,56)
(rand , depth - 1)
TupleG [VarG,BopG EmptyG EmptyG]

(38,15)-(38,56)
(rand , depth - 1)
TupleG [VarG,BopG EmptyG EmptyG]

*)
