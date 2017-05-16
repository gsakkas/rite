
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Sqrt of expr
  | Abs of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Sqrt e -> sqrt (abs_float (eval (e, x, y)))
  | _ -> failwith "we are seriously writing a lisp compiler god save us all";;

let rec ffor (low,high,f) =
  if low > high then () else (let _ = f low in ffor ((low + 1), high, f));;

let toIntensity z = int_of_float (127.5 +. (127.5 *. z));;

let toReal (i,n) = (float_of_int i) /. (float_of_int n);;

let rec build (rand,depth) =
  match depth with | 0 -> 0 | _ -> build (rand, (depth - 1));;

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
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e' -> Printf.sprintf "sin(pi*%s)" (exprToString e')
  | Cosine e' -> Printf.sprintf "cos(pi*%s)" (exprToString e')
  | Average (e1,e2) ->
      Printf.sprintf "((%s+%s)/2)" (exprToString e1) (exprToString e2)
  | Times (e1,e2) ->
      Printf.sprintf "%s*%s" (exprToString e1) (exprToString e2)
  | Thresh (e1,e2,e3,e4) ->
      Printf.sprintf "(%s<%s?%s:%s)" (exprToString e1) (exprToString e2)
        (exprToString e3) (exprToString e4)
  | Sqrt e -> Printf.sprintf "(%s)^0.5" (exprToString (Abs e))
  | Abs e -> Printf.sprintf "|%s|" (exprToString e)
  | _ -> failwith "are we writing a lisp compiler now";;

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
