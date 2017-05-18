
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
                ((build (rand, (depth - 1))), (build (rand, (depth - 1))));;
