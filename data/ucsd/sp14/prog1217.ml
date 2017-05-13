
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

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | VarY  -> y
  | VarX  -> x;;

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
