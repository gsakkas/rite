
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Tan of expr
  | Average of expr* expr
  | Times of expr* expr
  | TimesMod of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | Thresh (w,t,u,z) ->
      if (eval (w, x, y)) < (eval (t, x, y))
      then eval (u, x, y)
      else eval (z, x, y)
  | TimesMod (w,t,u) ->
      ((eval (w, x, y)) *. (eval (t, x, y))) /.
        (mod_float ((eval (w, x, y)) *. (eval (t, x, y))) (eval (u, x, y)))
  | Times (t,u) -> (eval (t, x, y)) *. (eval (u, x, y))
  | Average (t,u) -> ((eval (t, x, y)) +. (eval (u, x, y))) /. 2.0
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | Tan t -> tan (pi *. (eval (t, x, y)))
  | VarX  -> x
  | VarY  -> y;;

let rec ffor (low,high,f) =
  if low > high then () else (let _ = f low in ffor ((low + 1), high, f));;

let toIntensity z = int_of_float (127.5 +. (127.5 *. z));;

let toReal (i,n) = (float_of_int i) /. (float_of_int n);;

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Tan of expr
  | Average of expr* expr
  | Times of expr* expr
  | TimesMod of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildTan e = Tan e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    match rand (0, 6) with
    | 1 -> buildTan (build (rand, (depth - 1)))
    | 2 -> buildSine (build (rand, (depth - 1)))
    | 3 -> buildCosine (build (rand, (depth - 1)))
    | 4 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 5 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 6 ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | _ -> buildY ()
  else
    (match rand (0, 1) with
     | 0 -> buildX ()
     | 1 -> buildY ()
     | _ -> buildX ());;

let emitColor (f1,f2,f3,n,name) =
  let fname = "art_c_" ^ name in
  let chan = open_out (fname ^ ".ppm") in
  let n2p1 = (n * 2) + 1 in
  let _ = output_string chan (Format.sprintf "P6 %d %d 255\n" n2p1 n2p1) in
  let _ =
    ffor
      ((- n), n,
        (fun ix  ->
           ffor
             ((- n), n,
               (fun iy  ->
                  let x = toReal (ix, n) in
                  let y = toReal (iy, n) in
                  let z1 = f1 (x, y) in
                  let z2 = f2 (x, y) in
                  let z3 = f3 (x, y) in
                  let iz1 = toIntensity z1 in
                  let iz2 = toIntensity z2 in
                  let iz3 = toIntensity z3 in
                  output_char chan (char_of_int iz1);
                  output_char chan (char_of_int iz2);
                  output_char chan (char_of_int iz3))))) in
  close_out chan;
  ignore (Sys.command ("convert " ^ (fname ^ (".ppm  " ^ (fname ^ ".jpg")))));
  ignore (Sys.command ("rm " ^ (fname ^ ".ppm")));;

let eval_fn e (x,y) =
  let rv = eval (e, x, y) in assert (((-1.0) <= rv) && (rv <= 1.0)); rv;;

let rec exprToString e =
  match e with
  | Thresh (w,x,y,z) ->
      "(" ^
        ((exprToString w) ^
           ("<" ^
              ((exprToString x) ^
                 ("?" ^ ((exprToString y) ^ (":" ^ ((exprToString z) ^ ")")))))))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Cosine x -> "cos(pi*" ^ ((exprToString x) ^ ")")
  | Sine x -> "sin(pi*" ^ ((exprToString x) ^ ")")
  | Tan x -> "tan(pi*" ^ ((exprToString x) ^ ")")
  | TimesMod (x,y,z) ->
      "((" ^
        ((exprToString x) ^
           ("*" ^ ((exprToString y) ^ (")%" ^ ((exprToString z) ^ ")")))))
  | VarX  -> "x"
  | VarY  -> "y";;

let makeRand (seed1,seed2) =
  let seed = Array.of_list [seed1; seed2] in
  let s = Random.State.make seed in
  fun (x,y)  -> x + (Random.State.int s (y - x));;

let doRandomColor (depth,seed1,seed2) =
  let g = makeRand (seed1, seed2) in
  let e1 = build (g, depth) in
  let e2 = build (g, depth) in
  let e3 = build (g, depth) in
  let _ = Format.printf "red   = %s \n" (exprToString e1) in
  let _ = Format.printf "green = %s \n" (exprToString e2) in
  let _ = Format.printf "blue  = %s \n" (exprToString e3) in
  let f1 = eval_fn e1 in
  let f2 = eval_fn e2 in
  let f3 = eval_fn e3 in
  let n = 150 in
  let name = Format.sprintf "%d_%d_%d" depth seed1 seed2 in
  emitColor (f1, f2, f3, n, name);;
