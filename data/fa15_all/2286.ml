
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Cotangent of expr
  | Volume of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildCotanget e = Cotangent e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildVolume (l,w,h) = Volume (l, w, h);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then
    let random = rand (0, 1) in (if random = 0 then buildX () else buildY ())
  else
    (let random = rand (0, 6) in
     match random with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 3 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 -> buildCotanget (rand, (depth - 1))
     | 6 -> buildVolume (rand, (depth - 1)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Cotangent of expr
  | Volume of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildCotangent e = Cotangent e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildVolume (l,w,h) = Volume (l, w, h);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then
    let random = rand (0, 1) in (if random = 0 then buildX () else buildY ())
  else
    (let random = rand (0, 4) in
     match random with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 3 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 -> buildCotangent (build (rand, (depth - 1)))
     | 6 ->
         buildVolume
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1)))));;

*)

(* changed spans
(36,27)-(36,28)
4
LitG

(50,12)-(50,25)
buildCotangent
VarG

(50,26)-(50,45)
build
VarG

(50,26)-(50,45)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(51,24)-(51,43)
build
VarG

(51,24)-(51,43)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(51,24)-(51,43)
(build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
TupleG (fromList [AppG (fromList [EmptyG])])

*)
