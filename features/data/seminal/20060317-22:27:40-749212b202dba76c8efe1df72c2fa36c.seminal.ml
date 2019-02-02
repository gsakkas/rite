
exception Unimplemented
exception AlreadyDone

(*** part a ***)
type move = Home 
          | Forward of float
          | Turn of float
          | For of (int*(move list))

let pi = 4.0 *. atan 1.0

(*** part b ***)
let makePoly sides len = 
  let sided = sides in
  let d = 2.0 *. pi /. (float_of_int(sides)) in
  For (sided, [Forward len; Turn d])


(*** part c ***)
let advanceX x rad dir = x +. (rad *. (cos dir))
let advanceY y rad dir = y +. (rad *. (sin dir))

let interpLarge (movelist : move list) : (float*float) list = 
  let rec loop movelist x y dir acc =
    match movelist with
    | [] -> acc
    | Home::tl          -> 
        loop tl 0.0 0.0 0.0 ((0.0,0.0)::acc)
    | (Forward f)::tl   -> 
        let xnew = advanceX x f dir in
        let ynew = advanceY y f dir in
        loop tl xnew ynew dir ((xnew, ynew)::acc)
    | (Turn f)::tl      -> 
        let dirnew = mod_float (dir +. f) (2.0 *. pi) in
        loop tl x y dirnew acc
    | (For (i,lst))::tl -> 
        match i with
        | 0 -> loop tl x y dir acc
        | i -> loop (lst@((For ((i-1),lst))::tl)) x y dir acc
  in List.rev (loop movelist 0.0 0.0 0.0 [(0.0,0.0)])

(*** part d ***)
let interpSmall (movelist : move list) : (float*float) list = 
  let interpSmallStep movelist x y dir : move list * float * float * float = 
    match movelist with
    | []                -> raise AlreadyDone
    | Home::tl          -> 
          (tl, 0.0, 0.0, 0.0)
    | (Forward f)::tl   -> 
          (tl, (advanceX x f dir), (advanceY y f dir), dir)
    | (Turn f)::tl      -> 
          (tl, x, y, mod_float (dir +. f) (2.0 *. pi))          
    | (For (i,lst))::tl ->
print_endline ((string_of_int i)^" "^(string_of_int (List.length lst))^" "^(string_of_int (List.length tl)));
          match (i-1) with
          | 0 -> (tl, x, y, dir)
          | j -> ((lst@((For (j,lst))::tl)), x, y, dir)
  in
  let rec loop movelist x y dir acc =
    let step = interpSmallStep movelist x y dir in
(
    match step with
    | ([], xnew, ynew, dirnew)  -> print_endline "End list"
    | (Home::lst, xnew, ynew, dirnew)  -> print_endline ("Home "^(string_of_float xnew)^" "^(string_of_float ynew)^" "^(string_of_float dirnew))
    | ((Forward f)::lst, xnew, ynew, dirnew) -> print_endline "Forward"
    | ((Turn f)::lst, xnew, ynew, dirnew) -> print_endline "Turn"
    | ((For (i,tl))::lst, xnew, ynew, dirnew) -> print_endline "For"
;
    match step with
    | ([], xnew, ynew, dirnew)  -> (xnew,ynew)::acc
    | (lst, xnew, ynew, dirnew) -> loop lst xnew ynew dirnew ((xnew, ynew)::acc)
)
  in 
  List.rev (loop movelist 0.0 0.0 0.0 [(0.0,0.0)])

(*** part e ***)

(* ##################################################################### *)

(*** part f ***)
let interpTrans movelist : float->float->float-> (float * float) list * float= 
  let compose f1 f2 = raise Unimplemented (* ######################### *)
  in
  match movelist with
    [] -> raise Unimplemented
  | Home::tl -> raise Unimplemented
  | _ -> raise Unimplemented  
  (* ########################### *)

(*** possibly helpful testing code ***)

(* ######################################################################## *)
(* ############################################# *)
let example_logo_prog = [makePoly 4 4.0; Home; makePoly 3 3.0]

(*let ansL = interpLarge example_logo_prog*)
let ansS = interpSmall example_logo_prog
(*let ansI = (0.0,0.0)::(fst ((interpTrans example_logo_prog) 0.0 0.0 0.0))*)

let rec pr lst =
  match lst with
    [] -> ()
  | (x,y)::tl -> 
      print_string("(" ^ (string_of_float x) ^ "," ^ (string_of_float y) ^ ")");
      pr tl

let _ = 
(* ########################### *)
  pr ansS; print_newline ();
(* ########################### *)

