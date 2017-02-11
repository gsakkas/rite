
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then
    let num = rand (1, 10) in
    (if (rand mod 2) = 0 then buildX () else buildY ())
  else
    (let num = rand (1, 10) in
     match num with | _ -> build (rand, (depth - 1)));;
