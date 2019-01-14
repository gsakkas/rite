
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Sqrt of expr
  | Abs of expr
  | Gauss of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildGauss (e1,e2,e3) = Gauss (e1, e2, e3);;

let buildSine e = Sine e;;

let buildSqrt e = Sqrt (Abs e);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 ->
      (match rand (1, 2) with
       | 1 -> buildX
       | 2 -> buildY
       | _ ->
           let next = build (rand, (depth - 1)) in
           (match rand (1, 7) with
            | 1 -> buildSine next
            | 2 -> buildCosine next
            | 3 -> buildAverage (next, next)
            | 4 -> buildTimes (next, next)
            | 5 -> buildThresh (next, next, next, next)
            | 6 -> buildSqrt next
            | 7 -> buildGauss (next, next, next)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Sqrt of expr
  | Abs of expr
  | Gauss of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildGauss (e1,e2,e3) = Gauss (e1, e2, e3);;

let buildSine e = Sine e;;

let buildSqrt e = Sqrt (Abs e);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec build (rand,depth) =
  match depth with
  | 0 -> (match rand (1, 2) with | 1 -> VarX | 2 -> VarY)
  | _ ->
      let next = build (rand, (depth - 1)) in
      (match rand (1, 7) with
       | 1 -> buildSine next
       | 2 -> buildCosine next
       | 3 -> buildAverage (next, next)
       | 4 -> buildTimes (next, next)
       | 5 -> buildThresh (next, next, next, next)
       | 6 -> buildSqrt next
       | 7 -> buildGauss (next, next, next));;

*)

(* changed spans
(33,2)-(47,50)
match depth with
| 0 -> match rand (1 , 2) with
       | 1 -> VarX
       | 2 -> VarY
| _ -> (let next =
          build (rand , depth - 1) in
        match rand (1 , 7) with
        | 1 -> buildSine next
        | 2 -> buildCosine next
        | 3 -> buildAverage (next , next)
        | 4 -> buildTimes (next , next)
        | 5 -> buildThresh (next , next , next , next)
        | 6 -> buildSqrt next
        | 7 -> buildGauss (next , next , next))
CaseG VarG (fromList [(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG),(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

(35,6)-(47,50)
match rand (1 , 2) with
| 1 -> VarX
| 2 -> VarY
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,ConAppG Nothing Nothing)])

(37,14)-(37,20)
VarX
ConAppG Nothing Nothing

(39,11)-(47,49)
VarY
ConAppG Nothing Nothing

*)
