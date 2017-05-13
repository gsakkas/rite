
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Half of expr
  | Timestwo of expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Half of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Half a -> 0.5 *. (eval (a, x, y));;

let sampleExpr =
  buildCosine
    (buildSine
       (buildTimes
          ((buildCosine
              (buildAverage
                 ((buildCosine (buildX ())),
                   (buildTimes
                      ((buildCosine
                          (buildCosine
                             (buildAverage
                                ((buildTimes ((buildY ()), (buildY ()))),
                                  (buildCosine (buildX ())))))),
                        (buildCosine
                           (buildTimes
                              ((buildSine (buildCosine (buildY ()))),
                                (buildAverage
                                   ((buildSine (buildX ())),
                                     (buildTimes ((buildX ()), (buildX ()))))))))))))),
            (buildY ()))));;

let _ = eval (sampleExpr, 0.5, 0.2);;
