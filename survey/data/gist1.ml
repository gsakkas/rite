type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr * expr
  | Times of expr * expr
  | Thresh of expr * expr * expr * expr
let buildSine e = Sine e
let buildX () = VarX
let buildY () = VarY
let rec build (rand,depth) =
  match rand (0, depth) with
  | 0 -> buildX
  | 1 -> buildY
  | 2 -> buildSine buildX
  | _ -> buildX
