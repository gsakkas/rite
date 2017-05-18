
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Timmy1 of expr* expr* expr
  | Timmy2 of expr* expr;;

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Timmy1 of expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildTimmy1 (e1,e2,e3) = Timmy1 (e1, e2);;

let buildTimmy2 (e1,e2) = Timmy2 (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    let rnd = rand (0, 6) in
    (if (rnd mod 7) = 0
     then buildSine (build (rand, (depth - 1)))
     else
       if (rnd mod 7) = 1
       then buildCosine (build (rand, (depth - 1)))
       else
         if (rnd mod 7) = 2
         then
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
         else
           if (rnd mod 7) = 3
           then
             buildTimes
               ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
           else
             if (rnd mod 7) = 4
             then
               buildThresh
                 ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                   (build (rand, (depth - 1))), (build (rand, (depth - 1))))
             else
               if (rnd mod 7) = 5
               then
                 buildTimmy1
                   ((build (rand, (depth - depth))),
                     (build (rand, (depth - depth))))
               else
                 buildTimmy2
                   ((build (rand, (depth - 1))), (build (rand, (depth - 1)))))
  else
    (let rnd = rand (0, 2) in
     if (rnd mod 2) = 0 then buildX () else buildY ());;
