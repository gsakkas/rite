
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

(*
#####################
#################
################################
###############################################################
#########################################################
#########################################################

##########################
#################
#######################################################
###########################################
*)

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
          match (i) with
          | 0 -> (tl, x, y, dir)
          | j -> ((lst@((For ((j-1),lst))::tl)), x, y, dir)
  in
  let rec loop movelist x y dir acc =
    let step = interpSmallStep movelist x y dir in
      let accnew movelist xnew ynew acc =
        match movelist with
        | (Home::_)        -> (xnew, ynew)::acc
        | ((Forward f)::_) -> (xnew, ynew)::acc
        | _ -> acc
    in
    match step with
    | ([], xnew, ynew, dirnew)        -> accnew movelist xnew ynew acc
    | (lst, xnew, ynew, dirnew)       -> loop lst xnew ynew dirnew (accnew movelist xnew ynew acc)
  in 
  List.rev (loop movelist 0.0 0.0 0.0 [(0.0,0.0)])

(*** part e ***)

(* ######################################################################



*)

(*** part f ***)
let rec interpTrans movelist : float->float->float-> (float * float) list * float= 
  let compose f1 f2 = 
     fun x y d -> 
       let compose2 f2 x1 y1 d1 lst1 =
         match (f2 x1 y1 d1) with
         | (lst2, d2) -> (lst1@lst2, d2)
       in
       match (f1 x y d) with
       | ([], d1)            -> compose2 f2 x  y  d1 []
       | ((x1, y1)::tl1, d1) -> compose2 f2 x1 y1 d1 ((x1,y1)::tl1)
  in
  match movelist with
  | []                 -> fun x y d -> ([],d)
  | Home::tl           -> 
      compose (fun x y d -> ([(0.0,0.0)],0.0)) (interpTrans tl)
  | (Forward f)::tl    -> 
     compose 
       (fun x y d -> ([(advanceX x f d, advanceY y f d)], d))
       (interpTrans tl)
  | (Turn f)::tl       ->
     compose 
       (fun x y d -> ([], mod_float (d +. f) (2.0 *. pi)))
       (interpTrans tl)
  | (For (i, lst)::tl) ->
     let internal = interpTrans lst in
     let rec funfor i = 
       match i with
       | 0 -> internal
       | i -> compose internal (funfor (i-1)) 
     in
     compose (funfor (i-1)) (interpTrans tl)


(*** possibly helpful testing code ***)

(* ######################################################################## *)
(* ############################################# *)
let example_logo_prog = [makePoly 4 4.0; Home; makePoly 3 3.0]
let example_logo_prog = [makePoly 4 0.0; Home; makePoly 3 3.0]
let example_logo_prog = [For (10, [Turn 10])]


let ansL = interpLarge example_logo_prog
let ansS = interpSmall example_logo_prog
let ansI = (0.0,0.0)::(fst ((interpTrans example_logo_prog) 0.0 0.0 0.0))

let rec pr lst =
  match lst with
    [] -> ()
  | (x,y)::tl -> 
      print_string("(" ^ (string_of_float x) ^ "," ^ (string_of_float y) ^ ")");
      pr tl

let _ = 
  pr ansL; print_newline (); 
  pr ansS; print_newline ();
  pr ansI; print_newline ();

