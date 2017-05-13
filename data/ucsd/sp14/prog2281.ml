
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let _ =
  let rec build (rand,depth) =
    let buildd (r,d) =
      if r = 1
      then buildX ()
      else
        if r = 2
        then buildY ()
        else
          if r = 3
          then buildSine (build (r, d))
          else
            if r = 4
            then buildCosine (build (r, d))
            else
              if r = 5
              then buildTimes ((build (r1, d1)), (build (r2, d2)))
              else
                buildThresh
                  ((build (r1, d1)), (build (r2, 2)), (build (r2, d2)),
                    (build (r2, d2))) in
    ((depth - 1), (depth > 0)) in
  buildd (rand, depth);;
