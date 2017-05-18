
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  let rec evalhelper e x y =
    match e with
    | VarX  -> x
    | VarY  -> y
    | Sine p1 -> sin (pi *. (evalhelper p1 x y))
    | Cosine p1 -> cos (pi *. (evalhelper p1 x y))
    | Average (p1,p2) -> ((evalhelper p1 x y) +. (evalhelper p2 x y)) /. 2.0
    | Times (p1,p2) -> (evalhelper p1 x y) *. (evalhelper p2 x y)
    | Thresh (p1,p2,p3,p4) ->
        if (evalhelper p1 x y) < (evalhelper p2 x y)
        then evalhelper p3 x y
        else evalhelper p4 x y in
  evalhelper e x y;;

let rec ffor (low,high,f) =
  if low > high then () else (let _ = f low in ffor ((low + 1), high, f));;

let toIntensity z = int_of_float (127.5 +. (127.5 *. z));;

let toReal (i,n) = (float_of_int i) /. (float_of_int n);;

let rec build (rand,depth) =
  let rec buildhelper num depth expr =
    match num with
    | 0 -> if (rand 0 1) = 0 then expr ^ "VarX" else expr ^ "VarY"
    | 1 ->
        if (rand 0 1) = 0
        then expr ^ ("Sine(" ^ ((buildhelper 0 (depth - 1) expr) ^ ")"))
        else expr ^ ("Cosine(" ^ ((buildhelper 0 (depth - 1) expr) ^ ")"))
    | 2 ->
        if (rand 0 1) = 0
        then
          expr ^
            ("((" ^
               ((buildhelper (rand 0 (depth - 1)) (depth - 1) expr) ^
                  ("+" ^
                     ((buildhelper (rand 0 (depth - 1)) (depth - 1) expr) ^
                        ")/2)"))))
        else
          expr ^
            ((buildhelper (rand 0 (depth - 1)) (depth - 1) expr) ^
               ("*" ^ (buildhelper (rand 0 (depth - 1)) (depth - 1) expr)))
    | 4 ->
        expr ^
          ("(" ^
             ((buildhelper (rand 0 (depth - 1)) (depth - 1) expr) ^
                ("<" ^
                   ((buildhelper (rand 0 (depth - 1)) (depth - 1) expr) ^
                      ("?" ^
                         ((buildhelper (rand 0 (depth - 1)) (depth - 1) expr)
                            ^
                            (":" ^
                               ((buildhelper (rand 0 (depth - 1)) (depth - 1)
                                   expr)
                                  ^ ")")))))))) in
  buildhelper (rand 0 4) depth "";;

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
  let rec eTShelper e expr =
    match e with
    | VarX  -> expr ^ "x"
    | VarY  -> expr ^ "y"
    | Sine p1 -> expr ^ ("sin(pi*" ^ ((eTShelper p1 expr) ^ ")"))
    | Cosine p1 -> expr ^ ("cos(pi*" ^ ((eTShelper p1 expr) ^ ")"))
    | Average (p1,p2) ->
        expr ^
          ("((" ^
             ((eTShelper p1 expr) ^ ("+" ^ ((eTShelper p2 expr) ^ ")/2)"))))
    | Times (p1,p2) ->
        expr ^ ((eTShelper p1 expr) ^ ("*" ^ (eTShelper p2 expr)))
    | Thresh (p1,p2,p3,p4) ->
        expr ^
          ("(" ^
             ((eTShelper p1 expr) ^
                ("<" ^
                   ((eTShelper p2 expr) ^
                      ("?" ^
                         ((eTShelper p3 expr) ^
                            (":" ^ ((eTShelper p4 expr) ^ ")")))))))) in
  eTShelper e "";;

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
