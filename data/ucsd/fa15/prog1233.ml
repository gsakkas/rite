
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Tangent of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildTangent e = Tangent e;;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let sampleExpr =
  buildCosine
    (buildTangent
       (buildSine
          ((buildTimes
              (buildCosine
                 (buildAverage
                    ((buildCosine (buildX ())),
                      (buildTimes
                         (buildCosine
                            (buildCosine
                               (buildAverage
                                  ((buildTimes ((buildY ()), (buildY ()))),
                                    (buildCosine (buildX ()))))))),
                      (buildCosine
                         (buildTimes
                            ((buildSine (buildCosine (buildY ()))),
                              (buildAverage
                                 ((buildSine (buildX ())),
                                   (buildTimes ((buildX ()), (buildX ())))))))))))),
            (buildY ()))));;
