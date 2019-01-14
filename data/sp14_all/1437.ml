
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> let r = rand (0, 2) in if r = 0 then buildX () else buildY ()
  | _ ->
      let r = rand (0, 5) in
      if r = 0
      then buildSine (build (rand, (depth - 1)))
      else
        if r = 1
        then buildCosine (build (rand, (depth - 1)))
        else
          if r = 2
          then
            buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
          else
            if r = 3
            then
              buildTimes
                ((build (rand, (depth - 1))), (build (rand, (depth - 1))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> let r = rand (0, 2) in if r = 0 then buildX () else buildY ()
  | _ ->
      let r = rand (0, 5) in
      if r = 0
      then buildSine (build (rand, (depth - 1)))
      else
        if r = 1
        then buildCosine (build (rand, (depth - 1)))
        else
          if r = 2
          then
            buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
          else
            if r = 3
            then
              buildTimes
                ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
            else
              buildThresh
                ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                  (build (rand, (depth - 1))), (build (rand, (depth - 1))));;

*)

(* changed spans
(17,16)-(17,39)
a
VarG

(17,16)-(17,39)
b
VarG

(17,16)-(17,39)
a_less
VarG

(17,16)-(17,39)
b_less
VarG

(17,16)-(17,39)
fun (a , b , a_less , b_less) ->
  Thresh (a , b , a_less , b_less)
LamG (ConAppG (Just (TupleG (fromList [VarG]))) Nothing)

(17,16)-(17,39)
Thresh (a , b , a_less , b_less)
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(39,12)-(42,74)
buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

*)
