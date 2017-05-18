
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildSine e = Sine e;;

let rec build (rand,depth) =
  match rand with
  | 1 -> buildSine build (rand, depth)
  | _ -> failwith "rainbow";;
