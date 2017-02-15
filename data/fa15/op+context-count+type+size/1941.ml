
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Square of expr
  | Exponential of expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildExponential (e1,e2) = Exponential (e1, e2);;

let buildSine e = Sine e;;

let buildSquare e = Square e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let r = rand (1, 7) in
  let d = depth - 1 in
  if d != 0
  then
    match r with
    | 1 -> buildSine (build (rand, d))
    | 2 -> buildCosine (build (rand, d))
    | 3 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 4 -> buildTimes ((build (rand, d)), (build (rand, d)))
    | 5 ->
        buildThresh
          ((build (rand, d)), (build (rand, d)), (build (rand, d)),
            (build (rand, d)))
    | 6 -> buildSquare ((build (rand, d)), (build (rand, d)))
    | _ -> buildExponential ((build (rand, d)), (build (rand, d)))
  else
    (let rr = rand (1, 8) in
     match rr with | 6 -> buildX () | 8 -> buildY () | _ -> buildX ());;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Square of expr
  | Exponential of expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildExponential (e1,e2) = Exponential (e1, e2);;

let buildSine e = Sine e;;

let buildSquare e = Square e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let r = rand (1, 7) in
  let d = depth - 1 in
  if d != 0
  then
    match r with
    | 1 -> buildSine (build (rand, d))
    | 2 -> buildCosine (build (rand, d))
    | 3 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 4 -> buildTimes ((build (rand, d)), (build (rand, d)))
    | 5 ->
        buildThresh
          ((build (rand, d)), (build (rand, d)), (build (rand, d)),
            (build (rand, d)))
    | 6 -> buildSquare (build (rand, d))
    | _ -> buildExponential ((build (rand, d)), (build (rand, d)))
  else
    (let rr = rand (1, 8) in
     match rr with | 6 -> buildX () | 8 -> buildY () | _ -> buildX ());;

*)

(* changed spans
(45,23)-(45,61)
(45,44)-(45,49)
(45,50)-(45,59)
(45,51)-(45,55)
(45,57)-(45,58)
(46,11)-(46,66)
(49,43)-(49,49)
(49,50)-(49,52)
*)

(* type error slice
(21,3)-(21,30)
(21,16)-(21,28)
(21,20)-(21,28)
(21,27)-(21,28)
(45,11)-(45,22)
(45,11)-(45,61)
(45,23)-(45,61)
*)
