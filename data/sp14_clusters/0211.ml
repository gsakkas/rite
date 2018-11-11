
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
  | 0 -> if (rand (0, 1)) = 0 then buildX () else buildY ()
  | _ ->
      let y = rand (2, 6) in
      if y = 2
      then buildSine (build (rand, (depth - 1)))
      else
        if y = 3
        then buildCosine (build (rand, (depth - 1)))
        else
          if y = 4
          then
            buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
          else
            if y = 5
            then
              buildTimes
                ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
            else
              if y = 6
              then
                buildThresh
                  ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                    (build (rand, (depth - 1))), (build (rand, (depth - 1))));;


(* fix

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
  if depth = 0
  then (if (rand (0, 1)) = 0 then buildX () else buildY ())
  else (let y = rand (2, 6) in buildX ());;

*)

(* changed spans
(26,2)-(50,77)
if depth = 0
then if rand (0 , 1) = 0
     then buildX ()
     else buildY ()
else (let y = rand (2 , 6) in
      buildX ())
IteG (BopG EmptyG EmptyG) (IteG EmptyG EmptyG EmptyG) (LetG NonRec [EmptyG] EmptyG)

(26,8)-(26,13)
depth = 0
BopG VarG LitG

(27,9)-(27,59)
0
LitG

(50,72)-(50,73)
buildX
VarG

*)
