
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Cube of expr
  | Addition of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> eval (a, (sin (pi *. x)), (sin (pi *. y)))
  | Cosine a -> eval (a, (cos (pi *. x)), (cos (pi *. y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Cube a -> ((eval (a, x, y)) *. (eval (a, x, y))) *. (eval (a, x, y))
  | Addition (a,b) -> (eval (a, x, y)) +. (eval (b, x, y));;

let rec ffor (low,high,f) =
  if low > high then () else (let _ = f low in ffor ((low + 1), high, f));;

let toIntensity z = int_of_float (127.5 +. (127.5 *. z));;

let toReal (i,n) = (float_of_int i) /. (float_of_int n);;

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Cube of expr
  | Addition of expr* expr;;

let buildAddition (e1,e2) = Addition (e1, e2);;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildCube e = Cube e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then match rand (1, 3) with | 1 -> buildX () | 2 -> buildY ()
  else
    (match rand (1, 10) with
     | 1 -> buildX ()
     | 2 -> buildY ()
     | 3 -> buildSine (build (rand, (depth - 1)))
     | 4 -> buildCosine (build (rand, (depth - 1)))
     | 5 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 7 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 8 -> buildCube (build (rand, (depth - 1)))
     | 9 ->
         buildAddition
           ((build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

let emitGrayscale (f,n,name) =
  let fname = "art_g_" ^ name in
  let chan = open_out (fname ^ ".pgm") in
  let n2p1 = (n * 2) + 1 in
  let _ = output_string chan (Format.sprintf "P5 %d %d 255\n" n2p1 n2p1) in
  let _ =
    ffor
      ((- n), n,
        (fun ix  ->
           ffor
             ((- n), n,
               (fun iy  ->
                  let x = toReal (ix, n) in
                  let y = toReal (iy, n) in
                  let z = f (x, y) in
                  let iz = toIntensity z in output_char chan (char_of_int iz))))) in
  close_out chan;
  ignore (Sys.command ("convert " ^ (fname ^ (".pgm " ^ (fname ^ ".jpg")))));
  ignore (Sys.command ("rm " ^ (fname ^ ".pgm")));;

let eval_fn e (x,y) =
  let rv = eval (e, x, y) in assert (((-1.0) <= rv) && (rv <= 1.0)); rv;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine a -> "sin(pi*" ^ ((exprToString a) ^ ")")
  | Cosine a -> "cos(pi*" ^ ((exprToString a) ^ ")")
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ ")/2)")))
  | Times (a,b) -> (exprToString a) ^ ("*" ^ (exprToString b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")")))))))
  | _ -> "_"
  | Cube a ->
      "(" ^
        ((exprToString a) ^
           ("*" ^ ((exprToString a) ^ ("*" ^ ((exprToString a) ^ ")")))))
  | Addition (a,b) ->
      "(" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ ")")));;

let makeRand (seed1,seed2) =
  let seed = Array.of_list [seed1; seed2] in
  let s = Random.State.make seed in
  fun (x,y)  -> x + (Random.State.int s (y - x));;

let doRandomGray (depth,seed1,seed2) =
  let g = makeRand (seed1, seed2) in
  let e = build (g, depth) in
  let _ = print_string (exprToString e) in
  let f = eval_fn e in
  let n = 150 in
  let name = Format.sprintf "%d_%d_%d" depth seed1 seed2 in
  emitGrayscale (f, n, name);;
