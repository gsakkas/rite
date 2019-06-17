
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
(33,3)-(47,51)
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
CaseG VarG [(LitPatG,Nothing,CaseG EmptyG [(EmptyPatG,Nothing,EmptyG),(EmptyPatG,Nothing,EmptyG)]),(WildPatG,Nothing,LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)]

(35,7)-(47,51)
match rand (1 , 2) with
| 1 -> VarX
| 2 -> VarY
CaseG (AppG [EmptyG]) [(LitPatG,Nothing,ConAppG Nothing),(LitPatG,Nothing,ConAppG Nothing)]

(36,15)-(36,21)
VarX
ConAppG Nothing

(37,15)-(37,21)
VarY
ConAppG Nothing

*)

(* type error slice
(20,4)-(20,27)
(20,15)-(20,25)
(20,19)-(20,25)
(20,24)-(20,25)
(28,4)-(28,23)
(28,12)-(28,21)
(32,4)-(47,53)
(32,16)-(47,51)
(33,3)-(47,51)
(35,7)-(47,51)
(36,15)-(36,21)
(39,12)-(47,50)
(39,23)-(39,28)
(39,23)-(39,48)
(40,12)-(47,50)
(41,20)-(41,29)
(41,20)-(41,34)
(41,30)-(41,34)
*)
